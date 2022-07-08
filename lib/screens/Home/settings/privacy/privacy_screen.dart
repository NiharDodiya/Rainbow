import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/Widget/text_styles.dart';
import '../../../../utils/asset_res.dart';
import '../../../../utils/color_res.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          Container(
            width: Get.width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  ColorRes.color_50369C,
                  ColorRes.color_D18EEE,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              // image: DecorationImage(image: AssetImage(AssetRes.privacy,))
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                appBar(),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: Get.width * 0.09066),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Show to Public",
                                style: gilroyBoldTextStyle(fontSize: 20),
                              ),
                              SizedBox(height: 24.94,)
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
              left: -55,
              bottom: -85,
              child: Image.asset(
                AssetRes.privacy,
                height: 450,
                width: 450,
              ))
        ]),
      ),
    );
  }

  Widget appBar() {
    return SizedBox(
      width: Get.width,
      child: Column(
        children: [
          SizedBox(
            height: Get.height * 0.03,
          ),
          Row(
            children: [
              SizedBox(
                width: Get.width * 0.05,
              ),
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Image.asset(
                  AssetRes.backIcon,
                  height: 16,
                  width: 16,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: Get.width * 0.34,
              ),
              GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Text(
                    "Privacy",
                    style: gilroyBoldTextStyle(fontSize: 18),
                  )),
              SizedBox(
                width: Get.width * 0.05,
              ),
            ],
          ),
          SizedBox(
            height: Get.height * 0.04,
          ),
        ],
      ),
    );
  }
}
