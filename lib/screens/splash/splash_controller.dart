import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/screens/auth/auth_dashboard/auth_dashboard.dart';
import 'package:rainbow/service/pref_services.dart';
import 'package:rainbow/utils/pref_keys.dart';

class SplashController extends GetxController {
  late PageController pageController;
  int currentIndex = 0;

  @override
  void onInit() {
    pageController = PageController(initialPage: 0);
    super.onInit();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void onChanged(int page) {
    currentIndex = page;
    update(['splash']);
  }

  void onNextBtnTap() {
    if (pageController.page!.round() == 1) {
      onSkipTap();
    } else {
      pageController.animateToPage(
        pageController.page!.round() + 1,
        duration: 500.milliseconds,
        curve: Curves.ease,
      );
    }
  }

  Future<void> onSkipTap() async {
    await PrefService.setValue(PrefKeys.skipBoardingScreen, true);
    Get.offAll(() => AuthDashboard());
    update(['splash']);
  }
}
