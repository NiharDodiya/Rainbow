// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/screens/Home/settings/privacy/privacy_controller.dart';

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
              bottom: -85,
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
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Column(
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
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: Get.width * 0.05),
                              child: GetBuilder<PrivacyController>(
                                id: "check",
                                builder: (controller) => ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: controller.tital.length,
                                  itemBuilder: (context, index) => Expanded(
                                    child: PrivacyCheck(
                                        onchange: (val) {
                                          controller.onchange(
                                              controller.tital[index]);
                                        },
                                        // => controller
                                        //     .onchange("displayPhoto"),
                                        tital: controller.tital[index],
                                        value: controller.values[index]),
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
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

class PrivacyCheck extends StatelessWidget {
  final String tital;
  bool? value;
  Function(bool) onchange;
  PrivacyCheck({
    super.key,
    required this.tital,
    this.value,
    required this.onchange,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // SizedBox(
        //   width: Get.width * 0.05,
        // ),
        Checkbox(
          value: value,
          onChanged: (val) {
            onchange(val!);
            //  controller.onchange(value);
          },
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        Text(
          tital,
          style: gilroyMediumTextStyle(),
        )
      ],
    );
  }
}
