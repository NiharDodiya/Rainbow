import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rainbow/common/Widget/buttons.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/common/popup.dart';
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
  String? id;

  SupportCreateEndUserScreen(
      {Key? key,
      this.com,
      this.title,
      this.profileImage,
      this.code,
      this.time,
      this.id})
      : super(key: key);

  final SupportController controller = Get.put(SupportController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(() {
      return Stack(
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
                appBar(context),

                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: Get.width * 0.05,
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
                            SizedBox(
                              width: Get.width * 0.05,
                            ),
                          ],
                        ),
                        body(com.toString()),

                        const SizedBox(
                          height: 15,
                        ),

                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: Text(
                              Strings.yourMessage,
                              style: gilroySemiBoldTextStyle(fontSize: 14),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.005,
                        ),
                        Container(
                          height: Get.height * 0.29679,
                          width: Get.width * 0.85333,
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
                        //pic Image
                        Padding(
                          padding: const EdgeInsets.only(left: 60, top: 30),
                          child: GetBuilder<SupportController>(
                              id: "img",
                              builder: (controller) {
                                return Column(
                                  children: [
                                    (controller.image.isEmpty)
                                        ? const SizedBox()
                                        : (controller.image.length == 3)
                                            ? Row(
                                                children: [
                                                  Stack(
                                                    alignment: const Alignment(
                                                        1.2, -1.3),
                                                    children: [
                                                      Container(
                                                        height: Get.height / 12,
                                                        width: Get.width / 5,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15),
                                                            image: DecorationImage(
                                                                image: FileImage(
                                                                    controller
                                                                            .image[
                                                                        0]),
                                                                fit: BoxFit
                                                                    .cover)),
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          FocusScopeNode
                                                              currentfocus =
                                                              FocusScope.of(
                                                                  context);
                                                          if (!currentfocus
                                                              .hasPrimaryFocus) {
                                                            currentfocus
                                                                .unfocus();
                                                          }
                                                          controller.image
                                                              .removeAt(0);
                                                          controller
                                                              .update(["img"]);
                                                        },
                                                        child: Container(
                                                            decoration:
                                                                const BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                    color: Colors
                                                                        .black),
                                                            child: const Icon(
                                                              Icons.clear,
                                                              color:
                                                                  Colors.white,
                                                            )),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(width: 20),
                                                  Stack(
                                                    alignment: const Alignment(
                                                        1.2, -1.3),
                                                    children: [
                                                      Container(
                                                        height: Get.height / 12,
                                                        width: Get.width / 5,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15),
                                                            image: DecorationImage(
                                                                image: FileImage(
                                                                    controller
                                                                            .image[
                                                                        1]),
                                                                fit: BoxFit
                                                                    .cover)),
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          FocusScopeNode
                                                              currentfocus =
                                                              FocusScope.of(
                                                                  context);
                                                          if (!currentfocus
                                                              .hasPrimaryFocus) {
                                                            currentfocus
                                                                .unfocus();
                                                          }
                                                          controller.image
                                                              .removeAt(1);
                                                          controller
                                                              .update(["img"]);
                                                        },
                                                        child: Container(
                                                            decoration:
                                                                const BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                    color: Colors
                                                                        .black),
                                                            child: const Icon(
                                                              Icons.clear,
                                                              color:
                                                                  Colors.white,
                                                            )),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(width: 20),
                                                  Stack(
                                                    alignment: const Alignment(
                                                        1.2, -1.3),
                                                    children: [
                                                      Container(
                                                        height: Get.height / 12,
                                                        width: Get.width / 5,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15),
                                                            image: DecorationImage(
                                                                image: FileImage(
                                                                    controller
                                                                            .image[
                                                                        2]),
                                                                fit: BoxFit
                                                                    .cover)),
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          FocusScopeNode
                                                              currentfocus =
                                                              FocusScope.of(
                                                                  context);
                                                          if (!currentfocus
                                                              .hasPrimaryFocus) {
                                                            currentfocus
                                                                .unfocus();
                                                          }
                                                          controller.image
                                                              .removeAt(2);
                                                          controller
                                                              .update(["img"]);
                                                        },
                                                        child: Container(
                                                            decoration:
                                                                const BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                    color: Colors
                                                                        .black),
                                                            child: const Icon(
                                                              Icons.clear,
                                                              color:
                                                                  Colors.white,
                                                            )),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              )
                                            : (controller.image.length == 2)
                                                ? Row(
                                                    children: [
                                                      Stack(
                                                        alignment:
                                                            const Alignment(
                                                                1.2, -1.3),
                                                        children: [
                                                          Container(
                                                            height:
                                                                Get.height / 12,
                                                            width:
                                                                Get.width / 5,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15),
                                                                image: DecorationImage(
                                                                    image: FileImage(
                                                                        controller.image[
                                                                            0]),
                                                                    fit: BoxFit
                                                                        .cover)),
                                                          ),
                                                          InkWell(
                                                            onTap: () {
                                                              FocusScopeNode
                                                                  currentfocus =
                                                                  FocusScope.of(
                                                                      context);
                                                              if (!currentfocus
                                                                  .hasPrimaryFocus) {
                                                                currentfocus
                                                                    .unfocus();
                                                              }
                                                              controller.image
                                                                  .removeAt(0);
                                                              controller.update(
                                                                  ["img"]);
                                                            },
                                                            child: Container(
                                                                decoration: const BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                    color: Colors
                                                                        .black),
                                                                child:
                                                                    const Icon(
                                                                  Icons.clear,
                                                                  color: Colors
                                                                      .white,
                                                                )),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(width: 20),
                                                      Stack(
                                                        alignment:
                                                            const Alignment(
                                                                1.2, -1.3),
                                                        children: [
                                                          Container(
                                                            height:
                                                                Get.height / 12,
                                                            width:
                                                                Get.width / 5,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15),
                                                                image: DecorationImage(
                                                                    image: FileImage(
                                                                        controller.image[
                                                                            1]),
                                                                    fit: BoxFit
                                                                        .cover)),
                                                          ),
                                                          InkWell(
                                                            onTap: () {
                                                              FocusScopeNode
                                                                  currentfocus =
                                                                  FocusScope.of(
                                                                      context);
                                                              if (!currentfocus
                                                                  .hasPrimaryFocus) {
                                                                currentfocus
                                                                    .unfocus();
                                                              }
                                                              controller.image
                                                                  .removeAt(1);
                                                              controller.update(
                                                                  ["img"]);
                                                            },
                                                            child: Container(
                                                                decoration: const BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                    color: Colors
                                                                        .black),
                                                                child:
                                                                    const Icon(
                                                                  Icons.clear,
                                                                  color: Colors
                                                                      .white,
                                                                )),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  )
                                                : (controller.image.length == 1)
                                                    ? Stack(
                                                        alignment:
                                                            const Alignment(
                                                                1.2, -1.3),
                                                        children: [
                                                          Container(
                                                            height:
                                                                Get.height / 12,
                                                            width:
                                                                Get.width / 5,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15),
                                                                image: DecorationImage(
                                                                    image: FileImage(
                                                                        controller.image[
                                                                            0]),
                                                                    fit: BoxFit
                                                                        .cover)),
                                                          ),
                                                          InkWell(
                                                            onTap: () {
                                                              FocusScopeNode
                                                                  currentfocus =
                                                                  FocusScope.of(
                                                                      context);
                                                              if (!currentfocus
                                                                  .hasPrimaryFocus) {
                                                                currentfocus
                                                                    .unfocus();
                                                              }
                                                              controller.image
                                                                  .removeAt(0);
                                                              controller.update(
                                                                  ["img"]);
                                                            },
                                                            child: Container(
                                                                decoration: const BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                    color: Colors
                                                                        .black),
                                                                child:
                                                                    const Icon(
                                                                  Icons.clear,
                                                                  color: Colors
                                                                      .white,
                                                                )),
                                                          ),
                                                        ],
                                                      )
                                                    : Row(
                                                        children: [
                                                          Stack(
                                                            alignment:
                                                                const Alignment(
                                                                    1.2, -1.3),
                                                            children: [
                                                              Container(
                                                                height:
                                                                    Get.height /
                                                                        12,
                                                                width:
                                                                    Get.width /
                                                                        5,
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15),
                                                                    image: DecorationImage(
                                                                        image: FileImage(controller.image[
                                                                            0]),
                                                                        fit: BoxFit
                                                                            .cover)),
                                                              ),
                                                              InkWell(
                                                                onTap: () {
                                                                  FocusScopeNode
                                                                      currentfocus =
                                                                      FocusScope.of(
                                                                          context);
                                                                  if (!currentfocus
                                                                      .hasPrimaryFocus) {
                                                                    currentfocus
                                                                        .unfocus();
                                                                  }
                                                                  controller
                                                                      .image
                                                                      .removeAt(
                                                                          0);
                                                                  controller
                                                                      .update([
                                                                    "img"
                                                                  ]);
                                                                },
                                                                child:
                                                                    Container(
                                                                        decoration: const BoxDecoration(
                                                                            shape: BoxShape
                                                                                .circle,
                                                                            color: Colors
                                                                                .black),
                                                                        child:
                                                                            const Icon(
                                                                          Icons
                                                                              .clear,
                                                                          color:
                                                                              Colors.white,
                                                                        )),
                                                              ),
                                                            ],
                                                          ),
                                                          const SizedBox(
                                                              width: 20),
                                                          Stack(
                                                            alignment:
                                                                const Alignment(
                                                                    1.2, -1.3),
                                                            children: [
                                                              Container(
                                                                height:
                                                                    Get.height /
                                                                        12,
                                                                width:
                                                                    Get.width /
                                                                        5,
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15),
                                                                    image: DecorationImage(
                                                                        image: FileImage(controller.image[
                                                                            1]),
                                                                        fit: BoxFit
                                                                            .cover)),
                                                              ),
                                                              InkWell(
                                                                onTap: () {
                                                                  FocusScopeNode
                                                                      currentfocus =
                                                                      FocusScope.of(
                                                                          context);
                                                                  if (!currentfocus
                                                                      .hasPrimaryFocus) {
                                                                    currentfocus
                                                                        .unfocus();
                                                                  }
                                                                  controller
                                                                      .image
                                                                      .removeAt(
                                                                          1);
                                                                  controller
                                                                      .update([
                                                                    "img"
                                                                  ]);
                                                                },
                                                                child:
                                                                    Container(
                                                                        decoration: const BoxDecoration(
                                                                            shape: BoxShape
                                                                                .circle,
                                                                            color: Colors
                                                                                .black),
                                                                        child:
                                                                            const Icon(
                                                                          Icons
                                                                              .clear,
                                                                          color:
                                                                              Colors.white,
                                                                        )),
                                                              ),
                                                            ],
                                                          ),
                                                          const SizedBox(
                                                              width: 20),
                                                          Stack(
                                                            alignment:
                                                                const Alignment(
                                                                    1.2, -1.3),
                                                            children: [
                                                              Container(
                                                                height:
                                                                    Get.height /
                                                                        12,
                                                                width:
                                                                    Get.width /
                                                                        5,
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15),
                                                                    image: DecorationImage(
                                                                        image: FileImage(controller.image[
                                                                            2]),
                                                                        fit: BoxFit
                                                                            .cover)),
                                                              ),
                                                              InkWell(
                                                                onTap: () {
                                                                  FocusScopeNode
                                                                      currentfocus =
                                                                      FocusScope.of(
                                                                          context);
                                                                  if (!currentfocus
                                                                      .hasPrimaryFocus) {
                                                                    currentfocus
                                                                        .unfocus();
                                                                  }
                                                                  controller
                                                                      .image
                                                                      .removeAt(
                                                                          2);
                                                                  controller
                                                                      .update([
                                                                    "img"
                                                                  ]);
                                                                },
                                                                child:
                                                                    Container(
                                                                        decoration: const BoxDecoration(
                                                                            shape: BoxShape
                                                                                .circle,
                                                                            color: Colors
                                                                                .black),
                                                                        child:
                                                                            const Icon(
                                                                          Icons
                                                                              .clear,
                                                                          color:
                                                                              Colors.white,
                                                                        )),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 60),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              if (controller.image.length ==
                                                  3) {
                                                errorToast(
                                                    "you can take only 3 images");
                                              } else {
                                                FocusScopeNode currentfocus =
                                                    FocusScope.of(context);
                                                if (!currentfocus
                                                    .hasPrimaryFocus) {
                                                  currentfocus.unfocus();
                                                }
                                                showModalBottomSheet(
                                                    elevation: 10,
                                                    barrierColor: ColorRes.black
                                                        .withOpacity(0.4),
                                                    shape:
                                                        const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(10.0),
                                                      ),
                                                    ),
                                                    backgroundColor:
                                                        ColorRes.color_4F359B,
                                                    context: context,
                                                    builder: (context) {
                                                      return Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: <Widget>[
                                                          GestureDetector(
                                                            onTap: controller
                                                                .cameraImage,
                                                            child:
                                                                const ListTile(
                                                              leading: Icon(
                                                                  Icons.camera),
                                                              title: Text(
                                                                  Strings
                                                                      .camera),
                                                            ),
                                                          ),
                                                          Container(
                                                            height: 0.5,
                                                            width: Get.width,
                                                            color:
                                                                ColorRes.white,
                                                          ),
                                                          GestureDetector(
                                                            onTap: controller
                                                                .galleryImage,
                                                            child:
                                                                const ListTile(
                                                              leading: Icon(Icons
                                                                  .photo_size_select_actual_outlined),
                                                              title: Text(
                                                                  Strings
                                                                      .gallery),
                                                            ),
                                                          ),
                                                        ],
                                                      );
                                                    });
                                              }
                                            },
                                            child: SizedBox(
                                              height: Get.height * 0.0474,
                                              child: const Image(
                                                image: AssetImage(
                                                    AssetRes.cameraPic),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: Get.height * 0.0190,
                                          ),
                                          Center(
                                            child: Text(
                                              Strings.attachImage,
                                              style: gilroyMediumTextStyle(
                                                  fontSize: 14),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              }),
                        ),
                        SizedBox(
                          height: Get.height * 0.05,
                        ),
                        SubmitButton(
                          onTap: () {
                            controller.onTapSendMessage(id.toString());
                          },
                          child: Text(
                            Strings.sendMessage,
                            style: gilroyBoldTextStyle(
                                color: Colors.black, fontSize: 16),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          controller.loader.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : const SizedBox(),
        ],
      );
    }));
  }

  Widget body(String comp) {
    SupportController controller = Get.put(SupportController());
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: controller.viewSupportTicketModel.data!.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.08),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                            AssetRes.portrait_placeholder,
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
                            "${DateFormat().add_yMMMMd().format(controller.viewSupportTicketModel.data![index].createdAt!.toLocal())} | ${DateFormat().add_jm().format(controller.viewSupportTicketModel.data![index].createdAt!.toLocal())}",
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
              /*     SizedBox(
                  height: Get.height * 0.0184,
                ),*/
              //image
              controller.viewSupportTicketModel.data![index].itmeList!.isEmpty
                  ? SizedBox()
                  : (controller.viewSupportTicketModel.data![index].itmeList!
                              .length ==
                          3)
                      ? Container(
                          height: Get.height * 0.07279,
                          width: Get.width * 0.49,
                          padding: const EdgeInsets.only(right: 5, left: 5),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: ColorRes.white,
                              width: 2,
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(9),
                            ),
                          ),
                          child: Stack(
                            alignment: Alignment.topRight,
                            children: [
                              ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: controller.viewSupportTicketModel
                                    .data![index].itmeList!.length,
                                itemBuilder: (context, index1) {
                                  return Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      SizedBox(
                                        height: 42.98,
                                        width: 42.98,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.network(
                                            controller
                                                .viewSupportTicketModel
                                                .data![index]
                                                .itmeList![index1]
                                                .image
                                                .toString(),
                                            fit: BoxFit.cover,
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                              return Image.asset(
                                                AssetRes.portrait_placeholder,
                                                fit: BoxFit.cover,
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                    ],
                                  );
                                },
                              ),
                              downloadButton3(index)
                            ],
                          ),
                        )
                      : Container(
                          height: Get.height * 0.07279,
                          width: Get.width * 0.354666,
                          padding: const EdgeInsets.only(right: 5, left: 5),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: ColorRes.white,
                              width: 2,
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(9),
                            ),
                          ),
                          child: (controller.viewSupportTicketModel.data![index]
                                      .itmeList!.length ==
                                  1)
                              ? Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: controller
                                          .viewSupportTicketModel
                                          .data![index]
                                          .itmeList!
                                          .length,
                                      itemBuilder: (context, index1) {
                                        return Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            SizedBox(
                                              height: 42.98,
                                              width: 42.98,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: Image.network(
                                                  controller
                                                      .viewSupportTicketModel
                                                      .data![0]
                                                      .itmeList![index1]
                                                      .image
                                                      .toString(),
                                                  fit: BoxFit.cover,
                                                  errorBuilder: (context, error,
                                                      stackTrace) {
                                                    return Image.asset(
                                                      AssetRes
                                                          .portrait_placeholder,
                                                      fit: BoxFit.cover,
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 5),
                                          ],
                                        );
                                      },
                                    ),
                                    downloadButton1(index)
                                  ],
                                )
                              : (controller.viewSupportTicketModel.data![index]
                                          .itmeList!.length ==
                                      2)
                                  ? Stack(
                                      alignment: Alignment.topRight,
                                      children: [
                                        ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: controller
                                              .viewSupportTicketModel
                                              .data![index]
                                              .itmeList!
                                              .length,
                                          itemBuilder: (context, index1) {
                                            return Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                SizedBox(
                                                  height: 42.98,
                                                  width: 42.98,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    child: Image.network(
                                                      controller
                                                          .viewSupportTicketModel
                                                          .data![index]
                                                          .itmeList![index1]
                                                          .image
                                                          .toString(),
                                                      fit: BoxFit.cover,
                                                      errorBuilder: (context,
                                                          error, stackTrace) {
                                                        return Image.asset(
                                                          AssetRes
                                                              .portrait_placeholder,
                                                          fit: BoxFit.cover,
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(width: 5),
                                              ],
                                            );
                                          },
                                        ),
                                        downloadButton2(index)
                                      ],
                                    )
                                  : SizedBox(),
                        ),

              SizedBox(
                height: Get.height * 0.05,
              ),
            ],
          ),
        );
      },
    );
  }
}

