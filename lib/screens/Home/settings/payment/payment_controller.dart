import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/popup.dart';
import 'package:rainbow/model/listCardModel.dart';
import 'package:rainbow/model/remove_card_model.dart';
import 'package:rainbow/model/transactionModel.dart';
import 'package:rainbow/model/viewCardModel.dart';
import 'package:rainbow/screens/Home/home_controller.dart';
import 'package:rainbow/screens/Home/settings/payment/widget/remove_dialog.dart';
import 'package:rainbow/screens/advertisement/ad_payment/ad_payment_api/ad_payment_api.dart';

import 'add_cart/add_cart_controller.dart';

class PaymentController extends GetxController {
  PageController pageController =
      PageController(initialPage: 0, viewportFraction: 0.86, keepPage: true);
  int selectedIndex = 0;
  RxBool loader = false.obs;

  AddCartController addCartController = Get.put(AddCartController());

  HomeController homeController = Get.put(HomeController());

  void onInit() {
    listCardApi(showToast: true);
    transactionApi();
    print(homeController.viewProfile.data!.userType);
    update();
    super.onInit();
  }

  /*changeIndex(int index) {
    selectedIndex = index;
    viewCardApi();
    update(["more"]);
  }*/

  ListCardModel listCardModel = ListCardModel();
  ViewCardModel? viewCardModel = ViewCardModel();
  RemoveCardModel removeCardModel = RemoveCardModel();
  TransactionModel transactionModel = TransactionModel();

  navigateToRemove(BuildContext context) async {
    await showDialog(
        context: context, builder: (context) =>  RemoveDialog());
  }



  listCardApi({required bool showToast}) async{
   try {
     loader.value = true;
     listCardModel = await ListCartApi.listCardsApi(showToast: showToast);
     loader.value = false;
     update(['more']);
     HomeController homeController = Get.put(HomeController());
     listCardModel.data?.length == null? homeController.viewProfile.data!.userType = "free" : homeController.viewProfile.data!.userType = "premium";
     viewCardApi();
     update(['more']);
   } catch (e) {
     debugPrint(e.toString());
   }
}



 void viewCardApi()async{
   try {
     loader.value = true;
     viewCardModel = await ListCartApi.viewCardsApi(id: listCardModel.data?[selectedIndex].id ?? 0);
     loader.value = false;
     update(['more']);
   } catch (e) {
     debugPrint(e.toString());
   }
 }

  void removeCardApi()async{
     loader.value = true;
    try {
     removeCardModel = await ListCartApi.removeCardApi(id: listCardModel.data?[selectedIndex].id ?? 0);
     update(['more']);
     loader.value = false;
     await listCardApi(showToast: false);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  transactionApi ()async{
    loader.value = true;
    try {
      transactionModel = await ListCartApi.transactionApi();
      update(['more']);
      loader.value = false;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  defaultCardApi () async{
    loader.value = true;
    try {
      if(listCardModel.data?[selectedIndex].id == null){
        errorToast("Card not available");
        loader.value = false;
      }else{
        transactionModel = await ListCartApi.defaultCardApi(id: listCardModel.data?[selectedIndex].id ?? 0);
        update(['more']);
        loader.value = false;
      }

    } catch (e) {
      debugPrint(e.toString());
      loader.value = false;
    }
  }

}
