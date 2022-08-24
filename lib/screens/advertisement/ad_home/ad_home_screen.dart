import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/screens/advertisement/ad_home/ad_home_controller.dart';
import 'package:rainbow/screens/advertisement/ad_home/widget/advertisement_list.dart';
import 'package:rainbow/screens/advertisement/ad_home/widget/appbar.dart';
import 'package:rainbow/screens/advertisement/ad_home/widget/no_advertisement.dart';
import 'package:rainbow/utils/color_res.dart';

import '../../dashboard/dashboard_controller.dart';

class AdHomeScreen extends StatelessWidget {
  AdHomeScreen({Key? key}) : super(key: key);
  DashboardController dashboardController = Get.put(DashboardController());
  AdHomeController adHomeController = Get.put(AdHomeController());
  @override
  Widget build(BuildContext context) {
    adHomeController.myAdvertiserListData();
    return Scaffold(
// key: dashboardController.key,
// drawer: Drawer(),
      body: SafeArea(
        child: Container(
          width: Get.width,
          height: Get.height - 80,
          //padding: const EdgeInsets.only(left: 30,right: 30,top: 40),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                ColorRes.color_50369C,
                ColorRes.color_D18EEE,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            children: [
              appbar(),
              GetBuilder<AdHomeController>(
                id: 'list',
                builder: (controller) => controller.listShow
                    ? advertisementList()
                    : noAdvertisement(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
