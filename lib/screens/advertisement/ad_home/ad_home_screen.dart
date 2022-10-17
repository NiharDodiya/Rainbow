import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/loaders.dart';
import 'package:rainbow/screens/advertisement/ad_home/ad_home_controller.dart';
import 'package:rainbow/screens/advertisement/ad_home/screen/update_advertisement/update_advertisement_controller.dart';
import 'package:rainbow/screens/advertisement/ad_home/widget/advertisement_list.dart';
import 'package:rainbow/screens/advertisement/ad_home/widget/appbar.dart';
import 'package:rainbow/screens/advertisement/ad_home/widget/no_advertisement.dart';
import 'package:rainbow/utils/color_res.dart';

import '../../dashboard/dashboard_controller.dart';

class AdHomeScreen extends StatefulWidget {
  const AdHomeScreen({Key? key}) : super(key: key);

  @override
  State<AdHomeScreen> createState() => _AdHomeScreenState();
}

class _AdHomeScreenState extends State<AdHomeScreen> {
  DashboardController dashboardController = Get.put(DashboardController());

  AdHomeController adHomeController = Get.put(AdHomeController());

  UpdateAdvertiseController updateAdvertiseController =
      Get.put(UpdateAdvertiseController());

  @override
  Widget build(BuildContext context) {
    adHomeController.init();
    adHomeController.myAdvertiserListData();
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: Get.width,
          //height: Get.height - 80,
          //padding: const EdgeInsets.only(left: 30,right: 30,top: 40),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                ColorRes.color_50369C,
                ColorRes.colorD18EEE,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Obx(() {
            return Stack(
              children: [
                Column(
                  children: [
                    appbar(context: context),
                    GetBuilder<AdHomeController>(
                        id: 'list',
                        builder: (controller) {
                          return (controller.myAdvertiserModel.data == null ||
                                  controller.myAdvertiserModel.data!.length ==
                                      0)
                              ? noAdvertisement()
                              : advertisementList();
                        }),
                  ],
                ),
                adHomeController.loader.isTrue
                    ? const FullScreenLoader()
                    : const SizedBox(),
                updateAdvertiseController.loader.value == true
                    ? const FullScreenLoader()
                    : const SizedBox(),
              ],
            );
          }),
        ),
      ),
    );
  }
}

/*
RefreshIndicator(
            onRefresh: () => adHomeController.onRefresh(),
 */
