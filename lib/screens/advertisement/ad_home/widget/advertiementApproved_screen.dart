import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/screens/advertisement/ad_home/screen/create_advertisement/create_advertisement_controller.dart';
import 'package:rainbow/screens/advertisement/ad_home/widget/advertisementApproved_screen.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/color_res.dart';
import 'package:rainbow/utils/strings.dart';

class AdvertisementDetailsApprovedScreen extends StatelessWidget {
  AdvertisementDetailsApprovedScreen({Key? key}) : super(key: key);

  CreateAdvertisementController createAdvertisementController =
      Get.put(CreateAdvertisementController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: Get.width,
          height: Get.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                ColorRes.color_50369C,
                ColorRes.color_50369C,
                ColorRes.color_D18EEE,
                ColorRes.color_D18EEE,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            children: [
              top(),
              Expanded(
                  child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(), child: bottom())),
            ],
          ),
        ),
      ),
    );
  }

  Widget bottom() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Get.width * 0.08533),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 26,
          ),
          Row(
            children: [
              Text(
                "Surrogate Mom",
                style: gilroySemiBoldTextStyle(fontSize: 18),
              ),
              const Spacer(),
              InkWell(onTap: () {
                Get.to(()=>AdvertisementApprovedScreen());
              },
                child: Text(
                  Strings.approved,
                  style: gilroySemiBoldTextStyle(
                      fontSize: 18, color: ColorRes.color_49A510),
                ),
              ),
            ],
          ),
          Text(
            "\$200",
            style: gilroySemiBoldTextStyle(
              fontSize: 14,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            Strings.sampleDescriptions,
            style: gilroyRegularTextStyle(fontSize: 14),
          ),
          Text(
            createAdvertisementController.descriptoionController.text,
            style: gilroyMediumTextStyle(
              fontSize: 14,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                "Tags",
                style: gilroySemiBoldTextStyle(
                  fontSize: 14,
                ),
              ),
              const Spacer(),
              SizedBox(
                width: Get.width * 0.496,
                height: 25,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: createAdvertisementController.tags.length > 3
                      ? 3
                      : createAdvertisementController.tags.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Container(
                      height: 25,
                      width: 80,
                      decoration: const BoxDecoration(
                        color: ColorRes.color_ECEFF0,
                        borderRadius: BorderRadius.all(
                          Radius.circular(4),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          createAdvertisementController.tags[index],
                          style: gilroyMediumTextStyle(
                              fontSize: 12, color: ColorRes.color_696D6D),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Text(
            "Call to Action",
            style: gilroyMediumTextStyle(fontSize: 18),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            createAdvertisementController.callToAction.toString(),
            style: gilroyRegularTextStyle(fontSize: 14),
          ),
          const SizedBox(
            height: 25,
          ),
          Text(
            "URL Link",
            style: gilroyMediumTextStyle(fontSize: 18),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            createAdvertisementController.urlLinkController.text.toString(),
            style: gilroyRegularTextStyle(fontSize: 14),
          ),
          SizedBox(),
          InkWell(onTap: () {

          },
            child: Row(
              children: [
                Image.asset(
                  AssetRes.advertiserViews,
                  height: 22,
                  width: 22,
                ),
                Text(
                  "563 views",
                  style: gilroyRegularTextStyle(fontSize: 14),
                )
              ],
            ),
          )

          /*        const SizedBox(
            height: 87,
          ),*/
          /*     SubmitButton(
            onTap: () {
              // Get.to(() => SetupDateScreen());
            },
            child: Text(
              "Next",
              style: gilroyBoldTextStyle(fontSize: 16, color: ColorRes.black),
            ),
          ),*/
          /*   const SizedBox(
            height: 42.01,
          ),*/
        ],
      ),
    );
  }

// f
  Widget top() {
    CreateAdvertisementController createAdvertisementController =
        Get.put(CreateAdvertisementController());
    return Column(
      children: [
        Container(
          width: Get.width,
          height: 202,
          decoration: BoxDecoration(
            image: createAdvertisementController.imagePath == null
                ? const DecorationImage(
                    image: AssetImage(
                      AssetRes.adsdetail,
                    ),
                    fit: BoxFit.fill)
                : DecorationImage(
                    image: FileImage(
                      File(createAdvertisementController.imagePath!.path),
                    ),
                    fit: BoxFit.fill),
          ),
          child: Column(
            children: [
              const SizedBox(height: 46),
              Padding(
                padding: EdgeInsets.only(
                    left: Get.width * 0.0853, right: Get.width * 0.0373),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        height: 32,
                        width: 34,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                            color: ColorRes.white),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 12),
                          child: Image.asset(
                            AssetRes.backIcon,
                            color: ColorRes.color_50369C,
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      height: 33.3,
                      width: 33.3,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: ColorRes.white),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Image.asset(
                          AssetRes.share,
                          color: ColorRes.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 33.3,
                      width: 33.3,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: ColorRes.white),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Image.asset(
                          AssetRes.editicons,
                          color: ColorRes.black,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
