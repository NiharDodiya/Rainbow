import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/screens/advertisement/ad_dashboard/advertisement_controlle.dart';
import 'package:rainbow/screens/advertisement/ad_home/ad_home_screen.dart';
import 'package:rainbow/screens/advertisement/ad_notification/ad_notification_screen.dart';
import 'package:rainbow/screens/advertisement/ad_payment/ad_payment_screen.dart';
import 'package:rainbow/screens/advertisement/ad_support/ad-support_screen.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/color_res.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class AdvertisementDashBorad extends StatefulWidget {
  const AdvertisementDashBorad({Key? key}) : super(key: key);

  @override
  State<AdvertisementDashBorad> createState() => _AdvertisementDashBoradState();
}

class _AdvertisementDashBoradState extends State<AdvertisementDashBorad> {
  @override
  Widget build(BuildContext context) {
    final AdvertisementController controller = Get.put(AdvertisementController());
    return Scaffold(
      backgroundColor: ColorRes.white,
      body: Container(
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
        child: GetBuilder<AdvertisementController>(
          id: 'bottom_bar',
          builder: (controller) {
            if (controller.currentTab == 0) {
              return const AdHomeScreen();
            } else if (controller.currentTab == 1) {
              return  AdPaymenetScreen();
            } else if (controller.currentTab == 2) {
              return const AdNotificationsScreen();
            } else {
              return const AdSupportScreen();
            }
          },
        ),
      ),
      bottomNavigationBar: SalomonBottomBar(margin: const EdgeInsets.all(12),
        selectedItemColor: ColorRes.color_2F80ED,
        unselectedItemColor: ColorRes.color_9597A1,
        currentIndex: controller.currentTab,
        onTap: (i) => setState(() => controller.currentTab = i),
        items: [
          /// Home
          SalomonBottomBarItem(
            icon: Image.asset(
              AssetRes.home,
              height: 16,
              width: 16,
              color: controller.currentTab == 0
                  ? ColorRes.color_2F80ED
                  : ColorRes.color_9597A1,
            ),
            title: Text("Home", style: textStyleFont14BlueW500),
          ),

          /// search
          SalomonBottomBarItem(
            icon: Image.asset(
              AssetRes.search,
              height: 16,
              width: 16,
              color: controller.currentTab == 1
                  ? ColorRes.color_2F80ED
                  : ColorRes.color_9597A1,
            ),
            title: Text("Search", style: textStyleFont14BlueW500),
          ),

          /// message
          SalomonBottomBarItem(
            icon: Image.asset(
              AssetRes.message,
              height: 16,
              width: 16,
              color: controller.currentTab == 2
                  ? ColorRes.color_2F80ED
                  : ColorRes.color_9597A1,
            ),
            title: Text(
              "Message",
              style: textStyleFont14BlueW500,
            ),
          ),

          /// Profile
          SalomonBottomBarItem(
            icon: Image.asset(
              AssetRes.profile,
              height: 16,
              width: 16,
              color: controller.currentTab == 3
                  ? ColorRes.color_2F80ED
                  : ColorRes.color_9597A1,
            ),
            title: Text("Profile", style: textStyleFont14BlueW500),
          ),
        ],
      ),
    );
  }
}
