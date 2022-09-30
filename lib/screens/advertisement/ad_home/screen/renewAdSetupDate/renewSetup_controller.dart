import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rainbow/common/uploadimage_api/uploadimage_api.dart';
import 'package:rainbow/common/uploadimage_api/uploadimage_model.dart';
import 'package:rainbow/screens/advertisement/ad_home/screen/renewAdSetupDate/api/renewAd_api.dart';
import 'package:rainbow/screens/advertisement/ad_home/screen/renewAdSetupDate/renewSetUp_Screen.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/color_res.dart';



class RenewAdSetupDateController extends GetxController{
  DateTime? startTime = DateTime.now();
  DateTime selectableDate = DateTime.now();
  DateTime? endTime = DateTime.now();
  String flag = AssetRes.flag01;
  bool showDropDown = false;
  List<String> flagList = [AssetRes.flag01, AssetRes.flag02];
  List<String> list = ["Caneda", "India"];
  String currency = "\$";
  List<String> currencyList = ["\$", "₹"];
  String select = 'Caneda';
  List<int> imgIdList = [];
  List<File> imagePath = [];

  int pageIndex = 0;

  RxBool loader = false.obs;

  TextEditingController amountController =
  TextEditingController(text: "\$3000.00");

  rangSelect(start, end, range) {
    startTime = start;
    endTime = end;
    update(['range']);
  }

  void renewAdAPI({int? id}) async {
    DateTime now = DateTime.now();
    loader.value = true;
    await RenewAdApi.renewAdApi(
      idAd: id,
      startDate: DateFormat().add_yMd().format(startTime!),  //startTime!.add(Duration(days: 1))!
      endDate: (endTime == null)?DateFormat().add_yMd().format(DateTime(now.year,now.month,now.day,24,00,00)):DateFormat().add_yMd().format(endTime!),
      amount: 3000,
    );

    loader.value = false;
    update(["advertiser"]);
  }

/*  UploadImage uploadImage = UploadImage();

  Future<void> uploadImageApi() async {
    loader.value = true;
    try {
      loader.value = true;
      imgIdList = [];
      for (var e in imagePath) {
        loader.value = true;
        uploadImage = await UploadImageApi.postRegister(e.path);
        imgIdList.add(uploadImage.data!.id!);
      }
      addAdvertisement(imgIdList);
      loader.value = true;
    } catch (e) {
      debugPrint(e.toString());
    }
  }*/

  Future<void> onTapNext({int? id}) async {
    Get.bottomSheet(
      enableDrag: false,
      BottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        backgroundColor: ColorRes.white,
        onClosing: () {},
        constraints: BoxConstraints(
          maxHeight: Get.height - (Get.height * 0.2),
        ),

        // enableDrag: true,
        builder: (_) => ShowBottomNext(
          amount: currency,
          id: id,
        ),
      ),
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(35),
      ),
      ignoreSafeArea: true,
    );
  }
}