import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/screens/account_Information/account_Information_screen.dart';
import 'package:rainbow/screens/account_Information/account_information_controller.dart';
import 'package:rainbow/screens/advertisement/ad_home/ad_home_controller.dart';
import 'package:rainbow/screens/advertisement/ad_notification/ad_notification_controller.dart';
import 'package:rainbow/screens/advertisement/ad_payment/ad_payment_controller.dart';
import 'package:rainbow/screens/advertisement/ad_support/ad_support_controller.dart';
import 'package:rainbow/screens/auth/auth_dashboard/auth_dashboard.dart';

class AdvertisementController extends GetxController {
  int currentTab = 0;
  final AdHomeController homeController = Get.put(AdHomeController());
  final AccountInformationController accountInformationController = Get.put(AccountInformationController());
  final AdPaymenetController adPaymenetController = Get.put(AdPaymenetController());
  final AdNotificationsController notificationsController = Get.put(AdNotificationsController());
  final AdSupportController supportController = Get.put(AdSupportController());

  final GlobalKey<ScaffoldState> key = GlobalKey();
  bool isSwitched = false;

  void onBottomBarChange(int index) {
    currentTab = index;
    if (index == 0) {
      homeController.init();
    } else if (index == 1) {
      adPaymenetController.init();
    } else if (index == 2) {
      notificationsController.init();
    } else {
      supportController.init();
    }
    update(['bottom_bar']);
  }

  notification() {
    isSwitched = !isSwitched;
    update(['notifi']);
  }

  void fun(bool flage) {}

  void inTapAccountInfo(){
    accountInformationController.init();
    Get.to(()=>AccountInformationScreen());
  }

  void onTapLogOut() {
    Get.offAll(() => AuthDashboard());
  }
}
