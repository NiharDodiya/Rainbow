import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/premiumPopUpBox/premium_pop_up_box.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/screens/Home/home_controller.dart';
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

class DashboardState extends State<Dashboard> with WidgetsBindingObserver {
  final DashboardController controller = Get.put(DashboardController());

  @override
  void initState() {
    super.initState();
    controller.setUserOnlineStatus(true);
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state.index == 0) {
      controller.setUserOnlineStatus(true);
    } else if (state.index == 2) {
      controller.setUserOnlineStatus(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (controller.currentTab == 0) {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  backgroundColor: Colors.white,
                  title: Text(
                    "Are you sure you want exit app",
                    style:
                        gilroyBoldTextStyle(fontSize: 20, color: Colors.black),
                  ),
                  actions: <Widget>[
                    FlatButton(
                      child: Text(
                        "ok",
                        style: gilroyBoldTextStyle(
                            fontSize: 18, color: Colors.black),
                      ),
                      onPressed: () {
                        SystemNavigator.pop();
                      },
                    )
                  ],
                );
              });
        } else {
          controller.onBottomBarChange(0);
          setState(() {});
        }
        return false;
      },
      child: Scaffold(
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
                return MessageScreen();
              } else {
                return ProfileScreen(
                  i: 1,
                );
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
      ),
    );
  }
}
