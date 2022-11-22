import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/popup.dart';
import 'package:rainbow/model/create_advertiser_model.dart';
import 'package:rainbow/model/my_advertiser_model.dart';
import 'package:rainbow/model/payment_advertise.dart';
import 'package:rainbow/model/view_advertiser_model.dart';
import 'package:rainbow/screens/Home/settings/payment/payment_controller.dart';
import 'package:rainbow/screens/advertisement/ad_home/myAdvertiser_api/myAdvertiser_api.dart';
import 'package:rainbow/screens/advertisement/ad_home/screen/create_advertisement/create_advertisement_screen.dart';
import 'package:rainbow/screens/advertisement/ad_home/screen/renewAdSetupDate/api/renewAd_api.dart';
import 'package:rainbow/screens/advertisement/ad_home/viewAdvertiserProfile_api/viewAdvertiser_api.dart';
import 'package:rainbow/screens/auth/auth_dashboard/auth_dashboard.dart';
import 'package:rainbow/screens/notification/notification_controller.dart';
import 'package:rainbow/utils/asset_res.dart';

import '../../Profile/widget/profile_appbar.dart';

class AdHomeController extends GetxController {
  //AdvertisementController advController = Get.put(AdvertisementController());
  TextEditingController monthSet = TextEditingController();
  PaymentController paymentController = PaymentController();
  NotificationsController notificationsController = NotificationsController();

  RxBool loader = false.obs;
  String? selectedItem;
  bool listShow = false;
  MyAdvertiserModel myAdvertiserModel = MyAdvertiserModel();
  String? timeOfDay = "";
  List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  List imageList = [
    AssetRes.advertisement_1Image,
    AssetRes.advertisement_2Image,
    AssetRes.advertisement_3Image,
    AssetRes.advertisement_1Image,
    AssetRes.advertisement_2Image,
    AssetRes.advertisement_3Image,
  ];
  List stringList = [
    "Surrogate Mom",
    "Licensed Mid - Wife",
    "Breast Milk Donor",
    "Surrogate Mom",
    "Licensed Mid - Wife",
    "Breast Milk Donor",
  ];

  List<MyAdvertiserData>  myAdList = [];

  ScrollController scrollController = ScrollController();
  int page = 1;
  int limit = 10;

  void pagination() async {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      await myAdvertiserListData();
      update(['more']);
    }
    update(['more']);
  }

  List<bool> moreOption = [];

  AdvertisersCreateModel advertisersCreateModel = AdvertisersCreateModel();

  bool activeConnection = false;

  String T = "";
  Future checkUserConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {

        activeConnection = true;
        T = "Turn off the data and repress again";
        update(["network"]);

      }
    } on SocketException catch (_) {

      activeConnection = false;
      T = "Turn On the data and repress again";
      update(["network"]);
    }
  }

  @override
  void onInit() async {
   await  init();
   update(["more"]);
    update(["dashBoard"]);
    update(["update"]);
    update();
    super.onInit();
  }

  Future<void> onRefresh() async {
    await refreshCode();
  }

  Future<void> refreshCode() async {
    await viewAdvertiserData();
    loader.value = false;

    page = 1;
    myAdList = [];
    await myAdvertiserListData();
    //await myAdvertiserListDataWithOutPagination();
    loader.value = false;
  }

  Future<void> init() async {
    await checkUserConnection();
    paymentController.transactionApi();
    paymentController.listCardModel;
    await myAdvertiserListData();
    scrollController.addListener(pagination);
    await viewAdvertiserData();
    update(["more"]);

    notificationsController.getNotifications;

    await greeting();
  }

  void onTapAddList() {
    Get.to(() => CreateAdvertisementScreen());
  }

  greeting() {
    var hour = DateTime.now().hour;

    if (hour <= 12) {
      timeOfDay = 'Morning';
    } else if ((hour > 12) && (hour <= 16)) {
      timeOfDay = 'Afternoon';
    } else if ((hour > 16) && (hour < 20)) {
      timeOfDay = 'Evening';
    } else {
      timeOfDay = 'Night';
    }
  }

  void onTapMore(int index) {
    if (moreOption[index] == false) {
      moreOption[index] = true;
    } else {
      moreOption[index] = false;
    }
    update(['more']);
  }

  void onTapNext() {
    Get.offAll(() => AuthDashboard());
  }


  Future<void> myAdvertiserListData() async {
    try {
      loader.value = true;
      myAdvertiserModel = await MyAdvertiserApi.myAdvertiserDataList(page, limit);
      page++;
      print(page);
      myAdList.addAll(myAdvertiserModel.data!);
      moreOption = List.filled(myAdList.length, false);
      update(['more']);
      loader.value = false;
    } catch (e) {
      loader.value = false;
    }
  }

  void onCloseMenu() {
    moreOption = List.filled(myAdList.length, false);
    update(['more']);
  }
  PaymentAdvertiseModel paymentAdvertiseModel = PaymentAdvertiseModel();

  Future<void> onMenuId(int? id) async {
    paymentAdvertiseModel = await AdvPaymentApi.advPaymentApi(idAd: id ?? 0);
    update(['more']);
  }

  Future<void> myAdvertiserListDataWithOutPagination({int? pageLength}) async {
    try {
      loader.value = true;


      myAdvertiserModel = await MyAdvertiserApi.myAdvertiserDataList(
          1, pageLength ?? myAdList.length);

      myAdList = myAdvertiserModel.data!;

      update(['more']);

      loader.value = false;
    } catch (e) {
      debugPrint(e.toString());
      loader.value = false;
    }
  }




  Future<void> deleteAdvertiser(id, context) async {
    try {
      loader.value = true;
      await MyAdvertiserApi.deleteAdvertiser(id, context);
      await myAdvertiserListDataWithOutPagination();
      loader.value = false;
      update(['delete']);
    } catch (e) {
      loader.value = false;

    }
  }

  Future<void> cancelAdvertiser(id, context) async {
    try {
      loader.value = true;
      await MyAdvertiserApi.cancelAdvertiser(id, context);
      await myAdvertiserListDataWithOutPagination();
      loader.value = false;
      update(['cancel']);
    } catch (e) {
      loader.value = false;


    }
  }

  Future<void> followUpAdvertiser(id, context) async {
    try {
      loader.value = true;
      await MyAdvertiserApi.followUpAdvertiser(id, context);
      await myAdvertiserListDataWithOutPagination();
      loader.value = false;
      update(['followUp']);
    } catch (e) {
      loader.value = false;

    }
  }

  ViewAdvertiserModel viewAdvertiserModel = ViewAdvertiserModel();

  Future<void> viewAdvertiserData() async {
    try {
      loader.value = true;
      viewAdvertiserModel = await ViewAdvertiserApi.viewAdvertiserData();
      loader.value = false;

      update(['cancel']);
      update(["dashBoard"]);
    } catch (e) {
      loader.value = false;


    }
  }

  onTap() {
    errorToast("Please enter card");
    update(['more']);
  }

  onTapNetwork(){
    errorToast("No internet connection");
  }

}
