import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/popup.dart';
import 'package:rainbow/model/listCardModel.dart';
import 'package:rainbow/model/myAdvertiser_model.dart';
import 'package:rainbow/model/viewAdvertiserModel.dart';
import 'package:rainbow/screens/Home/settings/payment/payment_controller.dart';
import 'package:rainbow/screens/advertisement/ad_home/myAdvertiser_api/myAdvertiser_api.dart';
import 'package:rainbow/screens/advertisement/ad_home/screen/create_advertisement/create_advertisement_screen.dart';
import 'package:rainbow/screens/advertisement/ad_home/viewAdvertiserProfile_api/viewAdvertiser_api.dart';
import 'package:rainbow/screens/auth/auth_dashboard/auth_dashboard.dart';
import 'package:rainbow/screens/notification/notification_controller.dart';
import 'package:rainbow/utils/asset_res.dart';

class AdHomeController extends GetxController {
  //AdvertisementController advController = Get.put(AdvertisementController());
  TextEditingController monthSet = TextEditingController();
  PaymentController paymentController = PaymentController();
  NotificationsController notificationsController = NotificationsController();



  RxBool loader = false.obs;
  String? selectedItem;
  bool listShow = false;
  MyAdvertiserModel myAdvertiserModel = MyAdvertiserModel();
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

  List<bool> moreOption = [];

  @override
  void onInit() {
    init();
    update(["dashBoard"]);
    update(["update"]);
    update();
    super.onInit();
  }

  Future<void> onRefresh() async {
    /*await init()*/
    await refreshCode();
    // refreshController!.refreshCompleted();
  }

  Future<void> refreshCode() async {
    await viewAdvertiserData();
    loader.value = false;
    await myAdvertiserListData();
    loader.value = false;
  }

  Future<void> init() async {



     paymentController.transactionApi();
     paymentController.listCardModel;

    notificationsController.getNotifications;
    await viewAdvertiserData();
    await myAdvertiserListData();
  }

  void onTapAddList() {
    Get.to(() => CreateAdvertisementScreen());
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

  void onCloseMenu() {
    moreOption = List.filled(myAdvertiserModel.data!.length, false);
    update(['more']);
  }

  Future<void> myAdvertiserListData() async {
    try {
      loader.value = true;
      myAdvertiserModel = await MyAdvertiserApi.myAdvertiserDataList();
      moreOption = List.filled(myAdvertiserModel.data!.length, false);
      update(['more']);
      loader.value = false;
    } catch (e) {
      loader.value = false;

      print(e.toString());
    }
  }

  Future<void> deleteAdvertiser(id, context) async {
    try {
      loader.value = true;
      await MyAdvertiserApi.deleteAdvertiser(id, context);
      await myAdvertiserListData();
      loader.value = false;
      update(['delete']);
    } catch (e) {
      loader.value = false;
      print(e.toString());
    }
  }

  Future<void> cancelAdvertiser(id, context) async {
    try {
      loader.value = true;
      await MyAdvertiserApi.cancelAdvertiser(id, context);
      await myAdvertiserListData();
      loader.value = false;
      update(['cancel']);
    } catch (e) {
      loader.value = false;

      print(e.toString());
    }
  }

  Future<void> followUpAdvertiser(id, context) async {
    try {
      loader.value = true;
      await MyAdvertiserApi.followUpAdvertiser(id, context);
      await myAdvertiserListData();
      loader.value = false;
      update(['followUp']);
    } catch (e) {
      loader.value = false;
      print(e.toString());
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

      print(e.toString());
    }
  }
  
  onTap(){
    errorToast("Please enter card");
    update(['more']);
  }


  
}
