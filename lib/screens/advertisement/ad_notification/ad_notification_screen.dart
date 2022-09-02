import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/screens/advertisement/ad_home/ad_home_controller.dart';
import 'package:rainbow/utils/color_res.dart';

import '../../../common/Widget/text_styles.dart';
import '../../../utils/asset_res.dart';

class AdNotificationsScreen extends StatelessWidget {
  AdNotificationsScreen({Key? key}) : super(key: key);
  AdHomeController controller = Get.find<AdHomeController>();

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
                                  (controller.viewAdvertiserModel.data!
                                          .profileImage
                                          .toString()
                                          .isEmpty)
                                      ? Container(
                                          height: 50,
                                          width: 50,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                              image: AssetImage(
                                                AssetRes.portrait_placeholder,
                                              ),
                                            ),
                                          ))
                                      : Container(
                                          height: 50,
                                          width: 50,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                image: NetworkImage(controller
                                                    .viewAdvertiserModel
                                                    .data!
                                                    .profileImage
                                                    .toString()),
                                                fit: BoxFit.cover,
                                              )),
                                        ),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  Expanded(
                                    child: Column(
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
                                        Text(
                                          "Advertisement is now approved by admin",
                                          style: gilroyMediumTextStyle(
                                              fontSize: 14,
                                              letterSpacing: -0.03),
                                        ),
                                      ],
                                    ),
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
              /*GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Image.asset(
                  AssetRes.backIcon,
                  height: 16,
                  width: 16,
                  color: Colors.white,
                ),
              ),*/
              SizedBox(
                width: Get.width * 0.32,
              ),
              Text(
                "Notification",
                style: gilroyBoldTextStyle(),
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
