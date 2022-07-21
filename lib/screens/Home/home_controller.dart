import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/blocList_api/blockList_api.dart';
import 'package:rainbow/common/helper.dart';
import 'package:rainbow/common/popup.dart';
import 'package:rainbow/model/blockList_model.dart';
import 'package:rainbow/model/listOfFriendRequest_model.dart';
import 'package:rainbow/screens/Home/Story/story_controller.dart';
import 'package:rainbow/screens/Home/addStroy/addStory_screen.dart';
import 'package:rainbow/screens/Home/my_story/my_story_controller.dart';
import 'package:rainbow/screens/Home/my_story/my_story_screen.dart';
import 'package:rainbow/screens/Home/view_story/view_story_controller.dart';
import 'package:rainbow/screens/Profile/profile_controller.dart';
import 'package:rainbow/screens/Profile/widget/listOfFriendRequest_api/listOfFriendRequest_api.dart';
import 'package:rainbow/screens/auth/register/list_nationalites/list_nationalites_api.dart';
import 'package:rainbow/screens/auth/registerfor_adviser/listOfCountry/listOfCountryApi.dart';

class HomeController extends GetxController {
  RxBool loader = false.obs;
  ProfileController controller = Get.put(ProfileController());
  ListOfFriendRequestModel listOfFriendRequestModel =
      ListOfFriendRequestModel();
  ViewStoryController viewStoryController = Get.put(ViewStoryController());
  List<bool> isAd = List.generate(10, (index) => Random().nextInt(2) == 1);

  @override
  Future<void> onInit() async {
    init();
    super.onInit();
  }

  final storyController = EditStoryController();

  Future<void> countryName() async {
    try {
      await ListOfCountryApi.postRegister()
          .then((value) => listCountryModel = value!);
      print(listCountryModel);
      getCountry();
    } catch (e) {
      errorToast(e.toString());
      debugPrint(e.toString());
    }
  }

  void onNewStoryTap(){
    Get.to(() => AddStoryScreen());
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

  BlockListModel blockListModel = BlockListModel();

  Future<void> blockListDetailes() async {
    try {
      await BlockListApi.postRegister()
          .then((value) => blockListModel = value!);
      print(blockListModel);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> listOfFriedRequestDetails() async {
    try {
      loader.value = true;
      listOfFriendRequestModel = (await ListOfFriendRequestApi.postRegister())!;
      update(["connections"]);
      loader.value = false;
    } catch (e) {
      loader.value = false;
    }
  }

  Future<void> init() async {
    countryName();
    countryNationalites();
    blockListDetailes();
    listOfFriedRequestDetails();
    controller.viewProfileDetails();
    // viewStoryController.friendStoryApiData();
    // loader.value = true;
  }

  Future<void> myStoryOnTap() async {
    MyStoryController myStoryController = Get.put(MyStoryController());
    loader.value = true;
    await myStoryController.init();
    loader.value = false;
    if(myStoryController.myStoryModel.data!.isNotEmpty){
      Get.to(() => const MyStoryScreen());
    }else{
      Get.to(() => AddStoryScreen());
    }
  }

}
