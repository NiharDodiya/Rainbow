import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/screens/dashboard/dashboard_controller.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/color_res.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      id: 'bottom_bar',
      builder: (controller) {
        return SafeArea(
          child: Row(
            children: [
              tab(AssetRes.home, AssetRes.home, 0),
              tab(AssetRes.search, AssetRes.search, 1),
              tab(AssetRes.message, AssetRes.message, 2),
              tab(AssetRes.profile, AssetRes.profile, 3),
            ],
          ),
        );
      },
    );
  }

  Widget tab(String icon1, String icon2, int index) {
    return GetBuilder<DashboardController>(
      id: 'bottom_bar',
      builder: (controller) {
        return Expanded(
          child: InkWell(
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () => controller.onBottomBarChange(index),
            child: Container(
                padding: const EdgeInsets.all(15),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    /*     BoxShadow(
                    color: index == controller.currentTab
                        ? ColorRes.themeColor.withOpacity(0.55)
                        : Colors.transparent,
                    blurRadius: 40,
                  ),*/
                  ],
                ),
                child: index == controller.currentTab
                    ? Container(
                        height: Get.height * 0.090,
                        width: Get.width * 0.256,
                        decoration: BoxDecoration(
                            color: ColorRes.color_2F80ED.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(20)),
                        child: Image.asset(
                          icon1,
                          height: 16,
                          width: 16,
                        ),
                      )
                    : Image.asset(
                        icon2,
                        height: 16,
                        width: 16,
                      )),
          ),
        );
      },
    );
  }
}
