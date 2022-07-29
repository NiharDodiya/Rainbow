import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/screens/Home/home_screen.dart';
import 'package:rainbow/screens/Message/message_screen.dart';
import 'package:rainbow/screens/Profile/profile_screen.dart';
import 'package:rainbow/screens/Search/search_screen.dart';
import 'package:rainbow/screens/dashboard/dashboard_controller.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/color_res.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    final DashboardController controller = Get.put(DashboardController());
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
        child: GetBuilder<DashboardController>(
          id: 'bottom_bar',
          builder: (controller) {
            if (controller.currentTab == 0) {
              return HomeScreen();
            } else if (controller.currentTab == 1) {
              return SearchScreen();
            } else if (controller.currentTab == 2) {
              return const MessageScreen();
            } else {
              return ProfileScreen();
            }
          },
        ),
      ),
      bottomNavigationBar: GetBuilder<DashboardController>(
        id: "bottom_bar",
        builder: (controller) {
          return SalomonBottomBar(
            margin: const EdgeInsets.all(12),
            selectedItemColor: ColorRes.color_2F80ED,
            unselectedItemColor: ColorRes.color_9597A1,
            currentIndex: controller.currentTab,
            onTap: (int index) {
              controller.onBottomBarChange(index);
              setState(() {});
            },
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
          );
        },
      ),
    );
  }
}
