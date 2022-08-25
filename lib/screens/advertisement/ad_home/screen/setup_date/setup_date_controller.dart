import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/popup.dart';
import 'package:rainbow/screens/advertisement/ad_home/screen/create_advertisement/create_advertisement_controller.dart';
import 'package:rainbow/screens/advertisement/ad_home/screen/setup_date/setup_date_screen.dart';
import 'package:rainbow/screens/advertisement/boostadvertisement_api/boostAdvertisement_api.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/color_res.dart';

class SetupDateController extends GetxController {


  DateTime startTime = DateTime.now();
  DateTime endtime = DateTime.now();
  String flag = AssetRes.flag01;
  bool showDropDown = false;
  List<String> flagList = [AssetRes.flag01, AssetRes.flag02];
  List<String> list = ["Caneda", "India"];
  String currency = "\$";
  List<String> currencyList = ["\$", "₹"];
  String select = 'Caneda';
  RxBool loader = false.obs;

  TextEditingController amountController = TextEditingController();

  rangSelect(start, end, range) {
    startTime = start;
    endtime = end;
    update(['range']);
  }

  showDrop() {
    showDropDown = true;
    update(['selectC']);
  }

  selectContry(index) {
    showDropDown = false;
    select = list[index];
    flag = flagList[index];
    currency = currencyList[index];
    update(['selectC']);
  }

  drop(val) {
    select = val;
    update(['drop']);
  }

  void onCountryTap(context) {
    showCountryPicker(
      context: context,
      showPhoneCode: false,
      onSelect: (country) {
        // countryModel = country;
        select = country.toString();
        update(['Phone']);
      },
    );
  }

  bool validation() {
    if (startTime.toString().isEmpty) {
      errorToast("please select date");
      return false;
    } else if (endtime.toString().isEmpty) {
      errorToast("please select date");
      return false;
    } else if (currency.isEmpty) {
      errorToast("please enter your amount");
    }
    return true;
  }

  void onTapNext() {
    if (validation()) {
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
            maxHeight: Get.height - (Get.height * 0.0480),
          ),

          // enableDrag: true,
          builder: (_) => ShowBottomNext(
            amount: currency,
          ),
        ),
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35),
        ),
        ignoreSafeArea: true,
      );
/*      boostAdvertisementApi();*/
    }
  }

  Future<void> boostAdvertisementApi() async {

    try {
      loader.value = true;
      await BoostAdvertisementApi.boostAdvertisement(
          startDate: startTime.toString(),
          endDate: endtime.toString(),
          amount: amountController.text,
          currency: currency,
      );
      loader.value = false;
      print("=========Amount: ${amountController.text}");

      update(["advertiser"]);

    } catch (e) {
      print('==========error: ${e.toString()}');
      loader.value = true;
    }
  }
}
