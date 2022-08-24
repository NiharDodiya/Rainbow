import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/model/myAdvertiser_model.dart';
import 'package:rainbow/screens/advertisement/ad_home/myAdvertiser_api/myAdvertiser_api.dart';
import 'package:rainbow/screens/auth/auth_dashboard/auth_dashboard.dart';
import 'package:rainbow/utils/asset_res.dart';

class AdHomeController extends GetxController {
  //AdvertisementController advController = Get.put(AdvertisementController());
  TextEditingController monthSet = TextEditingController();

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
    if(moreOption[index]==false){
      moreOption[index] = true;
    }else{
      moreOption[index] = false;
    }
    update(['more']);
  }

  void onTapNext() {
    Get.offAll(() => AuthDashboard());
  }

  void onCloseMenu() {
    moreOption =  List.filled(myAdvertiserModel.data!.length, false);
    update(['more']);
  }


  Future<void> myAdvertiserListData() async {
    try{
      loader.value =true;
      myAdvertiserModel = await MyAdvertiserApi.myAdvertiserDataList();
      moreOption = List.filled(myAdvertiserModel.data!.length, false);
      loader.value =false;
      update(['more']);

    }catch(e){
      loader.value =false;

      print(e.toString());
    }
  }
  Future<void> deleteAdvertiser(id,context) async {
    try{
      loader.value =true;
      await MyAdvertiserApi.deleteAdvertiser(id,context);
      myAdvertiserListData();
      loader.value =false;
      update(['delete']);

    }catch(e){
      loader.value =false;

      print(e.toString());
    }
  }
}
