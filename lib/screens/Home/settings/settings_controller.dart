import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:rainbow/model/logout_model.dart';
import 'package:rainbow/screens/Home/settings/logOut_Api/LogOut_Api.dart';
import 'package:rainbow/screens/Home/settings/privacy/privacy_controller.dart';
import 'package:rainbow/screens/Home/settings/privacy/privacy_screen.dart';

class SettingsController extends GetxController
{

  RxBool loader = false.obs;
  LogOutModel logOutModel = LogOutModel();

  void onInit()
  {
    super.onInit();
    update();
  }
  bool isSwitched = false;
  Future<void> share() async {
    await FlutterShare.share(
        title: 'Example share',
        text: 'Example share text',
        linkUrl: 'https://flutter.dev/',
        chooserTitle: 'Example Chooser Title'
    );
  }


  void onPrivacyScreenTap(){
    PrivacyController controller = Get.put(PrivacyController());
    controller.init();
    Get.to(() => PrivacyScreen());
  }

  Future<void> logOutDetails() async {
     loader.value = true;
    try {
     await LogOutApi.postRegister();

       loader.value = false;
    } catch (e) {
      loader.value = false;
      debugPrint(e.toString());
    }
  }
}