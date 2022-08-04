import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rainbow/common/blocList_api/blockList_api.dart';
import 'package:rainbow/common/helper.dart';
import 'package:rainbow/common/popup.dart';
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
import 'package:rainbow/screens/Profile/profile_controller.dart';
import 'package:rainbow/screens/Profile/widget/listOfFriendRequest_api/listOfFriendRequest_api.dart';
import 'package:rainbow/screens/auth/register/list_nationalites/list_nationalites_api.dart';
import 'package:rainbow/screens/auth/registerfor_adviser/listOfCountry/listOfCountryApi.dart';
import 'package:rainbow/screens/notification/notification_controller.dart';
import 'package:rainbow/screens/notification/notification_screen.dart';
import 'package:uni_links/uni_links.dart';

class HomeController extends GetxController {
  RxBool loader = false.obs;
  ProfileController controller = Get.put(ProfileController());
  ListOfFriendRequestModel listOfFriendRequestModel =
      ListOfFriendRequestModel();
  ViewStoryController viewStoryController = Get.put(ViewStoryController());
  List<bool> isAd = List.generate(10, (index) => Random().nextInt(2) == 1);
  MyStoryController myStoryController = Get.put(MyStoryController());
  RefreshController? refreshController;
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

  // int page = 1;
  // int totalPages = 0;
  // bool isLoading = false;
  // ScrollController scrollController = ScrollController();
  // final storyController = EditStoryController();
  ConnectionsController connectionsController =
      Get.put(ConnectionsController());

  @override
  Future<void> onInit() async {
    /*await deepLinkInt();*/
    init();
    // scrollController.addListener(pagination);
    update(['home']);
    super.onInit();
  }

  // void pagination() {
  //   if ((scrollController.position.pixels ==
  //           scrollController.position.maxScrollExtent) &&
  //       (friendPostViewModel.data!.length < totalPages)) {
  //     isLoading = true;
  //     friendPostData();
  //     isLoading = false;
  //     update(['home']);
  //   }
  // }

  Future<void> countryName() async {
    try {
      await ListOfCountryApi.postRegister()
          .then((value) => listCountryModel = value!);
      debugPrint(listCountryModel.toJson().toString());
      getCountry();
    } catch (e) {
      errorToast(e.toString());
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
  ///On Share




  Future<void> deepLinkInt() async {
    Uri? uri = await getInitialUri();
    if (uri != null) {
      deepLinkPath = uri.path;
    }
    uriLinkStream.listen((event) {
      if (event != null) {
      Get.to(()=> HomeScreen());
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
      await friendPostData();
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
      await friendPostData();
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
      await friendPostData();
      update(['home']);
      loader.value = false;
    } catch (e) {
      debugPrint(e.toString());
      loader.value = false;
    }
  }

  Future<void> postViewData(String id) async {
    try {
      postViewModel = await MyPostApi.postViewApi(id);
      update(['home']);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> friendPostData() async {
    try {
      loader.value = true;
      friendPostViewModel = await MyPostApi.friendPostApi();
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
  Future<void> refreshCode()async {
    await controller.viewProfileDetails();
    await onStory();
    notificationsController.getNotifications();
    await friendPostData();
    await connectionsController.callRequestApi();
  }

  Future<void> init() async {
    changeLoader(true);
    countryName();
    countryNationalites();
    // await blockListDetailes();
    // await listOfFriedRequestDetails();
    await controller.viewProfileDetails();
    await onStory();
    notificationsController.getNotifications();
    await friendPostData();
    await connectionsController.callRequestApi();
    changeLoader(false);
    // await myStoryList();
    // viewStoryController.friendStoryApiData();
    // loader.value = true;
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
    refreshController!.refreshCompleted();
  }

  void changeLoader(bool status) {
    if (refreshController == null || refreshController!.headerMode == null) {
      loader.value = status;
      return;
    }
    if (refreshController!.headerMode!.value == RefreshStatus.refreshing) {
      return;
    }
    loader.value = status;
  }

  void onNotyIconBtnTap() {
    NotificationsController notificationsController =
        Get.put(NotificationsController());
    notificationsController.init();
    Get.to(() => NotificationScreen());
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
}
