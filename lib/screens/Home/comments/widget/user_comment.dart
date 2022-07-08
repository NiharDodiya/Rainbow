import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/color_res.dart';

Widget userComment() {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        height: 40,
        width: 40,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(50)),
          child: Image.asset(
            AssetRes.advertisement_1Image,
            fit: BoxFit.fill,
          ),
        ),
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 60,
            width: Get.width - 90,
            decoration: BoxDecoration(
              color: ColorRes.color_959595.withOpacity(0.1),
              borderRadius: const BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            margin: const EdgeInsets.only(left: 5),
            padding: const EdgeInsets.all(7),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Wilma Warren",
                  style: beVietnamProMediumTextStyle(color: ColorRes.black),
                ),
                const SizedBox(
                  height: 7,
                ),
                Text(
                  "Hdolor sit amet, consectetur",
                  style: beVietnamProRegularTextStyle(
                      fontSize: 12, color: ColorRes.black),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "1 min ago",
                style: beVietnamProRegularTextStyle(
                  fontSize: 10,
                  color: ColorRes.color_959595,
                ),
              ),
              InkWell(
                child: Container(
                  padding: const EdgeInsets.only(left: 15,top: 5,right: 15,bottom: 5),
                  child: Text(
                    "Reply",
                    style: beVietnamProRegularTextStyle(
                      fontSize: 12,
                      color: ColorRes.color_959595,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      )
    ],
  );
}
