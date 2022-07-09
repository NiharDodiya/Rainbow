import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/buttons.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/screens/advertisement/ad_home/ad_home_controller.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/color_res.dart';
import 'package:rainbow/utils/strings.dart';

Widget noAdvertisement() {
  return GetBuilder<AdHomeController>(builder: (controller) {
  return Expanded(
    child: Container(
      margin: EdgeInsets.only(top: 20),
      width: Get.width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            ColorRes.color_735EB0,
            ColorRes.color_D18EEE,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        children: [
          Container(
            height: 142,
            margin: const EdgeInsets.only(top: 34, bottom: 30),
            child: Image.asset(
              AssetRes.frameImage,
              fit: BoxFit.fitHeight,
            ),
          ),
          Text(
            Strings.noAdvertisement,
            style: gilroySemiBoldTextStyle(fontSize: 24),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 100,
          ),
           SubmitButton(onTap: controller.onTapNext,
            text: Strings.createAdvertisement,
          ),
        ],
      ),
    ),
  );
  },

  );
}
