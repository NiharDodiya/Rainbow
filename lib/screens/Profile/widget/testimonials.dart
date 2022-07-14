import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/color_res.dart';
import 'package:rainbow/utils/strings.dart';

Widget testimonials() {
  return Padding(
    padding: const EdgeInsets.only(left: 30, right: 30),
    child: SizedBox(
      // height: 435,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Text(
            Strings.noTestimonials,
            style: beVietnamProBoldTextStyle(fontSize: 18),
          ),
          const SizedBox(
            height: 10,
          ),
    /*      ListView.separated(padding: const EdgeInsets.only(top: 15),
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return listOfTestimonials();
            },
            separatorBuilder: (context, index) {
              return Divider(
                height: 24,
                color: ColorRes.white.withOpacity(0.7),
              );
            },
            itemCount: 2,
            shrinkWrap: true,
          ),
          Divider(
            height: 25,
            color: ColorRes.white.withOpacity(0.7),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              iconForSlider(AssetRes.leftIcon),
              Container(
                height: 20,
                width: 30,
                margin: const EdgeInsets.only(bottom: 10,top: 5),
                alignment: Alignment.center,
                child: Text(
                  "1",
                  style: gilroyMediumTextStyle(fontSize: 14),
                ),
              ),
              iconForSlider(AssetRes.rightIcon),
            ],
          )*/
        ],
      ),
    ),
  );
}

Widget iconForSlider(String image) {
  return Container(
    height: 20,
    width: 20,
    margin: const EdgeInsets.only(left: 10,right: 10,bottom: 10,top: 5),
    child: Image.asset(
      image,
      height: 20,
      width: 20,
    ),
  );
}

Widget listOfTestimonials({
  String? title,
  String? subtitle,
  String? date,
}) {
  return Column(
    children: [
      Row(
        children: [
          Container(
            height: 50,
            width: 50,
            margin: const EdgeInsets.only(right: 8),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(
                  AssetRes.selfiePicture,
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: Get.width - 130,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        title ?? "Amber Davis",
                        overflow: TextOverflow.clip,
                        maxLines: 2,
                        style: gilroyRegularTextStyle(fontSize: 16),
                      ),
                    ),
                    Text(date ?? "7/28/2021",
                        style: gilroyRegularTextStyle(fontSize: 12)),
                  ],
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                subtitle ?? "SURROGATE MOM",
                style: gilroyRegularTextStyle(fontSize: 12),
              ),
            ],
          ),
        ],
      ),
      const SizedBox(
        height: 14,
      ),
      Text(
        '"${Strings.aboutMeDes} ${Strings.aboutMeDes}"',
        style: gilroyRegularTextStyle(fontSize: 14),
      ),
    ],
  );
}
