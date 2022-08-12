import 'dart:math';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:rainbow/model/ListUserProfileModel.dart';
import 'package:rainbow/screens/Home/settings/connections/connections_profile/api/OtherProfileApi.dart';
import 'package:rainbow/screens/Home/settings/connections/connections_profile/connections_profile_controller.dart';
import 'package:rainbow/screens/Home/settings/connections/connections_profile/connections_profile_screen.dart';
import 'package:rainbow/screens/Profile/acceptFriendRequest_api/accaeptFriedRequest_api.dart';
import 'package:rainbow/screens/Profile/sendFriendRequest_api/sendFriendRequest_api.dart';
import 'package:rainbow/screens/Profile/unFriendRequest_api/unFriendRequest_api.dart';
import 'package:rainbow/screens/Profile/widget/block_unblock%20_Api/block_api.dart';
import 'package:rainbow/screens/Profile/widget/block_unblock%20_Api/unblock_api.dart';
import 'package:rainbow/screens/Search/ListUserProfile_api/listUserProfile_api.dart';
import 'package:rainbow/screens/Search/advance_search/advance_search_screen.dart';
import 'package:rainbow/utils/asset_res.dart';

class SearchController extends GetxController {
  RxBool loader = false.obs;
  bool advance = false;
  ListUseProfileModel listUseProfileModel = ListUseProfileModel();

  // RxBool connect = false.obs;
  TextEditingController searchBar = TextEditingController();
  List<ListUserData> data = [];
  int page = 1;
  int limit = 3;
  ScrollController scrollController = ScrollController();
  List advanceSearch = [
    "Surrogate Mom  ",
    "Sperm Donor",
    "Egg Donor",
    "Intended Parents",
    "Retired Surrogate"
  ];

  String keyword = '';

  void onScreenTap() {
    advance = false;
    /* listConnectBlock = List.filled(listUserData.length, false);*/
    update(["Search"]);
  }

  double? latitude;
  double? longitude;
  Position? position;

  List<bool> listConnectBlock = [];
  List<ListUserData> listUserData = [];

  void onMoreButtonTap(int index) {
    if (listConnectBlock[index] == false) {
      listConnectBlock[index] = true;
    } else {
      listConnectBlock[index] = false;
    }
    update(["Search"]);
  }

  Future<Position> getCurrentPosition() async {
// verify permissions

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
    }

    var _currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    return _currentPosition;
  }

  void advanceSearchOnTap() {
    if (advance == false) {
      advance = true;
    } else {
      advance = false;
    }
    update(["Search"]);
  }

  void onTapAdvanceSearchMenu(int index) {
    Get.to(
      AdvanceSearchScreen(
        title: advanceSearch[index],
      ),
    );
  }

  List imageList = [
    AssetRes.i1,
    AssetRes.i2,
    AssetRes.i3,
  ];

  @override
  void onInit() async {
    init();
    /*runFilter('');*/
    scrollController.addListener(pagination);
    update(['Search']);
    super.onInit();
  }

  void onSearch(String text) {
    keyword = text;
    update(["Search"]);
  }

  void pagination() async {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      await listUserProfile();
    }
    update(['Search']);
  }

  void init() async {
    position = await getCurrentPosition();
    await listUserProfile();
    searchBar.clear();
  }

  Future<void> listUserProfile() async {
    try {
      latitude = position!.latitude;
      longitude = position!.longitude;
      print(latitude);
      print(latitude);
      loader.value = true;
      listUseProfileModel = await ListUserProfileApi.listUserProfileApi(
          page: page,
          limit: limit,
          keyWords: "",
          latitude: latitude,
          longitude: longitude,
          fullName: "");
      page++;
      listUserData.addAll(listUseProfileModel.data!);
      listConnectBlock = List.filled(listUserData.length, false);

      print("pagggggggggggggggggggggggg===${page}");
      update(['Search']);
      loader.value = false;
    } catch (e) {
      debugPrint(e.toString());
      loader.value = false;
    }
  }

  Future<void> listUserProfileWithOutPagination() async {
    try {
      latitude = position!.latitude;
      longitude = position!.longitude;
      loader.value = true;
      listUseProfileModel = await ListUserProfileApi.listUserProfileApi(
          page: 1,
          limit: listUserData.length,
          keyWords: "",
          latitude: latitude,
          longitude: longitude,
          fullName:"");
      listUserData = listUseProfileModel.data!;
      update(['Search']);
      loader.value = false;
    } catch (e) {
      debugPrint(e.toString());
      loader.value = false;
    }
  }

  Future<void> runFilter(String enteredKeyword) async {
    List<ListUserData> dataStore = [];
    loader.value = true;
    page = 1;
    listUseProfileModel = await ListUserProfileApi.listUserProfileApi(
        page: page,
        limit: limit,
        keyWords: "",
        longitude: longitude,
        latitude: latitude,
        fullName: enteredKeyword);
    loader.value = false;
    dataStore = listUseProfileModel.data ?? [];
    listUserData = dataStore;
    update(['Search']);
  }

  ConnectionsProfileController connectionsProfileController =
      Get.put(ConnectionsProfileController());

  onTapViewProfile(String userId) async {
    connectionsProfileController.callApi(userId);
    loader.value = true;

    connectionsProfileController.profileModel =
        (await OtherProfileApi.getOtherUerData(userId.toString()))!;
    loader.value = false;
    Get.to(() => ConnectionsProfileScreen());
  }

  void sendFriendRequest(String id) async {
    loader.value = true;
    await SendFriendRequestApi.postRegister(id);
    await listUserProfileWithOutPagination();
    /*   connectionsProfileController.sendFriendRequestDetails(id);*/
    loader.value = false;

    update(['Search']);
  }

  void acceptFriendRequest(String id) async {
    loader.value = true;
    await AcceptFriendRequestApi.postRegister(id);
    await listUserProfileWithOutPagination();
/*    connectionsProfileController.acceptFriendRequestDetails(id);*/
    loader.value = false;

    update(['Search']);
  }

  void cancelFriendRequest(String id) async {
    loader.value = true;
    await OtherProfileApi.cancelRequest(id);
    await listUserProfileWithOutPagination();
/*    connectionsProfileController.cancelFriendRequestDetails(id);*/
    loader.value = false;

    update(['Search']);
  }

  void unFriendRequest(String id) async {
    loader.value = true;
    await UnFriendRequestApi.postRegister(id);
/*    connectionsProfileController.unFriendRequestDetails(id);*/
    await listUserProfileWithOutPagination();
    loader.value = false;

    update(['Search']);
  }

  void blockOnTap(String id) async {
    loader.value = true;
    await BlockApi.postRegister(id.toString());
    /*   connectionsProfileController.blockUserDetails(id);*/
    await listUserProfileWithOutPagination();

    loader.value = false;

    update(['Search']);
  }

  void unblockOnTap(String id) async {
    loader.value = true;
    await UnBlockApi.postRegister(id);
    /*   connectionsProfileController.unBlockUserDetails(id);*/
    await listUserProfileWithOutPagination();
    loader.value = false;

    update(['Search']);
  }
}
