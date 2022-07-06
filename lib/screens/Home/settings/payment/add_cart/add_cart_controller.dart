import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../../common/popup.dart';
import '../../../../../utils/strings.dart';

class AddCartController extends GetxController {
  TextEditingController fullNameController =TextEditingController();
  TextEditingController addressController =TextEditingController();
  TextEditingController cityController =TextEditingController();
  TextEditingController countryController =TextEditingController();
  TextEditingController postalCodeController =TextEditingController();
  TextEditingController nameOnCardController =TextEditingController();
  TextEditingController cardNmberController =TextEditingController();
  TextEditingController expiryDateController =TextEditingController();
  TextEditingController cvvController =TextEditingController();
  void onInit()
  {
    update();
    super.onInit();
  }

  addCart(){
    validation();
  }
  
  bool validation() {
     if (fullNameController.text.isEmpty) {
      errorToast(Strings.fullNameError);
      return false;
    }  else if (addressController.text.isEmpty) {
      errorToast('Address is required');
      return false;
    } else if (cityController.text.isEmpty) {
      errorToast('city is required');
      return false;
    }  else if (postalCodeController.text.isEmpty) {
      errorToast('postal code is required');
      return false;
    } else if (countryController.text.isEmpty) {
      errorToast('Country is required');
      return false;
    } else if (nameOnCardController.text.isEmpty) {
      errorToast('Name on Card is required');
      return false;
    } else if (cardNmberController.text.isEmpty) {
      errorToast('card Number is required');
      return false;
    } else if (expiryDateController.text.isEmpty) {
      errorToast('expiry date is required');
      return false;
    } else if (cvvController.text.isEmpty) {
      errorToast('cvv is required');
      return false;
    }
    return true;
  }
}