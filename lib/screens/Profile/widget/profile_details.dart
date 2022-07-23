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
        controller.viewProfile.data!.userStatus!.isEmpty
            ? ""
            : controller.viewProfile.data!.userStatus.toString(),
        style: gilroyRegularTextStyle(fontSize: 14),
      ),
      const SizedBox(
        height: 6,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          controller.viewProfile.data!.age == 0
              ? const Text("")
              : Text(
                  controller.viewProfile.data!.age.toString(),
                  style: gilroyRegularTextStyle(fontSize: 14),
                ),
          controller.viewProfile.data!.age.toString() != "0"
              ? Container(
                  height: 4,
                  width: 4,
                  margin: const EdgeInsets.only(left: 8, right: 8, bottom: 3),
                  child: Image.asset(
                    AssetRes.yellowDot,
                    height: 4,
                    width: 4,
                  ),
                )
              : const SizedBox(),
          // dot(controller,controller.viewProfile.data!.age.toString()),
          Text(
            controller.viewProfile.data!.city == ""
                ? ""
                : controller.viewProfile.data!.city.toString(),
            style: gilroyRegularTextStyle(fontSize: 14),
          ),
          controller.viewProfile.data!.city.toString() != ""
              ? Container(
                  height: 4,
                  width: 4,
                  margin: const EdgeInsets.only(left: 8, right: 8, bottom: 3),
                  child: Image.asset(
                    AssetRes.yellowDot,
                    height: 4,
                    width: 4,
                  ),
                )
              : const SizedBox(),
          // dot(controller,controller.viewProfile.data!.city.toString()),
          Text(
            controller.viewProfile.data!.height == ""
                ? ""
                : controller.viewProfile.data!.height.toString(),
            style: gilroyRegularTextStyle(fontSize: 14),
          ),
          controller.viewProfile.data!.height.toString() != ""
              ? Container(
                  height: 4,
                  width: 4,
                  margin: const EdgeInsets.only(left: 8, right: 8, bottom: 3),
                  child: Image.asset(
                    AssetRes.yellowDot,
                    height: 4,
                    width: 4,
                  ),
                )
              : const SizedBox(),
          // dot(controller,controller.viewProfile.data!.height.toString()),
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
          dot(controller,
              controller.viewProfile.data!.maritalStatus.toString()),
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
              await launchUrl(
                  Uri.parse(controller.viewProfile.data!.instagram.toString()));
              print("insta");
            },
            child: controller.viewProfile.data!.instagram.toString().isEmpty
                ? const SizedBox()
                : Container(
                    height: 24,
                    width: 24,
                    margin: const EdgeInsets.only(
                      left: 5,
                      right: 5,
                    ),
                    child: Image.asset(
                      AssetRes.instagram,
                      height: 24,
                      width: 24,
                    ),
                  ),
          ),
          InkWell(
              onTap: () async {
                await launchUrl(
                    Uri.parse(controller.viewProfile.data!.youtube.toString()));
                print("youtube");
              },
              child: controller.viewProfile.data!.youtube.toString().isEmpty
                  ? const SizedBox()
                  : Container(
                      height: 24,
                      width: 24,
                      margin: const EdgeInsets.only(
                        left: 5,
                        right: 5,
                      ),
                      child: Image.asset(
                        AssetRes.youtube,
                        height: 24,
                        width: 24,
                      ),
                    )
              /* mediaIcon(
                  controller.viewProfile.data!.youtube.toString() == ""
                      ? ""
                      : )*/
              ),
          InkWell(
              onTap: () async {
                await launchUrl(Uri.parse(
                    controller.viewProfile.data!.facebook.toString()));

                print("facebook");
              },
              child: controller.viewProfile.data!.facebook.toString().isEmpty
                  ? const SizedBox()
                  : Container(
                      height: 24,
                      width: 24,
                      margin: const EdgeInsets.only(
                        left: 5,
                        right: 5,
                      ),
                      child: Image.asset(
                        AssetRes.facebook1,
                        height: 24,
                        width: 24,
                      ),
                    ) /*     mediaIcon()*/),
          InkWell(
              onTap: () async {
                await launchUrl(
                    Uri.parse(controller.viewProfile.data!.twitter.toString()));

                print("twitter");
              },
              child: controller.viewProfile.data!.twitter.toString().isEmpty
                  ? const SizedBox()
                  : Container(
                      height: 24,
                      width: 24,
                      margin: const EdgeInsets.only(
                        left: 5,
                        right: 5,
                      ),
                      child: Image.asset(
                        AssetRes.twitter,
                        height: 24,
                        width: 24,
                      ),
                    )
              /* mediaIcon(
                  controller.viewProfile.data!.twitter.toString() == ""
                      ? ""
                      : )*/
              ),
        ],
      ),
    ],
  );
}

Widget dot(ProfileController controller, String? data) {
  return data != null
      ? Container(
          height: 4,
          width: 4,
          margin: const EdgeInsets.only(left: 8, right: 8, bottom: 3),
          child: Image.asset(
            AssetRes.yellowDot,
            height: 4,
            width: 4,
          ),
        )
      : const SizedBox();
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
