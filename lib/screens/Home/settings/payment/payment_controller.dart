import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/screens/Home/settings/payment/widget/remove_dialog.dart';

class PaymentController extends GetxController {
  PageController pageController =
      PageController(initialPage: 1, viewportFraction: 0.86, keepPage: true);
  int selectedIndex = 1;

  changeIndex(int id) {
    selectedIndex = id;
    update(['index']);
  }

  navigateToRemove(BuildContext context) async {
    await showDialog(
        context: context, builder: (context) => const RemoveDialog());
  }
}
