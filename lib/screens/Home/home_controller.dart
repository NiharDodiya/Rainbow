import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/helper.dart';
import 'package:rainbow/screens/Home/addStroy/addStory_screen.dart';
import 'package:rainbow/screens/Profile/profile_controller.dart';
import 'package:rainbow/screens/auth/register/list_nationalites/list_nationalites_api.dart';

class HomeController extends GetxController
{

  RxBool loader = false.obs;
  ProfileController controller = Get.put(ProfileController());

  @override
  void onInit()
  {
    init();
    countryNationalites();
    controller.viewProfileDetails();

    super.onInit();
  }
  Future<void> countryNationalites() async {
    try {
      await ListOfNationalitiesApi.postRegister().then((value) => listNationalities = value!);
      print(listNationalities);
      getCountryNation();

    } catch (e) {
      debugPrint(e.toString());
    }
  }
  Future<void> init() async {
    loader.value = true;

  }
  void myStoryOnTap()
  {
    Get.to(()=> AddStoryScreen());
  }
}