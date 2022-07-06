import 'package:flutter/material.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/utils/asset_res.dart';

Widget profileDetails() {
  return Column(
    children: [
      Text(
        "Natalie Nara ",
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
            "24 Yrs old",
            style: gilroyRegularTextStyle(fontSize: 14),
          ),
          dot(),
          Text(
            "London",
            style: gilroyRegularTextStyle(fontSize: 14),
          ),
          dot(),
          Text(
            "5'8",
            style: gilroyRegularTextStyle(fontSize: 14),
          ),
          dot(),
          Text(
            "160 lbs",
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
