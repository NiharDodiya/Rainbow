import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/screens/auth/auth_dashboard/auth_dashboard.dart';
import 'package:rainbow/utils/asset_res.dart';

class AdHomeController extends GetxController {
  //AdvertisementController advController = Get.put(AdvertisementController());
  TextEditingController monthSet = TextEditingController();

  RxBool loader = false.obs;
  String? selectedItem;
  bool listShow = false;
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
  List<bool> moreOption = List.generate(6, (index) => false);

  @override
  void onInit() {
    init();
    super.onInit();
  }

  Future<void> init() async {
    loader.value = true;
  }

  void onTapAddList() {
    listShow = !listShow;
    update(['list']);
  }

  void onTapMore(int index) {
    moreOption = List.generate(6, (index) => false);
    moreOption[index] = true;
    update(['more']);
  }

  void onTapNext() {
    Get.offAll(() => AuthDashboard());
  }

  void onCloseMenu() {
    moreOption = List.generate(6, (index) => false);
    update(['more']);
  }
}
