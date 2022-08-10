import 'dart:math';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:rainbow/model/ListUserProfileModel.dart';
import 'package:rainbow/screens/Home/settings/connections/connections_profile/api/OtherProfileApi.dart';
import 'package:rainbow/screens/Home/settings/connections/connections_profile/connections_profile_controller.dart';
import 'package:rainbow/screens/Home/settings/connections/connections_profile/connections_profile_screen.dart';
import 'package:rainbow/screens/Search/ListUserProfile_api/listUserProfile_api.dart';
import 'package:rainbow/screens/Search/advance_search/advance_search_screen.dart';

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
    listConnectBlock = List.filled(listUserData.length, false);
    update(["Search"]);
  }

  double? latitude;
  double? longitude;
  Position? position;

  List<bool> listConnectBlock = [];
  List<ListUserData> listUserData = [];

  void onMoreButtonTap(int index) {
    listConnectBlock[index] = true;
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

  @override
  void onInit() async {
    init();
    runFilter('');

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
          longitude: longitude);
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
      print(latitude);
      print(latitude);
      loader.value = true;
      listUseProfileModel = await ListUserProfileApi.listUserProfileApi(
          page: 1,
          limit: listUseProfileModel.data!.length,
          keyWords: "",
          latitude: latitude,
          longitude: longitude);
      listUserData.addAll(listUseProfileModel.data!);
      listConnectBlock = List.filled(listUserData.length, false);

      update(['Search']);
      loader.value = false;
    } catch (e) {
      debugPrint(e.toString());
      loader.value = false;
    }
  }

  List<dynamic> dataLocation = [
    {"lat": 21.1591857, "lng": 72.752256},
    {"lat": 21.2372228, "lng": 72.8855694},
    {"lat": 21.1591857, "lng": 72.752256},
    {"lat": 21.2372228, "lng": 72.8855694},
  ];

  totalDistance() {
    double totalDistance = 0;
    for (var i = 0; i < 2; i++) {
      totalDistance += calculateDistance(
          dataLocation[i]["lat"],
          dataLocation[i]["lng"],
          dataLocation[i + 1]["lat"],
          dataLocation[i + 1]["lng"]);
    }
    print(totalDistance);
  }

  double calculateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  Future<void> runFilter(String enteredKeyword) async {
    List<ListUserData> dataStore = [];
    loader.value = true;
    page = 1;
    listUseProfileModel = await ListUserProfileApi.listUserProfileApi(
        page: page,
        limit: limit,
        keyWords: enteredKeyword,
        longitude: longitude,
        latitude: latitude);
    /*   data.addAll(listUseProfileModel.data!);*/
    loader.value = false;

    if (enteredKeyword.isEmpty) {
      dataStore = listUseProfileModel.data!;
    } else {
      dataStore = listUseProfileModel.data!
          .where((user) => user.userStatus!
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    } // Refresh the UI
    data.addAll(dataStore);
    update(['Search']);
  }

  ConnectionsProfileController connectionsProfileController =
      Get.put(ConnectionsProfileController());

  onTapViewProfile(String userId) async {
    connectionsProfileController.callApi(userId);
    loader.value = true;
    // int userId= PrefService.getInt(PrefKeys.userId);
    connectionsProfileController.profileModel =
        (await OtherProfileApi.getOtherUerData(userId.toString()))!;
    loader.value = false;
    Get.to(() => ConnectionsProfileScreen());
  }
}
