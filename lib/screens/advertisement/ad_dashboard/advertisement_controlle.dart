import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:rainbow/common/helper.dart';
import 'package:rainbow/common/popup.dart';
import 'package:rainbow/screens/Home/settings/notificationOnOff_api/notification_on_off_api.dart';
import 'package:rainbow/screens/account_Information/account_Information_screen.dart';
import 'package:rainbow/screens/account_Information/account_information_controller.dart';
import 'package:rainbow/screens/advertisement/ad_home/ad_home_controller.dart';
import 'package:rainbow/screens/advertisement/ad_notification/ad_notification_controller.dart';
import 'package:rainbow/screens/advertisement/ad_payment/ad_payment_controller.dart';
import 'package:rainbow/screens/advertisement/ad_support/ad_support_controller.dart';
import 'package:rainbow/screens/auth/register/list_nationalites/list_nationalites_api.dart';

import 'package:rainbow/screens/auth/registerfor_adviser/listOfCountry/list_of_country_api.dart';
import 'package:rainbow/service/pref_services.dart';
import 'package:rainbow/utils/pref_keys.dart';

class AdvertisementController extends GetxController {
  int currentTab = 0;
  final AdHomeController homeController = Get.put(AdHomeController());

  final AdPaymenetController adPaymenetController =
      Get.put(AdPaymenetController());
  final AdNotificationsController notificationsController =
      Get.put(AdNotificationsController());
  final AdSupportController supportController = Get.put(AdSupportController());

  final GlobalKey<ScaffoldState> key = GlobalKey();

  RxBool loader = false.obs;
  bool? isSwitched = true;

  @override
  void onInit() {
    countryName();
    countryNationalites();
    super.onInit();
  }

  Future<void> countryName() async {
    try {
      await ListOfCountryApi.postRegister()
          .then((value) => listCountryModel = value!);

      getCountry();
    } catch (e) {
      //errorToast(e.toString());
      //errorToast("No internet connection");
      debugPrint(e.toString());
    }
  }

  Future<void> countryNationalites() async {
    try {
      await ListOfNationalitiesApi.postRegister()
          .then((value) => listNationalities = value!);

      getCountryNation();
    } catch (e) {
      //errorToast("No internet connection");
      debugPrint(e.toString());
    }
  }

  /*Future<void> countryNationalites() async {
    try {
      await ListOfNationalitiesApi.postRegister()
          .then((value) => listNationalities = value!);

      getCountryNation();
    } catch (e) {
      //errorToast("No internet connection");
      debugPrint(e.toString());
    }
  }*/



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

  void fun(bool flage) {}

  Future<void> inTapAccountInfo() async {
    final AccountInformationController accountInformationController =
        Get.put(AccountInformationController());
    accountInformationController.onGetData();
    accountInformationController.update(['phone']);
    Get.to(() => AccountInformationScreen());
  }

  void notification() {
    AdHomeController adHomeController = Get.find();
    adHomeController.checkUserConnection();
    isSwitched = PrefService.getBool(PrefKeys.notification);

    update(["settings"]);
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

      loader.value = false;
    }
  }

  onTapNetwork(){
    errorToast("No internet connection");
  }
}
