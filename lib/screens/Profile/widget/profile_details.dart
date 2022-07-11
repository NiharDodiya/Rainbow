import 'package:flutter/material.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/screens/Profile/profile_controller.dart';
import 'package:rainbow/utils/asset_res.dart';

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
          mediaIcon(AssetRes.instagram),
          mediaIcon(AssetRes.youtube),
          mediaIcon(AssetRes.facebook1),
          mediaIcon(AssetRes.twitter),
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
