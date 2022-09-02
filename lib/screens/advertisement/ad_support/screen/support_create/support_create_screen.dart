import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/loaders.dart';
import 'package:rainbow/common/popup.dart';
import 'package:rainbow/screens/advertisement/ad_support/screen/support_create/support_create_controller.dart';

import '../../../../../common/Widget/buttons.dart';
import '../../../../../common/Widget/text_styles.dart';
import '../../../../../utils/asset_res.dart';
import '../../../../../utils/color_res.dart';
import '../../../../../utils/strings.dart';

class SupportcreateScreen extends StatelessWidget {
  SupportcreateScreen({
    Key? key,
  }) : super(key: key);

  final SupportCreateController controller = Get.put(SupportCreateController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
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
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: Get.height * 0.035,
                    ),
                    appBar(),
                    body(context),
                  ],
                ),
              ),
            ),
            controller.loader.isTrue
                ? const FullScreenLoader()
                : const SizedBox(),
          ],
        );
      }),
    );
  }

  Widget body(context) {
    SupportCreateController controller = Get.put(SupportCreateController());
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Get.width * 0.08),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //subject
          Text(
            Strings.subject,
            style: gilroySemiBoldTextStyle(fontSize: 14),
          ),
          SizedBox(
            height: Get.height * 0.015,
          ),
          Container(
            height: 50,
            width: Get.width * 0.89333,
            padding: const EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              color: ColorRes.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: TextField(
              onChanged: (value) {},
              controller: controller.subjectController,
              style: textFieldText,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(top: 0),
                border: InputBorder.none,
                hintStyle: gilroyMediumTextStyle(
                    fontSize: 16, color: ColorRes.black.withOpacity(0.3)),
                hintText: Strings.writesomethinghere,
              ),
            ),
          ),
          SizedBox(
            height: Get.height * 0.03,
          ),

          //message
          Text(
            Strings.yourMessage,
            style: gilroySemiBoldTextStyle(fontSize: 14),
          ),
          SizedBox(
            height: Get.height * 0.015,
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
              controller: controller.yourMsgController,
              style: textFieldText,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(top: 0),
                border: InputBorder.none,
                hintStyle: gilroyMediumTextStyle(
                    fontSize: 16, color: ColorRes.black.withOpacity(0.3)),
                hintText: Strings.writesomethinghere,
              ),
            ),
          ),
          SizedBox(
            height: Get.height * 0.06,
          ),

          //pic img
          GetBuilder<SupportCreateController>(
              id: "img",
              builder: (controller) {
                return Column(
                  children: [
                    (controller.image.isEmpty)
                        ? SizedBox()
                        : (controller.image.length == 3)
                            ? Row(
                                children: [
                                  Stack(
                                    alignment: Alignment(1.2, -1.3),
                                    children: [
                                      Container(
                                        height: Get.height / 12,
                                        width: Get.width / 5,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            image: DecorationImage(
                                                image: FileImage(
                                                    controller.image[0]),
                                                fit: BoxFit.cover)),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          FocusScopeNode currentfocus =
                                              FocusScope.of(context);
                                          if (!currentfocus.hasPrimaryFocus) {
                                            currentfocus.unfocus();
                                          }
                                          controller.image.removeAt(0);
                                          controller.update(["img"]);
                                        },
                                        child: Container(
                                            decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.black),
                                            child: const Icon(
                                              Icons.clear,
                                              color: Colors.white,
                                            )),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 20),
                                  Stack(
                                    alignment: Alignment(1.2, -1.3),
                                    children: [
                                      Container(
                                        height: Get.height / 12,
                                        width: Get.width / 5,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            image: DecorationImage(
                                                image: FileImage(
                                                    controller.image[1]),
                                                fit: BoxFit.cover)),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          FocusScopeNode currentfocus =
                                              FocusScope.of(context);
                                          if (!currentfocus.hasPrimaryFocus) {
                                            currentfocus.unfocus();
                                          }
                                          controller.image.removeAt(1);
                                          controller.update(["img"]);
                                        },
                                        child: Container(
                                            decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.black),
                                            child: const Icon(
                                              Icons.clear,
                                              color: Colors.white,
                                            )),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 20),
                                  Stack(
                                    alignment: Alignment(1.2, -1.3),
                                    children: [
                                      Container(
                                        height: Get.height / 12,
                                        width: Get.width / 5,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            image: DecorationImage(
                                                image: FileImage(
                                                    controller.image[2]),
                                                fit: BoxFit.cover)),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          FocusScopeNode currentfocus =
                                              FocusScope.of(context);
                                          if (!currentfocus.hasPrimaryFocus) {
                                            currentfocus.unfocus();
                                          }
                                          controller.image.removeAt(2);
                                          controller.update(["img"]);
                                        },
                                        child: Container(
                                            decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.black),
                                            child: const Icon(
                                              Icons.clear,
                                              color: Colors.white,
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
                                        alignment: Alignment(1.2, -1.3),
                                        children: [
                                          Container(
                                            height: Get.height / 12,
                                            width: Get.width / 5,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                image: DecorationImage(
                                                    image: FileImage(
                                                        controller.image[0]),
                                                    fit: BoxFit.cover)),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              FocusScopeNode currentfocus =
                                                  FocusScope.of(context);
                                              if (!currentfocus
                                                  .hasPrimaryFocus) {
                                                currentfocus.unfocus();
                                              }
                                              controller.image.removeAt(0);
                                              controller.update(["img"]);
                                            },
                                            child: Container(
                                                decoration: const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Colors.black),
                                                child: const Icon(
                                                  Icons.clear,
                                                  color: Colors.white,
                                                )),
                                          ),
                                        ],
                                      ),
                                      SizedBox(width: 20),
                                      Stack(
                                        alignment: Alignment(1.2, -1.3),
                                        children: [
                                          Container(
                                            height: Get.height / 12,
                                            width: Get.width / 5,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                image: DecorationImage(
                                                    image: FileImage(
                                                        controller.image[1]),
                                                    fit: BoxFit.cover)),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              FocusScopeNode currentfocus =
                                                  FocusScope.of(context);
                                              if (!currentfocus
                                                  .hasPrimaryFocus) {
                                                currentfocus.unfocus();
                                              }
                                              controller.image.removeAt(1);
                                              controller.update(["img"]);
                                            },
                                            child: Container(
                                                decoration: const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Colors.black),
                                                child: const Icon(
                                                  Icons.clear,
                                                  color: Colors.white,
                                                )),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                : (controller.image.length == 1)
                                    ? Stack(
                                        alignment: Alignment(1.2, -1.3),
                                        children: [
                                          Container(
                                            height: Get.height / 12,
                                            width: Get.width / 5,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                image: DecorationImage(
                                                    image: FileImage(
                                                        controller.image[0]),
                                                    fit: BoxFit.cover)),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              FocusScopeNode currentfocus =
                                                  FocusScope.of(context);
                                              if (!currentfocus
                                                  .hasPrimaryFocus) {
                                                currentfocus.unfocus();
                                              }
                                              controller.image.removeAt(0);
                                              controller.update(["img"]);
                                            },
                                            child: Container(
                                                decoration: const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Colors.black),
                                                child: const Icon(
                                                  Icons.clear,
                                                  color: Colors.white,
                                                )),
                                          ),
                                        ],
                                      )
                                    : Row(
                                        children: [
                                          Stack(
                                            alignment: Alignment(1.2, -1.3),
                                            children: [
                                              Container(
                                                height: Get.height / 12,
                                                width: Get.width / 5,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    image: DecorationImage(
                                                        image: FileImage(
                                                            controller
                                                                .image[0]),
                                                        fit: BoxFit.cover)),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  FocusScopeNode currentfocus =
                                                      FocusScope.of(context);
                                                  if (!currentfocus
                                                      .hasPrimaryFocus) {
                                                    currentfocus.unfocus();
                                                  }
                                                  controller.image.removeAt(0);
                                                  controller.update(["img"]);
                                                },
                                                child: Container(
                                                    decoration:
                                                        const BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            color:
                                                                Colors.black),
                                                    child: const Icon(
                                                      Icons.clear,
                                                      color: Colors.white,
                                                    )),
                                              ),
                                            ],
                                          ),
                                          SizedBox(width: 20),
                                          Stack(
                                            alignment: Alignment(1.2, -1.3),
                                            children: [
                                              Container(
                                                height: Get.height / 12,
                                                width: Get.width / 5,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    image: DecorationImage(
                                                        image: FileImage(
                                                            controller
                                                                .image[1]),
                                                        fit: BoxFit.cover)),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  FocusScopeNode currentfocus =
                                                      FocusScope.of(context);
                                                  if (!currentfocus
                                                      .hasPrimaryFocus) {
                                                    currentfocus.unfocus();
                                                  }
                                                  controller.image.removeAt(1);
                                                  controller.update(["img"]);
                                                },
                                                child: Container(
                                                    decoration:
                                                        const BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            color:
                                                                Colors.black),
                                                    child: const Icon(
                                                      Icons.clear,
                                                      color: Colors.white,
                                                    )),
                                              ),
                                            ],
                                          ),
                                          SizedBox(width: 20),
                                          Stack(
                                            alignment: Alignment(1.2, -1.3),
                                            children: [
                                              Container(
                                                height: Get.height / 12,
                                                width: Get.width / 5,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    image: DecorationImage(
                                                        image: FileImage(
                                                            controller
                                                                .image[2]),
                                                        fit: BoxFit.cover)),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  FocusScopeNode currentfocus =
                                                      FocusScope.of(context);
                                                  if (!currentfocus
                                                      .hasPrimaryFocus) {
                                                    currentfocus.unfocus();
                                                  }
                                                  controller.image.removeAt(2);
                                                  controller.update(["img"]);
                                                },
                                                child: Container(
                                                    decoration:
                                                        const BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            color:
                                                                Colors.black),
                                                    child: const Icon(
                                                      Icons.clear,
                                                      color: Colors.white,
                                                    )),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        InkWell(
                          onTap: () {
                            if (controller.image.length == 3) {
                              errorToast("you can take only 3 images");
                            } else {
                              FocusScopeNode currentfocus =
                                  FocusScope.of(context);
                              if (!currentfocus.hasPrimaryFocus) {
                                currentfocus.unfocus();
                              }
                              showModalBottomSheet(
                                  elevation: 10,
                                  barrierColor: ColorRes.black.withOpacity(0.4),
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10.0),
                                    ),
                                  ),
                                  backgroundColor: ColorRes.color_4F359B,
                                  context: context,
                                  builder: (context) {
                                    return Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        GestureDetector(
                                          onTap: controller.navigateToCamera,
                                          child: const ListTile(
                                            leading: Icon(Icons.camera),
                                            title: Text(Strings.camera),
                                          ),
                                        ),
                                        Container(
                                          height: 0.5,
                                          width: Get.width,
                                          color: ColorRes.white,
                                        ),
                                        GestureDetector(
                                          onTap: controller.navigateToGallery,
                                          child: const ListTile(
                                            leading: Icon(Icons
                                                .photo_size_select_actual_outlined),
                                            title: Text(Strings.gallery),
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
                              image: AssetImage(AssetRes.cameraPic),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.0190,
                        ),
                        Center(
                          child: Text(
                            Strings.attachImage,
                            style: gilroyMediumTextStyle(fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              }),
          SizedBox(
            height: Get.height * 0.05,
          ),
          SubmitButton(
            onTap: controller.onSendMsgTap,
            child: Text(
              Strings.sendMessage,
              style: gilroyBoldTextStyle(color: Colors.black, fontSize: 16),
            ),
          ),
          SizedBox(
            height: Get.height * 0.05,
          ),
        ],
      ),
    );
  }
}

