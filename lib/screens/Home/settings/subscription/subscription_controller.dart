import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubscriptionController extends GetxController {
  PageController pageController =
      PageController(
        // initialPage: 1, viewportFraction: 0.65, keepPage: true
        );
  int selectedIndex = 1;
  changeIndex(int id) {
    selectedIndex = id;
    update(['index']);
  }
}
