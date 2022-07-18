import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/color_res.dart';
import 'package:rainbow/utils/strings.dart';

Widget adInLatestFeed() {
  return Padding(
    padding: const EdgeInsets.only(bottom: 22.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Container(
            height: 253,
            width: Get.width * 0.92266,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.white),
              color: ColorRes.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, top: 20),
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage(AssetRes.selfiePicture))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, left: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "My Company",
                            style: gilroyBoldTextStyle(fontSize: 16,color: ColorRes.black),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Row(
                            children: [
                              Text(
                                "Sponsor",
                                style: gilroyBoldTextStyle(fontSize: 16,color: ColorRes.black.withOpacity(0.4)),
                              ),
                              Image.asset(AssetRes.worldIcon,height: 10,width: 10,)
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                Center(
                  child: SizedBox(
                      width: Get.width * 0.85333,
                      height: 96,
                      child: Text(
                        Strings.latestFeedDes,
                        style: textStyleFont16WhitLight,
                      )),
                ),
                SizedBox(
                  height: Get.height * 0.025,
                ),
              ],
            ),
          ),
        )
      ],
    ),
  );
}
