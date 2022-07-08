import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/utils/asset_res.dart';

Widget profileImage({String? profileImage, String? bgImage}) {
  return SizedBox(
    height: 292,
    width: Get.width,
    child: Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 25),
          child: Container(
            height: Get.height * 0.2857,
            width: Get.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                image: AssetImage(AssetRes.overlay),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned(
          top: Get.height * 0.11,
          left: Get.width * 0.30,
          child: Container(
            height: Get.height * 0.38666,
            width: Get.width * 0.38666,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(profileImage??AssetRes.se_profile),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        Positioned(
          top: Get.height * 0.35,
          left: Get.width * 0.599,
          child: Container(
            height: 30,
            width: 30,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(AssetRes.checkMark),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
