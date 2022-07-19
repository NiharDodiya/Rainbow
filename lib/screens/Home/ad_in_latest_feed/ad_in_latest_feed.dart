import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/screens/Home/ad_in_latest_feed/learn_more_details.dart';
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
            height: Get.width * 1.05,
            width: Get.width * 0.92266,
            padding:
                const EdgeInsets.only(left: 9, top: 13, right: 20, bottom: 18),
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
                    Container(
                      height: 40,
                      width: 40,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage(AssetRes.selfiePicture))),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 9, left: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "My Company",
                            style: gilroyBoldTextStyle(
                                fontSize: 16, color: ColorRes.black),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Row(
                            children: [
                              Text(
                                "Sponsored.",
                                style: gilroyBoldTextStyle(
                                    fontSize: 16,
                                    color: ColorRes.black.withOpacity(0.4)),
                              ),
                              Image.asset(
                                AssetRes.worldIcon,
                                height: 10,
                                width: 10,
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Container(
                  height: Get.width * 0.43,
                  width: Get.width * 0.85333,
                  padding: const EdgeInsets.only(
                      left: 15, top: 10, bottom: 12, right: 6),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: Image.asset(
                      AssetRes.adsDetail,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(
                    left: 15,
                  ),
                  width: Get.width * 0.85333,
                  height: 110,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Surrogate Mom",
                        style: beVietnamProBoldTextStyle(
                            color: ColorRes.black, fontSize: 16),
                      ),
                      Text(
                        Strings.myCompanyDes,
                        maxLines: 3,
                        style: beVietnamSemiBoldTextStyle(
                                color: ColorRes.darkBlue.withOpacity(0.6),
                                fontSize: 14)
                            .copyWith(letterSpacing: 0, height: 1.5),
                      ),
                      Text(
                        "...more",
                        style: beVietnamSemiBoldTextStyle(
                            color: ColorRes.black.withOpacity(0.3),
                            fontSize: 14),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.to(() => const LearnMoreDetails());
                      },
                      child: Container(
                        height: 30,
                        width: Get.width * 0.32,
                        decoration: const BoxDecoration(
                          color: ColorRes.color_50369C,
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "LEARN MORE",
                          style: beVietnamSemiBoldTextStyle(
                              color: ColorRes.white, fontSize: 14),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    ),
  );
}
