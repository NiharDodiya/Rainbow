import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/screens/advertisement/ad_support/screen/support_create/support_create_screen.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/color_res.dart';
import 'package:rainbow/utils/strings.dart';
import '../../../common/Widget/loaders.dart';
import '../ad_dashboard/ad_dashboard.dart';
import 'ad_support_controller.dart';

class AdSupportScreen extends StatelessWidget {
  AdSupportScreen({Key? key}) : super(key: key);
  AdSupportController controller = Get.put(AdSupportController());

  @override
  Widget build(BuildContext context) {
    controller.getListOfUserTicket();
    return Scaffold(
      body: GetBuilder<AdSupportController>(
        id: "Support",
        builder: (controller) {
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
            child: Obx(() {
              return Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: Get.height * 0.035,
                        ),
                        appBar(),
                        supports(),
                        SizedBox(
                          height: Get.height * 0.07,
                        ),
                        sendNewMessage(),
                        SizedBox(
                          height: Get.height * 0.05,
                        ),
                      ],
                    ),
                  ),
                  controller.loader.isTrue
                      ? const FullScreenLoader()
                      : const SizedBox()
                ],
              );
            }),
          );
        },
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
                onTap: (){
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
              Text(
                Strings.support,
                style: gilroyBoldTextStyle(),
              ),
              SizedBox(width: Get.width * 0.05),
            ],
          ),
          SizedBox(height: Get.height * 0.04),
        ],
      ),
    );
  }

  Widget supports() {
    return GetBuilder<AdSupportController>(
      id: "Support",
      builder: (controller) {
        return Column(
          children: [
            controller.listSupportTicketModel.data == null
                ? SizedBox(
              height: Get.height * 0.66,
              child: Center(
                  child: Text(
                    "Send New SupportMessage",
                    style: gilroyMediumTextStyle(fontSize: 20),
                  )),
            )
                : ListView.builder(
              padding: const EdgeInsets.only(top: 10),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.listSupportTicketModel.data == null
                  ? 0
                  : controller.listSupportTicketModel.data!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 10),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          controller.onTap(
                              id: controller
                                  .listSupportTicketModel.data![index].id
                                  .toString(),
                              status: controller.listSupportTicketModel
                                  .data![index].status
                                  .toString(),
                              code: controller.listSupportTicketModel
                                  .data![index].tickit
                                  .toString());
                        },
                        child: Container(
                          height: 104,
                          width: Get.width * 0.8933,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white),
                          child: Row(
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
                                    left: 15, top: 10),
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      DateFormat("dd/MM/yyyy").format(
                                          controller
                                              .listSupportTicketModel
                                              .data![index]
                                              .createdAt!),
                                      style: gilroyMediumTextStyle(
                                          color: ColorRes.color_9597A1,
                                          fontSize: 16),
                                    ),
                                    Text(
                                      controller.listSupportTicketModel
                                          .data![index].tickit
                                          .toString(),
                                      style: gilroyMediumTextStyle(
                                          color: ColorRes.color_6306B2,
                                          fontSize: 16),
                                    ),
                                    Text(
                                      controller.listSupportTicketModel
                                          .data![index].title
                                          .toString(),
                                      style: gilroyMediumTextStyle(
                                          color: Colors.black,
                                          fontSize: 13.11),
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              Padding(
                                padding: EdgeInsets.only(
                                    bottom: Get.height * 0.1),
                                child: Text(
                                  controller.listSupportTicketModel
                                      .data![index].status
                                      .toString(),
                                  style: controller.listSupportTicketModel
                                      .data![index].status
                                      .toString() ==
                                      "pending"
                                      ? gilroyMediumTextStyle(
                                      color: ColorRes.color_FFA800,
                                      fontSize: 16)
                                      : gilroyMediumTextStyle(
                                      color: ColorRes.color_49A510,
                                      fontSize: 16),
                                ),
                              ),
                              const SizedBox(
                                width: 18,
                              )
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
      },
    );
  }

  Widget sendNewMessage() {
    return InkWell(
      onTap: () {
        Get.to(() => SupportcreateScreen());
      },
      child: Container(
        height: 60,
        width: 300,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13.67),
            color: ColorRes.color_FFED62),
        child: Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 18,
                  width: 152,
                  child: Text(
                    Strings.sendNewMessage,
                    style: gilroyBoldTextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
              ],
            )),
      ),
    );
  }

}
