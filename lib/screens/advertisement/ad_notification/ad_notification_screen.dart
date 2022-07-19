import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/utils/color_res.dart';

import '../../../common/Widget/text_styles.dart';
import '../../../utils/asset_res.dart';

class AdNotificationsScreen extends StatelessWidget {
  const AdNotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
              SizedBox(
                height: Get.height * 0.035,
              ),
              appBar(),
              Expanded(
                child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          SizedBox(
                            height: 100,
                            width: Get.width,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: Get.width * 0.05,
                                  right: Get.width * 0.16),
                              child: Row(
                                children: [
                                  Container(
                                    height: 54,
                                    width: 54,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: ColorRes.white, width: 1),
                                      gradient: const LinearGradient(
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
                                        height: 42.69,
                                        width: 25.83,
                                        decoration: const BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                              AssetRes.greenDuck,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 35,
                                      ),
                                      Text(
                                        "2/09/2021",
                                        style: gilroySemiBoldTextStyle(
                                            fontSize: 12),
                                      ),
                                      SizedBox(
                                        child: Expanded(
                                          child: Text(
                                            "Advertisement is now approved \nby admin",
                                            style: gilroyMediumTextStyle(
                                                fontSize: 14,
                                                letterSpacing: -0.03),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Divider(
                            height: 1,
                            color: ColorRes.white.withOpacity(0.5),
                          )
                        ],
                      );
                    }),
              ),
              const SizedBox(
                height: 60,
              )
            ],
          ),
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
                width: Get.width * 0.32,
              ),
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Text(
                  "Notification",
                  style: gilroyBoldTextStyle(),
                ),
              ),
              SizedBox(
                width: Get.width * 0.05,
              ),
            ],
          ),
          const SizedBox(
            height: 2,
          ),
        ],
      ),
    );
  }
}
