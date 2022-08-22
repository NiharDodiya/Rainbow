import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rainbow/common/Widget/buttons.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/screens/Home/settings/support/support_controller.dart';

import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/color_res.dart';
import 'package:rainbow/utils/strings.dart';

class SupportCreateEndUserScreen extends StatelessWidget {
  String? com;
  String? code;
  String? profileImage;
  String? title;
  String? time;

  SupportCreateEndUserScreen(
      {Key? key, this.com, this.title, this.profileImage, this.code, this.time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
            body(com.toString()),
          ],
        ),
      ),
    );
  }

  Widget body(String comp) {
    SupportController controller = Get.put(SupportController());
    return Expanded(
      child: ListView.builder(
        itemCount: controller.viewSupportTicketModel.data!.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.width * 0.08),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: Get.width * 0.01,
                      ),
                      Text(
                        code.toString(),
                        style: gilroyMediumTextStyle(fontSize: 16),
                      ),
                      const Spacer(),
                      Text(
                        com.toString(),
                        style: gilroySemiBoldTextStyle(
                            fontSize: 18, color: ColorRes.color_FFA620),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Get.height * 0.032,
                  ),
                  SizedBox(
                    height: Get.width * 0.144,
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.network(
                            controller.viewSupportTicketModel.data![index]
                                .userDetail!.profileImage
                                .toString(),
                            height: Get.width * 0.144,
                            width: Get.width * 0.144,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Image.asset(
                                AssetRes.posterProfile,
                                height: Get.width * 0.144,
                                width: Get.width * 0.144,
                              );
                            },
                          ),
                        ),
                        /* Container(
                          height: Get.width * 0.144,
                          width: Get.width * 0.144,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(AssetRes.account),
                            ),
                          ),
                        ),*/
                        SizedBox(
                          width: Get.width * 0.04,
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Spacer(),
                              Text(
                                controller.viewSupportTicketModel.data![index]
                                    .userDetail!.fullName
                                    .toString(),
                                style: gilroySemiBoldTextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(
                                height: Get.height * 0.0086,
                              ),
                              Text(
                                "${DateFormat().add_yMMMMd().format(controller.viewSupportTicketModel.data![index].createdAt!)}|${DateFormat().add_jm().format(controller.viewSupportTicketModel.data![index].createdAt!)}",
                                style: gilroySemiBoldTextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              // SizedBox(
                              //   height: Get.height * 0.0086,
                              // )
                            ]),

                        // const Spacer(),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.0233,
                  ),
                  Text(
                    controller.viewSupportTicketModel.data![index].description
                        .toString(),
                    style: gilroySemiBoldTextStyle(fontSize: 14),
                  ),
                  SizedBox(
                    height: Get.height * 0.0184,
                  ),
                  Container(
                    height: Get.height * 0.07279,
                    width: Get.width * 0.354666,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: ColorRes.white,
                        width: 2,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(9),
                      ),
                    ),
                    child: ListView.builder(scrollDirection: Axis.horizontal,itemCount: controller.viewSupportTicketModel.data![index]
                        .itmeList!.length ,itemBuilder: (context, index1) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            height: 42.98,
                            width: 42.98,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.network(
                                controller.viewSupportTicketModel.data![index]
                                    .itmeList![index1].image
                                    .toString(),
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Image.asset(
                                    AssetRes.portrait_placeholder,
                                    fit: BoxFit.cover,
                                  );
                                },
                              ),
                            ),
                          ),
                          const SizedBox(width: 5,),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: Get.height * 0.015),
                            child: InkWell(
                                onTap: () {
                                  controller.save(controller
                                      .viewSupportTicketModel
                                      .data![index]
                                      .itmeList![index1]
                                      .image
                                      .toString());
                                },
                                child: Image.asset(AssetRes.downlode)),
                          ),
                        ],
                      );
                    },),
                  ),
                  SizedBox(
                    height: Get.height * 0.0300,
                  ),
                  SizedBox(
                    height: Get.width * 0.144,
                    child: Row(
                      children: [
                        Container(
                          height: Get.width * 0.144,
                          width: Get.width * 0.144,
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
                              height: Get.width * 0.11,
                              width: Get.width * 0.11,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                image: AssetImage(AssetRes.duck),
                              )),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: Get.width * 0.04,
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Spacer(),
                              Text(
                                "Rainbow Admin",
                                style: gilroySemiBoldTextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(
                                height: Get.height * 0.0086,
                              ),
                              Text(
                                "${DateFormat().add_yMMMMd().format(controller.viewSupportTicketModel.data![index].createdAt!)}|${DateFormat().add_jm().format(controller.viewSupportTicketModel.data![index].createdAt!)}",
                                style: gilroySemiBoldTextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              // SizedBox(
                              //   height: Get.height * 0.0086,
                              // )
                            ]),

                        // const Spacer(),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.0233,
                  ),
                  Text(
                    Strings.thankYouForSending,
                    style: gilroySemiBoldTextStyle(fontSize: 14),
                  ),
                  SizedBox(
                    height: Get.height * 0.0246,
                  ),
                  Text(
                    Strings.yourMessage,
                    style: gilroySemiBoldTextStyle(fontSize: 14),
                  ),
                  SizedBox(
                    height: Get.height * 0.005,
                  ),
                  Container(
                    height: Get.height * 0.29679,
                    width: Get.width * 0.89333,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: ColorRes.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextField(
                      onChanged: (value) {},
                      maxLines: 7,
                      controller: controller.yourMsgSendController,
                      style: textFieldText,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(top: 0),
                        border: InputBorder.none,
                        hintStyle: gilroyMediumTextStyle(
                            fontSize: 18,
                            color: ColorRes.black.withOpacity(0.3)),
                        hintText: Strings.writeSomethings,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.01477,
                  ),
                  controller.image.isEmpty
                      ? const SizedBox()
                      : SizedBox(
                          height: 100,
                          width: Get.width * 0.3,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.image.length,
                            itemBuilder: (context, index) {
                              return Image.file(
                                controller.image[index],
                                height: 60,
                                width: 60,
                              );
                            },
                          ),
                        ),
                  Center(
                    child: SizedBox(
                      height: Get.height * 0.0474,
                      child: InkWell(
                          onTap: () {
                            controller.cameraImage();
                          },
                          child: Image.asset(AssetRes.cameraPic)),
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.0190,
                  ),
                  Center(
                    child: Text(
                      Strings.attachImagesOrproof,
                      style: gilroyMediumTextStyle(fontSize: 14),
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.05,
                  ),
                  SubmitButton(
                    onTap: () {
                      controller.valid();
                    },
                    child: Text(
                      Strings.sendMessage,
                      style: gilroyBoldTextStyle(
                          color: Colors.black, fontSize: 16),
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.05,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
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
                Strings.support,
                style: gilroyBoldTextStyle(),
              ),
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
