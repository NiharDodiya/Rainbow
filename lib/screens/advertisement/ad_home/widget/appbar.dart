import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/screens/advertisement/ad_home/ad_home_controller.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/color_res.dart';

Widget appbar(contaxt,Key) {
  AdHomeController controller = Get.find<AdHomeController>();
  return SizedBox(
    width: Get.width,
    child: Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 15, bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          InkWell(
            onTap: () =>
            // Scaffold.of(contaxt).openDrawer(),
             Key.currentState!.openDrawer(),
            child: Container(
              height: 34,
              width: 34,
              margin: const EdgeInsets.only(right: 9),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(
                    AssetRes.advertiserImage,
                  ),
                ),
              ),
            ),
          ),
          Image.asset(
            AssetRes.handIcon,
            height: 34,
            width: 34,
          ),
          const SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Good Morning,",
                overflow: TextOverflow.clip,
                maxLines: 2,
                style: gilroySemiBoldTextStyle(fontSize: 12),
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                "Hello Raymond",
                style: gilroyBoldTextStyle(fontSize: 20),
              ),
            ],
          ),
          const Spacer(),
          InkWell(
            onTap: () => controller.onTapAddList(),
            child: Container(
              height: 31,
              width: 31,
              margin: const EdgeInsets.only(bottom: 12),
              decoration: const BoxDecoration(
                color: ColorRes.color_9297FF,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.add, size: 15, color: ColorRes.white),
            ),
          )
        ],
      ),
    ),
  );
}
