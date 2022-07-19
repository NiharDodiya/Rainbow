import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/screens/Home/view_story/view_story_controller.dart';
import 'package:rainbow/utils/color_res.dart';

import '../../../../common/Widget/text_styles.dart';
import '../../../../utils/asset_res.dart';

class LikesBottomShit extends StatelessWidget {
  LikesBottomShit({Key? key}) : super(key: key);

  final ViewStoryController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      constraints: BoxConstraints(
        maxHeight: Get.height * 0.9,
        minHeight: Get.height * 0.5,
      ),
      decoration: const BoxDecoration(
        color: ColorRes.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: Get.height * 0.02),
          Container(
            height: 2,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              color: ColorRes.lightGrey,
            ),
          ),
          SizedBox(height: Get.height * 0.03),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    AssetRes.p03,
                    height: Get.width * 0.1493,
                    width: Get.width * 0.1493,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Scott McKay",
                      style: sfProTextReguler().copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: ColorRes.black,
                      ),
                    ),
                    Text(
                      "Sperm Donor",
                      style: sfProTextReguler().copyWith(
                        fontWeight: FontWeight.w300,
                        color: ColorRes.black,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Text(
                  "12:30",
                  style: sfProTextReguler().copyWith(
                    color: ColorRes.black,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: Get.height * 0.02463),
          Container(
            height: 2,
            width: Get.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              color: ColorRes.lightGrey,
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              shrinkWrap: true,
              itemCount: 15,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          AssetRes.p03,
                          height: Get.width * 0.11,
                          width: Get.width * 0.11,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Scott McKay",
                            style: sfProTextReguler().copyWith(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: ColorRes.black,
                            ),
                          ),
                          Text(
                            "Sperm Donor",
                            style: sfProTextReguler().copyWith(
                              fontWeight: FontWeight.w300,
                              color: ColorRes.black,
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Icon(Icons.favorite, color: ColorRes.red),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
