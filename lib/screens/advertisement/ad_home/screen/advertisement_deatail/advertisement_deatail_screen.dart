import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/buttons.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/screens/advertisement/ad_home/screen/edit_advertisement/edit_advertisement_screen.dart';
import 'package:rainbow/screens/advertisement/ad_home/screen/setup_date/setup_date_screen.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/color_res.dart';
import 'package:rainbow/utils/strings.dart';

import '../create_advertisement/create_advertisement_controller.dart';

class AdvertisementDeatailScreen extends StatelessWidget {
  AdvertisementDeatailScreen({Key? key}) : super(key: key);
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
                Strings.surrogateMom,
                style: gilroySemiBoldTextStyle(fontSize: 18),
              ),
              const Spacer(),
              Text(
                Strings.summary,
                style: gilroySemiBoldTextStyle(
                    fontSize: 18, color: ColorRes.color_EED82F),
              ),
            ],
          ),
          Text(
            Strings.doller200,
            style: gilroySemiBoldTextStyle(
              fontSize: 14,
            ),
          ),
          Text(
            createAdvertisementController.descriptoionController.text,
            style: gilroyMediumTextStyle(
              fontSize: 14,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Row(
            children: [
              Text(
                Strings.tags,
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
            Strings.callToAction,
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
            Strings.urlLink,
            style: gilroyMediumTextStyle(fontSize: 18),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            createAdvertisementController.urlLinkController.text.toString(),
            style: gilroyRegularTextStyle(fontSize: 14),
          ),
          const SizedBox(
            height: 87,
          ),
          SubmitButton(
            onTap: () {
              Get.to(() => SetupDateScreen());
            },
            child: Text(
              Strings.next,
              style: gilroyBoldTextStyle(fontSize: 16, color: ColorRes.black),
            ),
          ),
          const SizedBox(
            height: 42.01,
          ),
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
            // borderRadius: const BorderRadius.only(
            //   topLeft: Radius.circular(30),
            //   topRight: Radius.circular(30),
            // ),
            image: createAdvertisementController.imagePath == null
                ? const DecorationImage(
                    image: AssetImage(
                      AssetRes.adsDetail,
                    ),
                    fit: BoxFit.cover)
                : DecorationImage(
                    image: FileImage(
                      File(createAdvertisementController.imagePath!.path),
                    ),
                    fit: BoxFit.cover),
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
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const EditAdvertisementscreen());
                      },
                      child: Container(
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
