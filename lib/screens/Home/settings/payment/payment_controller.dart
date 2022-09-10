import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/model/listCardModel.dart';
import 'package:rainbow/model/remove_card_model.dart';
import 'package:rainbow/model/viewCardModel.dart';
import 'package:rainbow/screens/Home/settings/payment/widget/remove_dialog.dart';
import 'package:rainbow/screens/advertisement/ad_payment/ad_payment_api/ad_payment_api.dart';

class PaymentController extends GetxController {
  PageController pageController =
      PageController(initialPage: 1, viewportFraction: 0.86, keepPage: true);
  int selectedIndex = 0;
  RxBool loader = false.obs;



  void onInit() {
    listCardApi(showToast: true);
    /*viewCardApi();*/
    /*Future.delayed(Duration(seconds: 2),(){
      viewCardApi();
    });*/
    update();
    super.onInit();
  }

  changeIndex(int id) {
    selectedIndex = id;
    update(['index']);
  }

  ListCardModel listCardModel = ListCardModel();
  ViewCardModel viewCardModel = ViewCardModel();
  RemoveCardModel removeCardModel = RemoveCardModel();

  navigateToRemove(BuildContext context) async {
    await showDialog(
        context: context, builder: (context) =>  RemoveDialog());
  }



  listCardApi({required bool showToast}) async{
   try {
     loader.value = true;
     listCardModel = await ListCartApi.listCardsApi(showToast: showToast);
     update(['more']);
     loader.value = false;
     viewCardApi();
   } catch (e) {
     debugPrint(e.toString());
   }
}



 void viewCardApi()async{
   try {
     viewCardModel = await ListCartApi.viewCardsApi(id: listCardModel.data?[selectedIndex].id ?? 0);
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
     listCardApi(showToast: false);
    } catch (e) {
      debugPrint(e.toString());
    }
  }



}
