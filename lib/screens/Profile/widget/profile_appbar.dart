import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/screens/Home/settings/connections/connections_controller.dart';
import 'package:rainbow/screens/Home/settings/connections/connections_screen.dart';
import 'package:rainbow/screens/Profile/widget/edit_profile/editProfile_contoller.dart';
import 'package:rainbow/screens/Profile/widget/edit_profile/edit_profile_Screen.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/color_res.dart';

Widget profileAppbar(String text, bool show) {
  return Padding(
    padding: const EdgeInsets.only(top: 10, left: 18.50, right: 18.50),
    child: Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 3),
          width: Get.width - 38,
          alignment: Alignment.center,
          child: Text(
            text,
            style: gilroyBoldTextStyle(fontSize: 18),
          ),
        ),
        Row(
          children: [
            InkWell(
              onTap: () {
                Get.back();
              },
              child: Container(
                padding: const EdgeInsets.all(7),
                height: 30,
                width: 30,
                child: Image.asset(
                  AssetRes.backIcon,
                  height: 15,
                ),
              ),
            ),
            const Spacer(),
            show
                ? InkWell(
                    onTap: () {
                      EditProfileController editController =
                          Get.put(EditProfileController());
                      editController.init();
                      Get.to(() => const EditProfileScreen());
                    },
                    child: SizedBox(
                      height: 31,
                      width: 31,
                      child: Image.asset(AssetRes.editIcon),
                    ),
                  )
                : const SizedBox(),
            const SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: () {
                ConnectionsController connectionController =
                    Get.put(ConnectionsController());
                connectionController.init();
                Get.to(() => ConnectionsScreen());
              },
              child: Stack(
                children: [
                  const SizedBox(
                    height: 30,
                    width: 30,
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: SizedBox(
                      height: 24,
                      width: 24,
                      child: Image.asset(AssetRes.notificationIcon),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      height: 16,
                      width: 16,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: ColorRes.color_FF6B97),
                      child: const Text(
                        "0",
                        style: TextStyle(
                          color: ColorRes.white,
                          fontSize: 8,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
