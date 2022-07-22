import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rainbow/common/Widget/loaders.dart';
import 'package:rainbow/model/notification_model.dart';
import 'package:rainbow/screens/notification/notification_controller.dart';
import 'package:rainbow/utils/color_res.dart';

import '../../../common/Widget/text_styles.dart';
import '../../../utils/asset_res.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({Key? key}) : super(key: key);
  final NotificationsController controller = Get.put(NotificationsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
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
                    itemCount: controller.notificationList.length,
                    itemBuilder: (BuildContext context, int index) {
                      NotificationData model =
                          controller.notificationList[index];
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
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 35,
                                        ),
                                        Text(
                                          model.createdAt == null
                                              ? ''
                                              : DateFormat('dd/MM/yyyy')
                                                  .format(model.createdAt!),
                                          style: gilroySemiBoldTextStyle(
                                              fontSize: 12),
                                        ),
                                        Text(
                                          model.title.toString(),
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
                          const SizedBox(height: 10),
                          Divider(
                            height: 1,
                            color: ColorRes.white.withOpacity(0.5),
                          )
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Obx(() {
            if (controller.loader.isTrue) {
              return const SmallLoader();
            } else {
              return const SizedBox();
            }
          }),
        ],
      ),
    );
  }

  Widget appBar() {
    return SizedBox(
      width: Get.width,
      child: Column(
        children: [
          SizedBox(height: Get.height * 0.02),
          Stack(
            children: [
              Center(
                child: Text(
                  "Notification",
                  style: gilroyBoldTextStyle(),
                ),
              ),
              Positioned(
                left: Get.height * 0.03,
                child: GestureDetector(
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
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
