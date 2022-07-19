import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/loaders.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/screens/auth/idScanner/idScanner_controller.dart';
import 'package:rainbow/screens/idVerification/idverification_controller.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/color_res.dart';
import 'package:rainbow/utils/strings.dart';

class IdScannerBackScreen extends StatelessWidget {
  final IdScannerController controller = Get.put(IdScannerController());
  final IdVerificationController idController =
      Get.put(IdVerificationController());
  final VoidCallback onSend;
  final VoidCallback onTack;
  final bool isFront;

  IdScannerBackScreen(
      {Key? key,
      required this.onSend,
      required this.isFront,
      required this.onTack})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GetBuilder<IdScannerController>(
        builder: (_) {
          return Column(
            children: [
              Container(
                width: Get.width,
                padding: EdgeInsets.only(
                    top: Get.height * 0.04, bottom: Get.height * 0.03325),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0XFF50379D), Color(0XFFB77DDE)]),
                  color: ColorRes.color_4F359B,
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Icon(
                          Icons.arrow_back_ios_outlined,
                          size: 16.72,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 18,
                    ),
                    Text(
                      Strings.idVerification,
                      style: textStyleFont26WhiteBold,
                    )
                  ],
                ),
              ),
              SizedBox(height: Get.height * 0.04310),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Get.width * 0.03645),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: controller.retakePic,
                      child: Image.asset(
                        AssetRes.referesh,
                        height: 18.67,
                        width: 26.67,
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: onSend,
                      child: Image.asset(
                        AssetRes.send,
                        height: 18.67,
                        width: 26.67,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: Get.height * 0.05095),
              Expanded(
                child: Stack(
                  children: [
                    SizedBox(
                      child: buildCameraFunction(context, controller),
                    ),
                    Positioned(
                      top: Get.height * 0.3226,
                      child: Container(
                        color: ColorRes.black,
                        // height: Get.height - (Get.height * 0.1071 + 83),
                        height: Get.height,
                        width: Get.width,
                        child: Column(
                          children: [
                            Container(
                              width: Get.width,
                              color: ColorRes.color_E2E2E2.withOpacity(0.5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(height: Get.height * 0.025),
                                  Text(
                                    isFront
                                        ? Strings.permanentResidentCard
                                        : Strings.permanentResidentBackCard,
                                    style: gilroyBoldTextStyle(fontSize: 20),
                                  ),
                                  SizedBox(height: Get.height * 0.01),
                                  Text(
                                    Strings.placeYourId,
                                    style: textStyleFont14White,
                                  ),
                                  SizedBox(height: Get.height * 0.01),
                                  Text(Strings.pleaseMakeSure,
                                      style: textStyleFont14White),
                                  SizedBox(height: Get.height * 0.03571),
                                ],
                              ),
                            ),
                            SizedBox(height: Get.height * 0.056),
                            GestureDetector(
                              onTap: onTack,
                              child: Center(
                                child: Container(
                                  height: Get.width * 0.224,
                                  width: Get.width * 0.224,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: ColorRes.color_C4C4C4,
                                  ),
                                  child: Center(
                                    child: Container(
                                      height: Get.width * 0.1467,
                                      width: Get.width * 0.1467,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: ColorRes.color_FBF9F9,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  FutureBuilder<void> futureCamera() {
    return FutureBuilder<void>(
      future: controller.initializeControllerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return SizedBox(
            width: Get.width,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CameraPreview(controller.controller),
                ],
              ),
            ),
          );
        } else {
          /// Otherwise, display a loading indicator.
          return SizedBox(
            height: Get.height * 0.3226,
            child: const SmallLoader(),
          );
        }
      },
    );
  }

  Widget buildCameraFunction(context, IdScannerController controller) {
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        futureCamera(),
        SizedBox(
          height: Get.height * 0.3226,
          width: Get.width,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: Get.width * 0.02, left: Get.width * 0.03645),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Image(
                    image: const AssetImage(
                      AssetRes.topLeft,
                    ),
                    height: Get.width * 0.06667,
                    width: Get.width * 0.06667,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: Get.width * 0.02, right: Get.width * 0.03645),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Image(
                    image: const AssetImage(AssetRes.topRight),
                    height: Get.width * 0.06667,
                    width: Get.width * 0.06667,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    bottom: Get.width * 0.05467, right: Get.width * 0.03645),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Image(
                    image: const AssetImage(AssetRes.bottomRight),
                    height: Get.width * 0.06667,
                    width: Get.width * 0.06667,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    bottom: Get.width * 0.05467, left: Get.width * 0.03645),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Image(
                    image: const AssetImage(AssetRes.bottomLeft),
                    height: Get.width * 0.06667,
                    width: Get.width * 0.06667,
                  ),
                ),
              ),
              SizedBox(
                height: Get.height * 0.3226,
                width: Get.width,
                child: (isFront
                        ? controller.imageFront == null
                        : controller.imageBack == null)
                    ? const SizedBox()
                    : RepaintBoundary(
                        key: controller.widgetKey,
                        child: Image.file(
                          File(isFront
                              ? controller.imageFront.toString()
                              : controller.imageBack.toString()),
                          width: Get.width,
                          height: Get.height * 0.3226,
                          fit: BoxFit.fitWidth,
                          alignment: Alignment.topCenter,
                        ),
                      ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
