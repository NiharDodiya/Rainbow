import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/screens/Profile/profile_controller.dart';
import 'package:rainbow/utils/asset_res.dart';

Widget otherVisitorsViewed() {
  ProfileController controller = Get.find<ProfileController>();
  return Padding(
    padding: const EdgeInsets.only(left: 30, right: 30),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 30,
        ),
        Text(
          "Other Visitors Viewed",
          style: beVietnamProBoldTextStyle(fontSize: 18),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 130,
          child: ListView.builder(
            itemCount: 6,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return visitors(title: controller.imageName[index],image: controller.image[index]);
            },
          ),
        )
      ],
    ),
  );
}

Widget visitors({String? image, String? title}) {
  return Column(
    children: [
      Container(
        height: 60,
        width: 60,
        margin: const EdgeInsets.only(right: 10, left: 10, top: 10, bottom: 7),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage(
              image ?? AssetRes.selfiePicture,
            ),
          ),
        ),
      ),
      SizedBox(
        width: 60,
        child: Text(
          title ?? "Amber Davis",
          maxLines: 2,
          style: gilroyRegularTextStyle(fontSize: 16),
        ),
      )
    ],
  );
}
