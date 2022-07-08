import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/screens/Home/addStroy/addStory_controller.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/color_res.dart';
import 'package:rainbow/utils/strings.dart';

Widget addStoryCamera(AddStoryController controller) {
  return Column(
    children: [
      Container(
        height: Get.height * 0.31,
        width: Get.width * 0.328,
        color: ColorRes.color_F4F4F4,
        child: InkWell(
          onTap: () {
            controller.camera();
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 19.5,
                width: 19.5,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(AssetRes.shapeCamera),
                        fit: BoxFit.cover)),
              ),
              Text(
                Strings.camera,
                style: beVietnamSemiBoldTextStyle(
                    fontSize: 12, color: ColorRes.color_252525),
              )
            ],
          ),
        ),
      )
    ],
  );
}
