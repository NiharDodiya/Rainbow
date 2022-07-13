// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/buttons.dart';
import 'package:rainbow/common/Widget/loaders.dart';
import 'package:rainbow/screens/Home/settings/privacy/privacy_controller.dart';
import 'package:rainbow/utils/strings.dart';

import '../../../../common/Widget/text_styles.dart';
import '../../../../utils/asset_res.dart';
import '../../../../utils/color_res.dart';

class PrivacyScreen extends StatelessWidget {
  PrivacyScreen({Key? key}) : super(key: key);
  PrivacyController controller = Get.put(PrivacyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
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
            ),
            Positioned(
              left: -55,
              bottom: -60,
              child: Image.asset(
                AssetRes.privacy,
                height: 450,
                width: 450,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                appBar(),
                const SizedBox(
                  height: 2,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: Get.width * 0.09066,
                            ),
                            Text(
                              "Show to Public",
                              style: gilroyBoldTextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 24.94,
                        ),
                        GetBuilder<PrivacyController>(
                          id: "check",
                          builder: (controller) => ListView.builder(
                            shrinkWrap: true,
                            padding: EdgeInsets.symmetric(
                                horizontal: Get.width * 0.05),
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: controller.privacyList.length,
                            itemBuilder: (context, index) => Row(
                              children: [
                                Checkbox(
                                  activeColor: Colors.green,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  value: controller.isChecked[index],
                                  onChanged: (val) =>
                                      controller.onCheckMarkChange(val, index),
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                ),
                                Text(
                                  controller.privacyList[index],
                                  style: gilroyMediumTextStyle(),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 24.94,
                        ),
                        Center(
                          child: SubmitButton(
                            text: Strings.save,
                            onTap: controller.onSaveTap,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Obx(() {
              if (controller.loader.isTrue) {
                return const FullScreenLoader();
              } else {
                return const SizedBox();
              }
            }),
          ],
        ),
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
