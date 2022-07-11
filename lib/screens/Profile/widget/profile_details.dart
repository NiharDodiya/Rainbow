import 'package:flutter/material.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/screens/Profile/profile_controller.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:url_launcher/url_launcher.dart';

Widget profileDetails(ProfileController controller) {
  return Column(
    children: [
      Text(
        controller.viewProfile.data==null?"":controller.viewProfile.data!.fullName.toString(),
        style: gilroySemiBoldTextStyle(fontSize: 24),
      ),
      Text(
        "Surrogate Mom ",
        style: gilroyRegularTextStyle(fontSize: 14),
      ),
      const SizedBox(height: 6,),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            controller.viewProfile.data==null?"":controller.viewProfile.data!.age.toString(),
            style: gilroyRegularTextStyle(fontSize: 14),
          ),
          dot(),
          Text(
            controller.viewProfile.data==null?"":controller.viewProfile.data!.city.toString(),
            style: gilroyRegularTextStyle(fontSize: 14),
          ),
          dot(),
          Text(
            controller.viewProfile.data==null?"":controller.viewProfile.data!.height.toString(),
            style: gilroyRegularTextStyle(fontSize: 14),
          ),
          dot(),
          Text(
            controller.viewProfile.data==null?"":controller.viewProfile.data!.weight.toString(),
            style: gilroyRegularTextStyle(fontSize: 14),
          ),
        ],
      ),
      const SizedBox(height: 15,),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "British",
            style: gilroyRegularTextStyle(fontSize: 14),
          ),
          dot(),
          Text(
            "Single",
            style: gilroyRegularTextStyle(fontSize: 14),
          ),
          dot(),
          Text(
            "No Kids",
            style: gilroyRegularTextStyle(fontSize: 14),
          ),
        ],
      ),
      const SizedBox(height: 15,),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          InkWell(onTap: () async{
            await launchUrl(Uri.parse(controller.viewProfile.data!.instagram.toString()));
            print("insta");
          },
              child: mediaIcon(AssetRes.instagram)),
          InkWell(onTap: () async{
            await launchUrl(Uri.parse(controller.viewProfile.data!.youtube.toString()));
            print("youtube");
          },
              child: mediaIcon(AssetRes.youtube)),
          InkWell(onTap: () async {
            await launchUrl(Uri.parse(controller.viewProfile.data!.facebook.toString()));

            print("facebook");
          },
              child: mediaIcon(AssetRes.facebook1)),
          InkWell(onTap: () async {
            await launchUrl(Uri.parse(controller.viewProfile.data!.twitter.toString()));

            print("twitter");
          },
              child: mediaIcon(AssetRes.twitter)),
        ],
      ),
    ],
  );
}

Widget dot() {
  return Container(
    height: 4,
    width: 4,
    margin: const EdgeInsets.only(
      left: 8,
      right: 8,
      bottom: 3
    ),
    child: Image.asset(
      AssetRes.yellowDot,
      height: 4,
      width: 4,
    ),
  );
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
