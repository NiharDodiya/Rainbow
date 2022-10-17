import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/common/popup.dart';
import 'package:rainbow/screens/Profile/profile_controller.dart';
import 'package:rainbow/screens/advertisement/ad_support/screen/support_create/support_create_screen.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/color_res.dart';
import 'package:rainbow/utils/strings.dart';

import '../../../common/Widget/loaders.dart';
import '../ad_home/ad_home_controller.dart';
import 'ad_support_controller.dart';

class AdSupportScreen extends StatelessWidget {
  AdSupportScreen({Key? key}) : super(key: key);
  final AdSupportController controller = Get.put(AdSupportController());
  final ProfileController profileController = Get.put(ProfileController());

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
                  ColorRes.colorD18EEE,
                  ColorRes.colorD18EEE,
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
                      Column(
                        children: [
                          SizedBox(
                            height: Get.height * 0.035,
                          ),
                          appBar(),
                        ],
                      ),
                      Expanded(
                          child: SingleChildScrollView(
                        child: Column(
                          children: [
                            supports(),
                            SizedBox(
                              height: Get.height * 0.07,
                            ),
                          ],
                        ),
                      )),
                      const SizedBox(
                        height: 10,
                      ),
                      sendNewMessage(),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
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
          SizedBox(height: Get.height * 0.03),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /*SizedBox(width: Get.width * 0.05),
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
              SizedBox(width: Get.width * 0.32),*/
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
            SingleChildScrollView(
              child: ListView.builder(
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
                        GetBuilder<AdHomeController>(
                          id: "network",
                            builder: (adHomeController){
                            adHomeController.checkUserConnection();
                              return InkWell(
                          onTap: adHomeController.activeConnection == false?(){
                            errorToast("No internet connection");
                          }:() {
                            controller.onTap(
                                id: controller
                                    .listSupportTicketModel.data![index].id
                                    .toString(),
                                status: controller
                                    .listSupportTicketModel.data![index].status
                                    .toString(),
                                code: controller
                                    .listSupportTicketModel.data![index].tickit
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
                                const SizedBox(width: 10),
                                (adHomeController
                                    .viewAdvertiserModel.data!.profileImage
                                    .toString()
                                    .isEmpty)
                                    ? Container(
                                    height: 50,
                                    width: 50,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: AssetImage(
                                            AssetRes.portraitPlaceholder,
                                          ),
                                          fit: BoxFit.cover),
                                    ))
                                    : ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Container(
                                    height: 50,
                                    width: 50,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: CachedNetworkImage(
                                      imageUrl: adHomeController
                                          .viewAdvertiserModel
                                          .data!
                                          .profileImage
                                          .toString(),
                                      fit: BoxFit.cover,
                                      placeholder: ((context, url) =>
                                          Image.asset(
                                            AssetRes.portraitPlaceholder,
                                            height: 50,
                                            width: 50,
                                            fit: BoxFit.cover,
                                          )),
                                      errorWidget: ((context, url,
                                          error) =>
                                          Image.asset(
                                            AssetRes.portraitPlaceholder,
                                            height: 50,
                                            width: 50,
                                            fit: BoxFit.cover,
                                          )),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsets.only(left: 15, top: 25),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        DateFormat("dd/MM/yyyy").format(
                                            controller.listSupportTicketModel
                                                .data![index].createdAt!),
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
                                  padding: const EdgeInsets.only(bottom: 50),
                                  child: Text(
                                    controller.listSupportTicketModel
                                        .data![index].status
                                        .toString(),
                                    style: controller.listSupportTicketModel
                                        .data![index].status
                                        .toString() ==
                                        "pending"
                                        ? gilroyMediumTextStyle(
                                        color: ColorRes.colorFFA800,
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
                        );
                            }),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }

  Widget sendNewMessage() {
    return GetBuilder<AdHomeController>(
      id: "network",
        builder: (adHomeController){
        adHomeController.checkUserConnection();
      return InkWell(
        onTap: adHomeController.activeConnection == false?(){
          errorToast("No internet connection");
        }:() {
          Get.to(() => SupportcreateScreen())!.then((value) async {
            await controller.getListOfUserTicket();
          });
        },
        child: Container(
          height: 60,
          width: 300,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: ColorRes.colorE7D01F,
            gradient: const LinearGradient(
              colors: [ColorRes.colorFFEC5C, ColorRes.colorDFC60B],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
          child: Text(
            Strings.sendNewMessage,
            style: gilroyBoldTextStyle(color: Colors.black, fontSize: 16),
          ),
        ),
      );
    });
  }
}
