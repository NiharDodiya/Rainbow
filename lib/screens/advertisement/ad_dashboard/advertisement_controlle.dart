import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/screens/advertisement/ad_home/ad_home_controller.dart';
import 'package:rainbow/screens/advertisement/ad_notification/ad_notification_controller.dart';
import 'package:rainbow/screens/advertisement/ad_payment/ad_payment_controller.dart';
import 'package:rainbow/screens/advertisement/ad_support/ad_support_controller.dart';

class AdvertisementController extends GetxController
{
  int currentTab = 0;
  final AdHomeController homeController = Get.put(AdHomeController());
  final AdPaymenetController adPaymenetController = Get.put(AdPaymenetController());
  final AdNotificationsController notificationsController = Get.put(AdNotificationsController());
  final AdSupportController supportController = Get.put(AdSupportController());

  final GlobalKey<ScaffoldState> key = GlobalKey();

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

}