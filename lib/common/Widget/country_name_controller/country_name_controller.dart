import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CountryNameController extends GetxController{
  bool countryBox = false;



  dropDownBox(){
    if(countryBox == false){
      countryBox = true;
      update(["drop"]);
    }
    else{
      countryBox = false;
      update(["drop"]);
    }
    update();
  }
}