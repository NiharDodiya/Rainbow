import 'package:flutter/material.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/color_res.dart';

Widget connectAndBlock({
  String? title,
  String? subTitle,
}) {
  return Column(
    children: [
      Text(
        title??"Amber J Santiago",
        style: gilroySemiBoldTextStyle(fontSize: 24),
      ),
      Text(
        subTitle??"Surrogate Mom ",
        style: gilroyRegularTextStyle(fontSize: 14),
      ),
      const SizedBox(
        height: 6,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 22,
            width: 22,
            margin: const EdgeInsets.all(9),
            child: Image.asset(
              AssetRes.profilep,
              color: ColorRes.color_FFB2B2,
            ),
          ),
          Text(
            "Connect",
            style: beVietnamSemiBoldTextStyle(fontSize: 12),
          ),
          const SizedBox(
            width: 8,
          ),
          Container(
            height: 22,
            width: 22,
            margin: const EdgeInsets.all(9),
            child: Image.asset(
              AssetRes.block,
              color: ColorRes.color_F82222.withOpacity(0.7),
            ),
          ),
          Text(
            "Block",
            style: beVietnamSemiBoldTextStyle(fontSize: 12),
          ),
        ],
      ),
    ],
  );
}
