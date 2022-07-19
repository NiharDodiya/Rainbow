import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoryController extends GetxController {
  TextEditingController sendMessage = TextEditingController();
  int currentIndex = 0;
  PageController? pageController;

  void onChanged(int page) {
    currentIndex = page;
    update(['story']);
  }

  @override
  void onInit() {
    pageController = PageController(initialPage: 0);
    super.onInit();
  }

  @override
  void dispose() {
    pageController!.dispose();
    super.dispose();
  }
}