Widget appBar(context) {
  final SupportController controller = Get.put(SupportController());
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
                controller.yourMsgSendController.clear();
                controller.image.removeAt(0);
                controller.image.removeAt(1);
                controller.image.removeAt(2);
                // (controller.image.isEmpty)
                //     ?""
                //     : (controller.image.length == 1)
                //     ?controller.image.removeAt(0)
                //     : (controller.image.length == 2)
                //     ?(controller.image.removeAt(0)controller.image.removeAt(1)):
                controller.update(["img"]);
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

Widget downloadButton2(int i) {
  SupportController controller = Get.put(SupportController());
  return Padding(
    padding: EdgeInsets.symmetric(vertical: Get.height * 0.015),
    child: InkWell(
        onTap: () {
          controller.save(controller
              .viewSupportTicketModel.data![i].itmeList![0].image
              .toString());
          controller.save(controller
              .viewSupportTicketModel.data![i].itmeList![1].image
              .toString());
          flutterToast("Image Save successFull");
          // (controller.loader.value == false)? flutterToast("Image Save successFull"):SizedBox();
        },
        child: Image.asset(AssetRes.downlode)),
  );
}

Widget downloadButton1(int i) {
  SupportController controller = Get.put(SupportController());
  return Padding(
    padding: EdgeInsets.symmetric(vertical: Get.height * 0.015),
    child: InkWell(
        onTap: () {
          controller.save(controller
              .viewSupportTicketModel.data![i].itmeList![0].image
              .toString());
          flutterToast("Image Save successFull");
          //controller.loader.value == false? flutterToast("Image Save successFull"):SizedBox();
        },
        child: Image.asset(AssetRes.downlode)),
  );
}

Widget downloadButton3(int i) {
  SupportController controller = Get.put(SupportController());
  return Padding(
    padding: EdgeInsets.symmetric(vertical: Get.height * 0.015),
    child: InkWell(
        onTap: () {
          controller.save(controller
              .viewSupportTicketModel.data![i].itmeList![0].image
              .toString());
          controller.save(controller
              .viewSupportTicketModel.data![i].itmeList![1].image
              .toString());
          controller.save(controller
              .viewSupportTicketModel.data![i].itmeList![2].image
              .toString());
          flutterToast("Image Save successFull");
          //controller.loader.value == false? flutterToast("Image Save successFull"):SizedBox();
        },
        child: Image.asset(AssetRes.downlode)),
  );
}
