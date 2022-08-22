import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/buttons.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/screens/advertisement/ad_support/screen/support_create/support_create_screen.dart';
import 'package:rainbow/screens/advertisement/ad_support/screen/support_details/support_details_screen.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/color_res.dart';
import 'package:rainbow/utils/strings.dart';

import 'ad_support_controller.dart';

class AdSupportScreen extends StatelessWidget {
  AdSupportScreen({Key? key}) : super(key: key);
  AdSupportController controller = Get.put(AdSupportController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            ColorRes.color_50369C,
            ColorRes.color_50369C,
            ColorRes.color_D18EEE,
            ColorRes.color_D18EEE,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: Get.height * 0.035),
          appBar(),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  supports(),
                  SizedBox(
                    height: Get.height * 0.07,
                  ),
                  SubmitButton(
                    onTap: () {
                      Get.to(() =>  SupportcreateScreen());
                    },
                    child: Text(
                      Strings.sendNewMessage,
                      style: gilroyBoldTextStyle(
                          color: Colors.black, fontSize: 16),
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.1,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget appBar() {
    return SizedBox(
      width: Get.width,
      child: Column(
        children: [
          SizedBox(height: Get.height * 0.03),
          Row(
            children: [
              SizedBox(width: Get.width * 0.05),
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
              SizedBox(width: Get.width * 0.32),
              GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Text(
                    Strings.support,
                    style: gilroyBoldTextStyle(),
                  )),
              SizedBox(width: Get.width * 0.05),
            ],
          ),
          SizedBox(height: Get.height * 0.04),
        ],
      ),
    );
  }

  Widget supports() {
    return Column(
      children: [
        ListView.builder(
          padding: const EdgeInsets.only(top: 10),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: controller.supportList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 10),
              child: Column(
                children: [
                  Container(
                    height: 104,
                    width: Get.width * 0.8933,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white),
                    child: InkWell(
                      onTap: () {
                        Get.to(SupportDetailsScreen(
                          com: controller.supportList[index],
                        ));
                      },
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: Get.width * 0.21,
                                ),
                                Text(
                                  Strings.datesuppo,
                                  style: gilroyMediumTextStyle(
                                      color: ColorRes.color_9597A1,
                                      fontSize: 16),
                                ),
                                const Spacer(),
                                Text(
                                  controller.supportList[index],
                                  style: controller.supportList[index]
                                              .toString() ==
                                          Strings.pending
                                      ? gilroyMediumTextStyle(
                                          color: ColorRes.color_FFA800,
                                          fontSize: 16)
                                      : gilroyMediumTextStyle(
                                          color:
                                              Color.fromARGB(255, 89, 146, 54),
                                          fontSize: 16),
                                ),
                                const SizedBox(width: 15)
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Container(
                                  height: 46,
                                  width: 46,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: LinearGradient(
                                      colors: [
                                        ColorRes.color_50369C,
                                        ColorRes.color_D18EEE,
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    ),
                                  ),
                                  child: Center(
                                    child: Container(
                                      height: 36.37,
                                      width: 22,
                                      decoration: const BoxDecoration(
                                          image: DecorationImage(
                                        image: AssetImage(AssetRes.duck),
                                      )),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 15,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      Strings.seriz,
                                      style: gilroyMediumTextStyle(
                                          color: ColorRes.color_6306B2,
                                          fontSize: 16),
                                    ),
                                    Text(
                                      Strings.loremIpsum,
                                      style: gilroyMediumTextStyle(
                                          color: Colors.black, fontSize: 13.11),
                                    ),
                                  ],
                                ),
                              ),
                              // const Spacer(),
                              Column(
                                children: [
                                  SizedBox(
                                    height: Get.height * 0.01,
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: Get.width * 0.03,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        )
      ],
    );
  }
}