Widget appBar() {
  final SupportCreateController controller = Get.put(SupportCreateController());
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
                controller.yourMsgController.clear();
                controller.subjectController.clear();
                controller.image.clear();
                controller.image.length = 0;
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

/*
  GetBuilder<SupportCreateController>(
              id: "img",
              builder: (controller) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    (controller.image.isEmpty)
                        ? const SizedBox()
                        : Stack(
                            alignment: Alignment(1.2, -1.3),
                            children: [
                              Container(
                                height: Get.height / 12,
                                width: Get.width / 5,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                        image: FileImage(controller.image[0]),
                                        fit: BoxFit.cover)),
                              ),
                              InkWell(
                                onTap: () {
                                  FocusScopeNode currentfocus =
                                      FocusScope.of(context);
                                  if (!currentfocus.hasPrimaryFocus) {
                                    currentfocus.unfocus();
                                  }
                                  controller.image.removeAt(0);
                                  controller.update(["img"]);
                                },
                                child: Container(
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.black),
                                    child: const Icon(
                                      Icons.clear,
                                      color: Colors.white,
                                    )),
                              ),
                            ],
                          ),
                    SizedBox(
                      width: 20,
                    ),
                    (controller.image.length == 2)
                        ? Stack(
                            alignment: Alignment(1.2, -1.3),
                            children: [
                              Container(
                                height: Get.height / 12,
                                width: Get.width / 5,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                        image: FileImage(controller.image[1]),
                                        fit: BoxFit.cover)),
                              ),
                              InkWell(
                                onTap: () {
                                  FocusScopeNode currentfocus =
                                      FocusScope.of(context);
                                  if (!currentfocus.hasPrimaryFocus) {
                                    currentfocus.unfocus();
                                  }
                                  controller.image.removeAt(1);
                                  controller.update(["img"]);
                                },
                                child: Container(
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.black),
                                    child: const Icon(
                                      Icons.clear,
                                      color: Colors.white,
                                    )),
                              ),
                            ],
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  FocusScopeNode currentfocus =
                                      FocusScope.of(context);
                                  if (!currentfocus.hasPrimaryFocus) {
                                    currentfocus.unfocus();
                                  }
                                  showModalBottomSheet(
                                      elevation: 10,
                                      barrierColor:
                                          ColorRes.black.withOpacity(0.4),
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10.0),
                                        ),
                                      ),
                                      backgroundColor: ColorRes.color_4F359B,
                                      context: context,
                                      builder: (context) {
                                        return Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            GestureDetector(
                                              onTap:
                                                  controller.navigateToCamera,
                                              child: const ListTile(
                                                leading: Icon(Icons.camera),
                                                title: Text(Strings.camera),
                                              ),
                                            ),
                                            Container(
                                              height: 0.5,
                                              width: Get.width,
                                              color: ColorRes.white,
                                            ),
                                            GestureDetector(
                                              onTap:
                                                  controller.navigateToGallery,
                                              child: const ListTile(
                                                leading: Icon(Icons
                                                    .photo_size_select_actual_outlined),
                                                title: Text(Strings.gallery),
                                              ),
                                            ),
                                          ],
                                        );
                                      });
                                },
                                child: SizedBox(
                                  height: Get.height * 0.0474,
                                  child: const Image(
                                    image: AssetImage(AssetRes.cameraPic),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: Get.height * 0.0190,
                              ),
                              Center(
                                child: Text(
                                  Strings.attachImage,
                                  style: gilroyMediumTextStyle(fontSize: 14),
                                ),
                              ),
                            ],
                          ),
                  ],
                );
              }),
 */
