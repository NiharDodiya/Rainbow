import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/strings.dart';

Widget editProfilePicture(BuildContext context) {
  return Column(
    children: [
      SizedBox(height: Get.height * 0.038),
      Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              padding: const EdgeInsets.all(7),
              height: 30,
              width: 40,
              child: Image.asset(
                AssetRes.backIcon,
                height: 15,
                width: 9,
              ),
            ),
          ),
          SizedBox(
            width: Get.width * 0.22,
          ),
          Text(
            Strings.editProfile,
            style: gilroyBoldTextStyle(),
          ),
        ],
      ),
    ],
  );
}
