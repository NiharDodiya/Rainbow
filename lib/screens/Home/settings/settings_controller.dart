import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:get/get.dart';
import 'package:rainbow/model/logout_model.dart';
import 'package:rainbow/screens/Home/home_controller.dart';
import 'package:rainbow/screens/Home/settings/logOut_Api/LogOut_Api.dart';
import 'package:rainbow/screens/Home/settings/notificationOnOff_api/notificationOnOff_api.dart';
import 'package:rainbow/screens/Home/settings/privacy/privacy_controller.dart';
import 'package:rainbow/screens/Home/settings/privacy/privacy_screen.dart';
import 'package:rainbow/screens/Home/settings/support/support_screen.dart';
import 'package:rainbow/screens/Home/view_story/view_story_controller.dart';
import 'package:rainbow/screens/Profile/profile_controller.dart';
import 'package:rainbow/screens/dashboard/dashboard_controller.dart';
import 'package:rainbow/service/pref_services.dart';
import 'package:rainbow/utils/pref_keys.dart';

class SettingsController extends GetxController {
  RxBool loader = false.obs;
  LogOutModel logOutModel = LogOutModel();
ProfileController profileController = Get.put(ProfileController());
  @override
  void onInit() {
    super.onInit();
    update();
  }

  bool? isSwitched = false;

  Future<void> share() async {
    await FlutterShare.share(
        title: 'RainBow App',
        text: 'refferalCode',
        linkUrl: '$refferalCode',
        chooserTitle: 'Example Chooser Title');
  }

  void onPrivacyScreenTap() {
    PrivacyController controller = Get.put(PrivacyController());
    controller.init();
    Get.to(() => PrivacyScreen());
  }

  onTapSupport() async {
    /*   loader.value= true;
    SupportController supportController = Get.put(SupportController());
    await supportController.getListOfUserTicket();
    loader.value= false;*/
    Get.to(() => SupportScreen());
  }

  Future<void> logOutDetails() async {
    loader.value = true;
    try {
      DashboardController dashboardController = Get.find();
      await dashboardController.setUserOnlineStatus(false);
      await LogOutApi.postRegister();

      loader.value = false;
    } catch (e) {
      loader.value = false;
      debugPrint(e.toString());
    }
  }

  void notification() {
    isSwitched = PrefService.getBool(PrefKeys.notification);
    print(isSwitched);
  }

  String? refferalCode;

  void getRefferralsCode() {
    refferalCode = PrefService.getString(PrefKeys.referrallCode);
  }

  Future<void> notificationOnOffApi() async {
    try {
      loader.value = true;
      if (isSwitched == false) {
        PrefService.setValue(PrefKeys.notification, false);
        await NotificationOnOffApi.notificationOff();
      } else {
        PrefService.setValue(PrefKeys.notification, true);
        await NotificationOnOffApi.notificationOn();
      }
      update(["settings"]);

      loader.value = false;
    } catch (e) {
      print(e.toString());
      loader.value = false;
    }
  }
}
