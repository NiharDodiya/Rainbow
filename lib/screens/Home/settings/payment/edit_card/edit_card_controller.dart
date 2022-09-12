import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/popup.dart';
import 'package:rainbow/model/listCardModel.dart';
import 'package:rainbow/screens/Home/settings/payment/payment_controller.dart';
import 'package:rainbow/screens/Home/settings/payment/payment_screen.dart';
import 'package:rainbow/screens/advertisement/ad_payment/ad_payment_api/ad_payment_api.dart';
import 'package:rainbow/utils/strings.dart';

import 'edit_card_api/edit_card_api.dart';

class EditCardController extends GetxController{

  TextEditingController fullNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController postalCodeController = TextEditingController();
  TextEditingController nameOnCardController = TextEditingController();
  TextEditingController cardNmberController = TextEditingController();
  TextEditingController expiryMonthController = TextEditingController();
  TextEditingController expiryYearController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  String? selectCountry;

  PaymentController paymentController = Get.put(PaymentController());

  void onInit() {
    update();
    super.onInit();
  }

  editCart({int? index, context}) async {
    validation();
    Navigator.of(context).pop();
    await editCardApi(id: index);
  }

  bool validation() {
    if (fullNameController.text.isEmpty) {
      errorToast(Strings.fullNameError);
      return false;
    } else if (addressController.text.isEmpty) {
      errorToast(Strings.addresserror);
      return false;
    } else if (cityController.text.isEmpty) {
      errorToast(Strings.cityeError);
      return false;
    } else if (postalCodeController.text.isEmpty) {
      errorToast(Strings.postalCodeError);
      return false;
    } else if (countryController.text.isEmpty) {
      errorToast(Strings.countryError);
      return false;
    } else if (nameOnCardController.text.isEmpty) {
      errorToast(Strings.nameonCardError);
      return false;
    } else if (cardNmberController.text.isEmpty) {
      errorToast(Strings.cardnumberError);
      return false;
    } else if (cardNmberController.text.length != 16) {
      errorToast(Strings.cardnumberErrorValidation);
      return false;
    } else if (expiryYearController.text.isEmpty) {
      errorToast(Strings.expiryYearError);
      return false;
    } else if (expiryMonthController.text.isEmpty) {
      errorToast(Strings.expiryYearError);
      return false;
    } else if (cvvController.text.isEmpty) {
      errorToast(Strings.cVVError);
      return false;
    } else if (cvvController.text.length != 3) {
      errorToast(Strings.cVVErrorValidation);
      return false;
    }
    return true;
  }

  RxBool loader = false.obs;

  void onCountryCoCityChange(String value) {
    selectCountry = value;
    countryController.text = value;
    update(['addCard']);
  }

  ListCardModel listCardModel = ListCardModel();



   editCardApi({int? id}) {
    try {
      paymentController.loader.value = true;
      EditCardApi.editCardApi(
        idCard: id,
        country: countryController.text,
        postalCode: postalCodeController.text,
        city: cityController.text,
        address: cityController.text,
        fullName: fullNameController.text,
        exYear: expiryYearController.text,
        exMonth: expiryMonthController.text,
        cardHolder: nameOnCardController.text,
      ).then((value){
        final PaymentController controller = Get.find();
        controller.listCardApi(showToast: false);
      });
      update(['more']);
      paymentController.loader.value = false;

    } catch (e) {
      debugPrint(e.toString());
    }
  }
}