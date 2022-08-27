import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/blocList_api/blockList_api.dart';
import 'package:rainbow/common/helper.dart';
import 'package:rainbow/model/blockList_model.dart';
import 'package:rainbow/model/friendPostView_Model.dart';
import 'package:rainbow/model/listOfFriendRequest_model.dart';
import 'package:rainbow/model/listUserTag_model.dart';
import 'package:rainbow/model/myPostList_model.dart';
import 'package:rainbow/model/postCommentList_model.dart';
import 'package:rainbow/model/postLike_model.dart';
import 'package:rainbow/model/postView_model.dart';
import 'package:rainbow/model/sharePost_model.dart';
import 'package:rainbow/model/unLikePost_model.dart';
import 'package:rainbow/screens/Home/Story/friendStory_api/friendStory_api.dart';
import 'package:rainbow/screens/Home/addStroy/addStory_screen.dart';
import 'package:rainbow/screens/Home/home_screen.dart';
import 'package:rainbow/screens/Home/myPost_Api/myPost_api.dart';
import 'package:rainbow/screens/Home/my_story/my_story_controller.dart';
import 'package:rainbow/screens/Home/my_story/my_story_screen.dart';
import 'package:rainbow/screens/Home/settings/connections/connections_controller.dart';
import 'package:rainbow/screens/Home/view_story/view_story_controller.dart';
import 'package:rainbow/screens/Home/view_story/view_story_screen.dart';
import 'package:rainbow/screens/Home/view_story/widgets/postLike_listScreen.dart';
import 'package:rainbow/screens/Home/view_story/widgets/postView_bottomshit.dart';
import 'package:rainbow/screens/Profile/profile_controller.dart';
import 'package:rainbow/screens/Profile/widget/listOfFriendRequest_api/listOfFriendRequest_api.dart';
import 'package:rainbow/screens/auth/register/list_nationalites/list_nationalites_api.dart';
import 'package:rainbow/screens/auth/registerfor_adviser/listOfCountry/listOfCountryApi.dart';
import 'package:rainbow/screens/notification/notification_controller.dart';
import 'package:rainbow/screens/notification/notification_screen.dart';
import 'package:rainbow/service/pref_services.dart';
import 'package:rainbow/utils/pref_keys.dart';
import 'package:uni_links/uni_links.dart';

class HomeController extends GetxController {
  RxBool loader = false.obs;
  ProfileController controller = Get.put(ProfileController());
  ListOfFriendRequestModel listOfFriendRequestModel =
      ListOfFriendRequestModel();
  ViewStoryController viewStoryController = Get.put(ViewStoryController());
  List<bool> isAd = List.generate(10, (index) => Random().nextInt(2) == 1);
  MyStoryController myStoryController = Get.put(MyStoryController());

  // RefreshController? refreshController;
  NotificationsController notificationsController =
      Get.put(NotificationsController());
  MyPostListModel myPostListModel = MyPostListModel();
  TextEditingController comment = TextEditingController();
  List<UserData> tagUserList = [];
  PostUnlikeModel postUnlikeModel = PostUnlikeModel();
  PostLikeModel postLikeModel = PostLikeModel();
  BlockListModel blockListModel = BlockListModel();
  SharePostModel sharePostModel = SharePostModel();
  PostViewModel postViewModel = PostViewModel();
  FriendPostViewModel friendPostViewModel = FriendPostViewModel();
  PostCommentListModel postCommentListModel = PostCommentListModel();
  String? deepLinkPath;
  List<FriendPost> friendPostListData = [];
  List listOfUserView = [];
  String? address;
  String? addCountry;
  String? addCity;
  String? addStreet;

  ScrollController scrollController = ScrollController();
  int page = 1;
  int limit = 10;

  // final storyController = EditStoryController();
  ConnectionsController connectionsController =
      Get.put(ConnectionsController());

  @override
  void onInit() async {
    await init();
    scrollController.addListener(pagination);
    await deepLinkInt();
    update(['home']);
    super.onInit();
  }

