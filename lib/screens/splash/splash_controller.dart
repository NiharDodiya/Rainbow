import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashController extends GetxController{

  late PageController pageController;
  int currentIndex = 0;

@override
  void onInit()
{
  pageController = PageController(initialPage: 0);
  super.onInit();
}
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
void onChanged(int page)
{
   currentIndex = page;
   update(['splash']);
}

}