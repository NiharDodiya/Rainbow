import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/screens/Profile/profile_controller.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:url_launcher/url_launcher.dart';

Widget profileDetails() {
  ProfileController controller = Get.put(ProfileController());
  return Column(
    children: [
      Text(
        controller.viewProfile.data == null
            ? ""
            : controller.viewProfile.data!.fullName.toString(),
        style: gilroySemiBoldTextStyle(fontSize: 24),
      ),
      Text(
        "Surrogate Mom ",
        style: gilroyRegularTextStyle(fontSize: 14),
      ),
      const SizedBox(
        height: 6,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            controller.viewProfile.data!.age == null
                ? ""
                : controller.viewProfile.data!.age.toString(),
            style: gilroyRegularTextStyle(fontSize: 14),
          ),
          dot(controller,controller.viewProfile.data!.age.toString()),
          Text(
            controller.viewProfile.data!.city == null
                ? ""
                : controller.viewProfile.data!.city.toString(),
            style: gilroyRegularTextStyle(fontSize: 14),
          ),
          dot(controller,controller.viewProfile.data!.city.toString()),
          Text(
            controller.viewProfile.data!.height == null
                ? ""
                : controller.viewProfile.data!.height.toString(),
            style: gilroyRegularTextStyle(fontSize: 14),
          ),
          dot(controller,controller.viewProfile.data!.height.toString()),
          Text(
            controller.viewProfile.data!.weight == null
                ? ""
                : controller.viewProfile.data!.weight.toString(),
            style: gilroyRegularTextStyle(fontSize: 14),
          ),
        ],
      ),
      const SizedBox(
        height: 15,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            controller.viewProfile.data!.idEthnicity == null
                ? ""
                : controller.viewProfile.data!.idEthnicity.toString(),
            style: gilroyRegularTextStyle(fontSize: 14),
          ),
          dot(controller, controller.viewProfile.data!.idEthnicity.toString()),
          Text(
            controller.viewProfile.data!.maritalStatus == null
                ? ""
                : controller.viewProfile.data!.maritalStatus.toString(),
            style: gilroyRegularTextStyle(fontSize: 14),
          ),
          dot(controller, controller.viewProfile.data!.maritalStatus.toString()),
          Text(
            controller.viewProfile.data!.noKids == null
                ? ""
                : controller.viewProfile.data!.noKids.toString(),
            style: gilroyRegularTextStyle(fontSize: 14),
          ),
        ],
      ),
      const SizedBox(
        height: 15,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          InkWell(
              onTap: () async {
                await launchUrl(Uri.parse(
                    controller.viewProfile.data!.instagram.toString()));
                print("insta");
              },
              child: mediaIcon(AssetRes.instagram)),
          InkWell(
              onTap: () async {
                await launchUrl(
                    Uri.parse(controller.viewProfile.data!.youtube.toString()));
                print("youtube");
              },
              child: mediaIcon(AssetRes.youtube)),
          InkWell(
              onTap: () async {
                await launchUrl(Uri.parse(
                    controller.viewProfile.data!.facebook.toString()));

                print("facebook");
              },
              child: mediaIcon(AssetRes.facebook1)),
          InkWell(
              onTap: () async {
                await launchUrl(
                    Uri.parse(controller.viewProfile.data!.twitter.toString()));

                print("twitter");
              },
              child: mediaIcon(AssetRes.twitter)),
        ],
      ),
    ],
  );
}

Widget dot(ProfileController controller,String? data) {
  return  data!= null?Container(
    height: 4,
    width: 4,
    margin: const EdgeInsets.only(left: 8, right: 8, bottom: 3),
    child: Image.asset(
      AssetRes.yellowDot,
      height: 4,
      width: 4,
    ),
  ):SizedBox();
}

Widget mediaIcon(String image) {
  return Container(
    height: 24,
    width: 24,
    margin: const EdgeInsets.only(
      left: 5,
      right: 5,
    ),
    child: Image.asset(
      image,
      height: 24,
      width: 24,
    ),
  );
}