  void pagination() async {
    print("Hello");
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      await friendPostData();
    }
    update(['home']);
  }

  Future getCurrentLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    // loader.value = true;
    if (permission == LocationPermission.denied) {
      LocationPermission result = await Geolocator.requestPermission();
      if(result == LocationPermission.always ||
          result == LocationPermission.whileInUse){
        getCurrentLocation();
      }
    } else {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      List<Placemark> placemarks =
      await placemarkFromCoordinates(position.latitude, position.longitude);

      Placemark place = placemarks[0];
      addCity = place.locality;
      addCountry = place.country;
      addStreet = place.street;
      address =
      '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
      print(
          "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<$address>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
      update(["advertiser"]);
    }
    // loader.value = false;
  }

  Future<void> countryName() async {
    try {
      await ListOfCountryApi.postRegister()
          .then((value) => listCountryModel = value!);
      debugPrint(listCountryModel.toJson().toString());
      getCountry();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void onNewStoryTap() {
    // if (myStoryController.myStoryModel.data!.isNotEmpty) {
    Get.to(() => const MyStoryScreen());
    /*   } else {
      Get.to(() => AddStoryScreen());
    }*/
    // Get.to(() => AddStoryScreen());
  }

  Future<void> countryNationalites() async {
    try {
      await ListOfNationalitiesApi.postRegister()
          .then((value) => listNationalities = value!);
      print(listNationalities);
      getCountryNation();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> blockListDetailes() async {
    try {
      await BlockListApi.postRegister()
          .then((value) => blockListModel = value!);
      print(blockListModel);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> myStoryList() async {
    try {
      myPostListModel = await FriendStoryApi.getMyPostList();
      update(['home']);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  List<PostLikeUser>? postLikeUser = [];
  List<PostUser>? postViewUser = [];

  /// post like list
  void onLikeBtnTap({required FriendPost friendPost, String? postId}) {
    postLikeUser = friendPost.postLikeUser ?? [];
    print(postLikeUser);
    Get.bottomSheet(
      const PostLikeListScreen(),
      isScrollControlled: true,
    ).then((value) {});
  }

  void onPostViewUser({required FriendPost friendPost, String? postId}) {
    postViewUser = friendPost.postViewUser ?? [];
    print(postViewUser);
    Get.bottomSheet(
      const PostViewBottomScreen(),
      isScrollControlled: true,
    ).then((value) {});
  }

  ///On Share

  Future<void> deepLinkInt() async {
    Uri? uri = await getInitialUri();
    if (uri != null) {
      deepLinkPath = uri.path;
    }
    uriLinkStream.listen((event) {
      if (event != null) {
        Get.to(() => HomeScreen());
      }
    });
  }

  Future<void> share(String? id) async {
    await FlutterShare.share(
        title: 'rainbow',
        text: 'rainbow',
        linkUrl: "https://www.rainbow.com/rainbow/$id",
        chooserTitle: 'rainbow');
  }

  Future<void> sharePostData(String id) async {
    try {
      loader.value = true;
      sharePostModel = await MyPostApi.sharPostApi(id);
      await friendPostDataWithOutPagination();
      update(['home']);
      loader.value = false;
    } catch (e) {
      debugPrint(e.toString());
      loader.value = false;
    }
  }

  Future<void> likePostData(String id) async {
    try {
      loader.value = true;
      postLikeModel = await MyPostApi.postLikeApi(id);
      await friendPostDataWithOutPagination();
      update(['home']);
      loader.value = false;
    } catch (e) {
      loader.value = false;
      debugPrint(e.toString());
    }
  }

  Future<void> unLikePostData(String id) async {
    try {
      loader.value = true;
      postUnlikeModel = await MyPostApi.postUnLikeApi(id);
      await friendPostDataWithOutPagination();
      update(['home']);
      loader.value = false;
    } catch (e) {
      debugPrint(e.toString());
      loader.value = false;
    }
  }

  Future<void> postViewData(String id) async {
    if (listOfUserView.contains(id)) {
      return;
    }
    try {
      postViewModel = await MyPostApi.postViewApi(id);
      listOfUserView.add(id);
      await friendPostDataWithOutPagination();
      update(['home']);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> friendPostData() async {
    try {
      loader.value = true;
      friendPostViewModel = await MyPostApi.friendPostApi(page, limit);
      page++;
      friendPostListData.addAll(friendPostViewModel.data!);
      update(['home']);
      loader.value = false;
    } catch (e) {
      debugPrint(e.toString());
      loader.value = false;
    }
  }

  Future<void> friendPostDataWithOutPagination({int? pageLength}) async {
    try {
      loader.value = true;

      friendPostViewModel =
          await MyPostApi.friendPostApi(1, pageLength ?? friendPostListData.length);
      friendPostListData = friendPostViewModel.data!;
      update(['home']);

      loader.value = false;
    } catch (e) {
      debugPrint(e.toString());
      loader.value = false;
    }
  }

  Future<void> commentPostListData(String idPost) async {
    try {
      loader.value = true;
      postCommentListModel = await MyPostApi.commentPostListApi(idPost);
      update(['home']);
      loader.value = false;
    } catch (e) {
      loader.value = false;
      debugPrint(e.toString());
    }
  }

  Future<void> listOfFriedRequestDetails() async {
    try {
      changeLoader(true);
      listOfFriendRequestModel = (await ListOfFriendRequestApi.postRegister())!;
      update(["connections"]);
      changeLoader(false);
    } catch (e) {
      changeLoader(false);
    }
  }

  Future<void> refreshCode() async {
    await controller.viewProfileDetails();
    await onStory();
    notificationsController.getNotifications();
    friendPostListData = [];
    await friendPostDataWithOutPagination();
    await connectionsController.callRequestApi();
  }

  Future<void> init() async {
    changeLoader(true);
    loader.value = true;
    await controller.viewProfileDetails();
    await friendPostData();
    await onStory();
    countryName();
    countryNationalites();
    notificationsController.getNotifications();
    await friendPostDataWithOutPagination();
    await connectionsController.callRequestApi();
    changeLoader(false);
  }

  Future<void> onStory() async {
    await viewStoryController.friendStoryApiData();
    // await myStoryController.init();
    update(['home']);
  }

  Future<void> myStoryOnTap() async {
    Get.to(() => AddStoryScreen());
    /*MyStoryController myStoryController = Get.put(MyStoryController());
    loader.value = true;
    await myStoryController.init();
    loader.value = false;
    if (myStoryController.myStoryModel.data!.isNotEmpty) {
      Get.to(() => const MyStoryScreen());
    } else {
      Get.to(() => AddStoryScreen());
    }*/
  }

  Future<void> onRefresh() async {
    /*await init()*/
    await refreshCode();
    // refreshController!.refreshCompleted();
  }

  void changeLoader(bool status) {
    /*if (refreshController == null || refreshController!.headerMode == null) {
      loader.value = status;
      return;
    }
    if (refreshController!.headerMode!.value == RefreshStatus.refreshing) {
      return;
    }
    loader.value = status;*/
  }

  void onNotyIconBtnTap() {
    NotificationsController notificationsController =
        Get.put(NotificationsController());
    notificationsController.init();
    Get.to(() => NotificationScreen());
  }

  double calculateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  Future<void> onFriedStoryTap(int index) async {
    viewStoryController.currentPage = index;
    viewStoryController.storyIndex = 0;
    viewStoryController.init();
    /*loader.value = true;
    for (var data in viewStoryController.friendStoryModel.data!) {
      for (var story in data.storyList!) {
        String url = story.storyItem.toString();
        await DefaultCacheManager().downloadFile(url);
      }
    }
    loader.value = false;*/
    Get.to(() => const ViewStoryScreen());
  }

  String timeAgo(DateTime d) {
    Duration diff = DateTime.now().difference(d);
    if (diff.inDays > 365) {
      return "${(diff.inDays / 365).floor()} ${(diff.inDays / 365).floor() == 1 ? "year" : "years"} ago";
    }
    if (diff.inDays > 30) {
      return "${(diff.inDays / 30).floor()} ${(diff.inDays / 30).floor() == 1 ? "month" : "months"} ago";
    }
    if (diff.inDays > 7) {
      return "${(diff.inDays / 7).floor()} ${(diff.inDays / 7).floor() == 1 ? "week" : "weeks"} ago";
    }
    if (diff.inDays > 0) {
      return "${diff.inDays} ${diff.inDays == 1 ? "day" : "days"} ago";
    }
    if (diff.inHours > 0) {
      return "${diff.inHours} ${diff.inHours == 1 ? "hour" : "hours"} ago";
    }
    if (diff.inMinutes > 0) {
      return "${diff.inMinutes} ${diff.inMinutes == 1 ? "minute" : "minutes"} ago";
    }
    return "just now";
  }

  bool isToday(DateTime time) {
    DateTime now = DateTime.now();

    if (now.day == time.day &&
        now.month == time.month &&
        now.year == time.year) {
      return true;
    } else {
      return false;
    }
  }
}
