import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchController extends GetxController
{
  RxBool loader = false.obs;
  TextEditingController searchBar = TextEditingController();

  @override
  void onInit()
  {
    init();
    super.onInit();
  }
  Future<void> init() async {
    loader.value = true;

  }
}