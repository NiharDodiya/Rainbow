import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:rainbow/common/helper.dart';
import 'package:rainbow/screens/Home/home_controller.dart';
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
  String? myId;

  RxBool loader = false.obs;

  bool countryBox = false;

  dropDownBox() {
    if (countryBox == false) {
      countryBox = true;
      update(["drop"]);
    } else {
      countryBox = false;
      update(["drop"]);
    }
    update();
  }

  List filterList = [];

  void serching(value) {
    filterList = (countryCity.where((element) {
      return element
          .toString()
          .toLowerCase()
          .contains(value.toString().toLowerCase());
    }).toList());
    update(["drop"]);
  }

  /*void serching(value) {
    filterList = (countryCity.where(
            (element) {
              return element.toString().toLowerCase().contains(value);
        })
        .toList());
    update(["drop"]);
  }*/

  @override
  void onInit() {
    update();
    super.onInit();
  }

  addCart(context) async {
    FocusScopeNode currentfocus = FocusScope.of(context);
    if (!currentfocus.hasPrimaryFocus) {
      currentfocus.unfocus();
    }

    if (validation()) {
      loader.value = true;
      Future.delayed(const Duration(seconds: 1), () {
        addCartDetails(context);

        /*  Get.find<PaymentController>().viewCardModel;
        update(["abc"]);*/
      });
    }
  }

  bool validation() {
    for (int i = 0; i < countryCity.length; i++) {
      if (countryCity[i] == countryController.text) {
        myId = countryController.text;
      }
    }
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
    } else if (myId == null || myId == "") {
      errorToast("Please enter valid country name");
      return false;
    }
    return true;
  }

  void onCountryCoCityChange(String value) {
    selectCountry = value;
    countryController.text = value;
    update(['addCard']);
  }

  void addCartDetails(context) {
    try {
      loader.value = true;
      AddCartApi.addCartDetailsApi(
        context,
        cardNumber: cardNmberController.text,
        exMonth: expiryMonthController.text,
        cardHolder: nameOnCardController.text,
        cvv: cvvController.text,
        exYear: expiryYearController.text,
        fullName: fullNameController.text,
        address: cityController.text,
        city: cityController.text,
        postalCode: postalCodeController.text,
        country: countryController.text,
      ).then((value) async {
        final PaymentController controller = Get.find();
        await controller.listCardApi(showToast: false);
        await controller.transactionApi();
        //await UserSubscriptionAddApi.userSubscriptionAddApi();
        final HomeController homeController = Get.find();
        controller.listCardModel.data?.length == null
            ? homeController.viewProfile.data!.userType = "free"
            : homeController.viewProfile.data!.userType = "premium";
        // await UserSubscriptionAddApi.userSubscriptionAddApi();
        loader.value = false;
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
