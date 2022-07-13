import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/screens/Home/home_controller.dart';
import 'package:rainbow/screens/Home/settings/connections/connections_profile/connections_profile_controller.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/color_res.dart';

Widget connectAndBlock({
  String? title,
  String? subTitle,
  String? id,
}) {
  ConnectionsProfileController? controller =
      Get.put(ConnectionsProfileController());
  HomeController homeController = Get.find();
  return GetBuilder<ConnectionsProfileController>(
    id: "connections",
    builder: (controller) {
      return Column(
        children: [
          Text(
            title ?? "Amber J Santiago",
            style: gilroySemiBoldTextStyle(fontSize: 24),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            subTitle ?? "Surrogate Mom ",
            style: gilroyRegularTextStyle(fontSize: 14),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(onTap: () {
                controller.sendFriendRequestDetails(id!);
                },
                child: Row(
                  children: [
                    Container(
                      height: 22,
                      width: 22,
                      margin: const EdgeInsets.all(9),
                      child: Image.asset(
                        AssetRes.profilep,
                        color: ColorRes.color_FFB2B2,
                      ),
                    ),
                    Text(
                      "Connect",
                      style: beVietnamSemiBoldTextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              homeController.blockListModel.data!
                      .where((element) => element.id.toString() == id)
                      .isEmpty
                  ? InkWell(
                      onTap: () {
                        print(id);
                        controller.blockUserDetails(id);
                      },
                      child: Row(
                        children: [
                          Container(
                            height: 22,
                            width: 22,
                            margin: const EdgeInsets.all(9),
                            child: Image.asset(
                              AssetRes.block,
                              color: ColorRes.color_F82222.withOpacity(0.7),
                            ),
                          ),
                          Text(
                            "Block",
                            style: beVietnamSemiBoldTextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    )
                  : InkWell(
                      onTap: () {
                        controller.unBlockUserDetails(id.toString());
                      },
                      child: Row(
                        children: [
                          Container(
                            height: 22,
                            width: 22,
                            margin: const EdgeInsets.all(9),
                            child: Image.asset(
                              AssetRes.block,
                              color: ColorRes.color_F82222.withOpacity(0.7),
                            ),
                          ),
                          Text(
                            "UnBlock",
                            style: beVietnamSemiBoldTextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
            ],
          ),
        ],
      );
    },
  );
}
