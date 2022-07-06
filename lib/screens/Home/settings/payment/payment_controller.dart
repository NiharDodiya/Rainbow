import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentController extends GetxController{
 PageController pageController =
        PageController(initialPage: 1, viewportFraction: 0.86,keepPage: true);
int selectedIndex = 1;
changeIndex(int id){
  selectedIndex =id;
  update(['index']);
}
}