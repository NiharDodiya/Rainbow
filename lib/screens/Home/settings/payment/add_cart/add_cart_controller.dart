import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:rainbow/model/listCardModel.dart';
import 'package:rainbow/screens/Home/settings/payment/add_cart/addCart_api/addCart_api.dart';
import 'package:rainbow/screens/Home/settings/payment/payment_controller.dart';

import '../../../../../common/popup.dart';
import '../../../../../utils/strings.dart';

class AddCartController extends GetxController {
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

  RxBool loader = false.obs;

  void onInit() {
    update();
    super.onInit();
  }

  addCart(context) {
    validation();
    Navigator.of(context).pop();
    addCartDetails(context);
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



  void onCountryCoCityChange(String value) {
    selectCountry = value;
    countryController.text = value;
    update(['addCard']);
  }


   PaymentController paymentController = Get.find();

  void addCartDetails(context) {
    try {
      paymentController.loader.value = true;
      AddCartApi.addCartDetailsApi(
        context,
        cardNumber: cardNmberController.text,
        exMonth: expiryMonthController.text,
        cardHolder: nameOnCardController.text,
        cvv: cvvController.text,
        exYear: expiryYearController.text,
        fullName: fullNameController.text,
        address:  cityController.text,
        city:  cityController.text,
        postalCode: postalCodeController.text,
        country: countryController.text,
      ).then((value){
        final PaymentController controller = Get.find();
        controller.listCardApi(showToast: false);
      });
      paymentController.loader.value = false;
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
