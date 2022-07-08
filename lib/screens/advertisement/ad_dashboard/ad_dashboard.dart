import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/screens/advertisement/ad_dashboard/advertisement_controlle.dart';
import 'package:rainbow/screens/advertisement/ad_home/ad_home_screen.dart';
import 'package:rainbow/screens/advertisement/ad_notification/ad_notification_screen.dart';
import 'package:rainbow/screens/advertisement/ad_payment/ad_payment_screen.dart';
import 'package:rainbow/screens/advertisement/ad_support/ad_support_screen.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/color_res.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class AdvertisementDashBord extends StatelessWidget {
  const AdvertisementDashBord({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AdvertisementController controller = Get.put(AdvertisementController());
    return Scaffold(
      key: controller.key,
      drawer: Drawer(),
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
              return const AdPaymentScreen();
            } else if (controller.currentTab == 2) {
              return const AdNotificationsScreen();
            } else {
              return const AdSupportScreen();
            }
          },
        ),
      ),
      bottomNavigationBar: GetBuilder<AdvertisementController>(
        id: 'bottom_bar',
        builder: (_) => SalomonBottomBar(
          margin: const EdgeInsets.all(12),
          selectedItemColor: ColorRes.color_2F80ED,
          unselectedItemColor: ColorRes.color_9597A1,
          currentIndex: controller.currentTab,
          onTap: (i) => controller.onBottomBarChange(i),
          items: [
            /// Home
            SalomonBottomBarItem(
              icon: Image.asset(
                AssetRes.home,
                height: 16,
                color: controller.currentTab == 0
                    ? ColorRes.color_2F80ED
                    : ColorRes.color_9597A1,
              ),
              title: Text(
                "Home",
                style: gilroyBoldTextStyle(
                    color: ColorRes.color_2F80ED, fontSize: 14),
              ),
            ),

            /// search
            SalomonBottomBarItem(
              icon: Image.asset(
                AssetRes.paymentIcon,
                height: 16,
                color: controller.currentTab == 1
                    ? ColorRes.color_2F80ED
                    : ColorRes.color_9597A1,
              ),
              title: Text(
                "Payment",
                style: gilroyBoldTextStyle(
                    color: ColorRes.color_2F80ED, fontSize: 14),
              ),
            ),

            /// message
            SalomonBottomBarItem(
              icon: Image.asset(
                AssetRes.adeNotificationIcon,
                height: 20,
                color: controller.currentTab == 2
                    ? ColorRes.color_2F80ED
                    : ColorRes.color_9597A1,
              ),
              title: Text(
                "Notification",
                style: gilroyBoldTextStyle(
                    color: ColorRes.color_2F80ED, fontSize: 14),
              ),
            ),

            /// Profile
            SalomonBottomBarItem(
              icon: Image.asset(
                AssetRes.supportIcon,
                height: 16,
                color: controller.currentTab == 3
                    ? ColorRes.color_2F80ED
                    : ColorRes.color_9597A1,
              ),
              title: Text(
                "Support",
                style: gilroyBoldTextStyle(
                    color: ColorRes.color_2F80ED, fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
