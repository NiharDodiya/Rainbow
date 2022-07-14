// ignore_for_file: sort_child_properties_last

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/buttons.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/screens/Home/settings/payment/payment_screen.dart';
import 'package:rainbow/screens/advertisement/ad_dashboard/advertisement_controlle.dart';
import 'package:rainbow/screens/advertisement/ad_dashboard/change_password/change_password_screen.dart';
import 'package:rainbow/screens/advertisement/ad_home/ad_home_screen.dart';
import 'package:rainbow/screens/advertisement/ad_notification/ad_notification_screen.dart';
import 'package:rainbow/screens/advertisement/ad_support/ad_support_screen.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/color_res.dart';
import 'package:rainbow/utils/strings.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../account_Information/account_Information_screen.dart';
import '../../auth/phonenumber/phonenumber_Screen.dart';
import '../../auth/verify_phone/verifyphone_screen.dart';

class AdvertisementDashBord extends StatelessWidget {
  const AdvertisementDashBord({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AdvertisementController controller = Get.put(AdvertisementController());
    return Scaffold(
      key: controller.key,
      drawer: Drawer(
        backgroundColor: ColorRes.white,
        child: Padding(
          padding: EdgeInsets.only(
              top: Get.height * 0.0775, left: Get.width * 0.05210),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: Get.width * 0.1730,
                    width: Get.width * 0.1730,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(AssetRes.account),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: Get.width * 0.0255,
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Strings.raymondMarcos,
                          style: gilroyRegularTextStyle(
                              fontSize: 24, color: ColorRes.color_09110E),
                        ),
                        SizedBox(
                          height: Get.height * 0.0086,
                        ),
                        Text(
                          Strings.myEmail,
                          style: gilroyBoldTextStyle(
                              fontSize: 14, color: ColorRes.color_09110E),
                        )
                      ]),
                  const Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.key.currentState!.closeDrawer();
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: Get.width * 0.0293,
                          ),
                          child: const Icon(
                            Icons.close,
                            color: ColorRes.black,
                          ),
                        ),
                      ),
                      Container(
                        height: Get.height * 0.0555,
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: Get.height * 0.0467,
              ),
              //Change Password
              InkWell(
                onTap: () {
                  Get.to(() => PhoneNumberScreen());
                },
                child: SizedBox(
                  height: Get.height * 0.06,
                  child: Row(
                    children: [
                      Image.asset(
                        AssetRes.lockicon,
                        width: Get.width * 0.04706,
                      ),
                      SizedBox(
                        width: Get.width * 0.0853,
                      ),
                      Text(
                        Strings.changePassword,
                        style: gilroyMediumTextStyle(
                          fontSize: 16,
                          color: ColorRes.color_09110E,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //Account Information
              InkWell(
                onTap: () => controller.inTapAccountInfo(),
                child: SizedBox(
                  height: Get.height * 0.06,
                  child: Row(
                    children: [
                      Image.asset(
                        AssetRes.profileicon,
                        width: Get.width * 0.04706,
                      ),
                      SizedBox(
                        width: Get.width * 0.0853,
                      ),
                      Text(
                        Strings.accountInformation,
                        style: gilroyMediumTextStyle(
                          fontSize: 16,
                          color: ColorRes.color_09110E,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Notification
              GetBuilder<AdvertisementController>(
                id: 'notifi',
                builder: (controller) => InkWell(
                  onTap: controller.notification,
                  child: SizedBox(
                    height: Get.height * 0.06,
                    child: Row(
                      children: [
                        Image.asset(
                          AssetRes.notificationicon,
                          color: ColorRes.color_EDB933,
                          width: Get.width * 0.04706,
                        ),
                        SizedBox(
                          width: Get.width * 0.0853,
                        ),
                        Text(
                          Strings.notification,
                          style: gilroyMediumTextStyle(
                            fontSize: 16,
                            color: ColorRes.color_09110E,
                          ),
                        ),
                        const Spacer(),
                        SizedBox(
                          width: Get.width * 0.09066,
                          height: Get.height * 0.02545,
                          child: Transform.scale(
                            scale: .7,
                            child: CupertinoSwitch(
                              activeColor: ColorRes.color_CE8CEC,
                              value: controller.isSwitched,
                              onChanged: (bool value) {
                                // context.read<HomeBloc>().add(TapSwitch());
                              },
                            ),
                          ),
                        ),
                        SizedBox(width: Get.width * 0.0483)
                      ],
                    ),
                  ),
                ),
              ),
              const Spacer(),
              SubmitButton(
                onTap: controller.onTapLogOut,
                child: Row(
                  children: [
                    const Spacer(),
                    Image.asset(
                      AssetRes.logouticon,
                      height: 22,
                    ),
                    const SizedBox(
                      width: 26,
                    ),
                    Text(
                      Strings.logout02,
                      style: gilroyBoldTextStyle(
                          fontSize: 16, color: ColorRes.black),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
              SizedBox(
                height: Get.height * 0.0665,
              )
            ],
          ),
        ),
        width: Get.width - (Get.width * 0.0853),
      ),
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
              return AdHomeScreen();
            } else if (controller.currentTab == 1) {
              return PaymentScreen();
              // const AdPaymentScreen();
            } else if (controller.currentTab == 2) {
              return const AdNotificationsScreen();
            } else {
              return AdSupportScreen();
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
