import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rainbow/common/Widget/loaders.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/screens/Home/settings/settings_controller.dart';
import 'package:rainbow/screens/Home/settings/support/support_controller.dart';
import 'package:rainbow/screens/Profile/profile_controller.dart';
import 'package:rainbow/screens/advertisement/ad_support/screen/support_create/support_create_screen.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/color_res.dart';
import 'package:rainbow/utils/strings.dart';

class SupportScreen extends StatelessWidget {
  SupportScreen({Key? key}) : super(key: key);
  SupportController controller = Get.put(SupportController());
  ProfileController profileController = Get.put(ProfileController());


  @override
  Widget build(BuildContext context) {
    controller.getListOfUserTicket();
    return Scaffold(
      body: GetBuilder<SupportController>(
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
                  Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                        children: [
                          SizedBox(
                            height: Get.height * 0.035,
                          ),
                          appBar(),
                        ],
                      ),),
                      Expanded(
                        flex: 6,
                        child: SingleChildScrollView(
                        child: Column(
                          children: [
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
                      ),),
                    ],
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
          SizedBox(
            height: Get.height * 0.03,
          ),
          Row(
            children: [
              SizedBox(
                width: Get.width * 0.05,
              ),
              Padding(padding: EdgeInsets.only(left: Get.width * 0.05),
                child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: SizedBox(height: 15,width: 9,
                    child: Image.asset(
                      AssetRes.backIcon,
                      height: 16,
                      width: 35,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: Get.width * 0.32,
              ),
              Text(
                Strings.support,
                style: gilroyBoldTextStyle(),
              ),
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

  Widget supports() {
    return GetBuilder<SupportController>(
      id: "Support",
      builder: (controller) {
        return Column(
          children: [
            ListView.builder(
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
                                child: profileController.viewProfile.data!.profileImage!.isEmpty?ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Container(
                                    height: 46,
                                    width: 46,
                                    decoration:  const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                            AssetRes.portrait_placeholder,
                                          ),fit: BoxFit.cover
                                      ),
                                    ),
                                  ),
                                ):ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Container(
                                    height: 46,
                                    width: 46,
                                    decoration:  BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                            profileController.viewProfile.data!.profileImage.toString(),
                                          ),fit: BoxFit.cover
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 15, top: 18),
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
                                    const SizedBox(height: 5,),
                                    Text(
                                      controller.listSupportTicketModel
                                          .data![index].tickit
                                          .toString(),
                                      style: gilroyMediumTextStyle(
                                          color: ColorRes.color_6306B2,
                                          fontSize: 16),
                                    ),
                                    const SizedBox(height: 5,),
                                    SizedBox(width: 150,
                                      child: Text(
                                        controller.listSupportTicketModel
                                            .data![index].title
                                            .toString(),
                                        style: gilroyMediumTextStyle(
                                            color: Colors.black,
                                            fontSize: 13.11),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 55),
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
