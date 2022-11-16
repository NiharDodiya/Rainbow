import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/model/subscription_model.dart';
import 'package:rainbow/screens/Home/settings/subscription/subscription_api/subscription_api.dart';

class SubscriptionController extends GetxController {
  PageController pageController = PageController(
      // initialPage: 1, viewportFraction: 0.65, keepPage: true
      );
  RxBool loader = false.obs;
  int selectedIndex = 1;

  changeIndex(int id) {
    selectedIndex = id;
    update(['index']);
  }

  SubscriptionModel subscriptionModel = SubscriptionModel();

  Future<void> subscriptionDataApi() async {

    try {
      loader.value = true;
      subscriptionModel = await SubscriptionApi.subscriptionApi();
      print(subscriptionModel);
      loader.value = false;

      update(["Sub"]);
    } catch (e) {
      debugPrint(e.toString());
      loader.value = false;

    }
  }
}
