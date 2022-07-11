import 'dart:io';
import 'dart:ui' as ui;

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/loaders.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/screens/scanyour_face/scanyourface_controller.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/color_res.dart';
import 'package:rainbow/utils/strings.dart';

class ScanYourFaceScreen extends StatelessWidget {
  ScanYourFaceScreen({Key? key}) : super(key: key);
  ScanYourFaceController controller = Get.put(ScanYourFaceController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ScanYourFaceController>(
      id: "imagePicker",
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Obx(
            () {
              return Stack(
                children: [
                  SafeArea(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Center(
                              child: Container(
                                height: Get.height * 0.975369,
                                width: Get.width * 0.946666,
                                /*  margin: EdgeInsets.all(Get.width * 0.02669),*/
                                decoration: BoxDecoration(
                                    color: ColorRes.color_4F359B,
                                    borderRadius: BorderRadius.circular(25)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: Get.height * 0.03,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Get.back();
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.only(left: 15),
                                        child: Icon(
                                          Icons.arrow_back_ios_outlined,
                                          size: 16.72,

                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: Get.height * 0.03,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 15),
                                      child: Text(
                                        Strings.selfie,
                                        style:
                                            gilroyBoldTextStyle(fontSize: 26),
                                      ),
                                    ),
                                    SizedBox(
                                      height: Get.height * 0.009,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 29,
                                          width: 29,
                                          decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: ColorRes.color_B279DB),
                                        ),
                                        Container(
                                          height: 5,
                                          width: Get.width * 0.25,
                                          color: ColorRes.color_B279DB,
                                        ),
                                        Container(
                                          height: 29,
                                          width: 29,
                                          decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: ColorRes.color_B279DB),
                                        ),
                                        Container(
                                          height: 5,
                                          width: Get.width * 0.25,
                                          color: ColorRes.color_B279DB,
                                        ),
                                        Container(
                                          height: 29,
                                          width: 29,
                                          decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: ColorRes.color_B279DB),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: Get.height * 0.03,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: Get.height * 0.028),
                                      child: SizedBox(
                                        height: Get.height * 0.046,
                                        width: Get.width * 0.836619,
                                        child: Center(
                                          child: Text(
                                            Strings.scanYourFace,
                                            style: gilroyBoldTextStyle(
                                                fontSize: 26),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: Get.height * 0.03,
                                    ),
                                    Center(
                                      child: SizedBox(
                                        height: Get.height * 0.06060,
                                        width: Get.width * 0.901408,
                                        child: Text(
                                          Strings.pleaseBlink,
                                          style: gilroyMediumTextStyle(
                                              fontSize: 16),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    buildCameraFunction(context, controller),
                                    SizedBox(
                                      height: Get.height * 0.05,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        controller.takePicForFront();
                                        /*    controller.onRegisterTap();*/
                                      },
                                      child: Center(
                                        child: Container(
                                          width: Get.width * 0.84788,
                                          height: 60,
                                          decoration: BoxDecoration(
                                            color: ColorRes.color_E7D01F,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            gradient: const LinearGradient(
                                              colors: [
                                                ColorRes.color_FFEC5C,
                                                ColorRes.color_DFC60B
                                              ],
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              Strings.next,
                                              style: gilroyBoldTextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  controller.loader.isTrue
                      ? const SmallLoader()
                      : const SizedBox(),
                ],
              );
            },
          ),
        );
      },
    );
  }

  FutureBuilder<void> futureCamera() {
    return FutureBuilder<void>(
      future: controller.initializeControllerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          // If the Future is complete, display the preview.
          return SizedBox(
            height: Get.height * 0.42,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CameraPreview(controller.controller),
                ],
              ),
            ),
          );
        } else {
          // Otherwise, display a loading indicator.
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget buildCameraFunction(context, ScanYourFaceController controller) {
    return Stack(
      /* alignment: Alignment.topLeft,*/
      children: [
        futureCamera(),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(children: [
              Container(
                height: 20,
                color: ColorRes.color_4F359B,
              ),
              Center(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        height: Get.height * 0.43,
                        color: ColorRes.color_4F359B,
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.43,
                      width: Get.height * 0.43,
                      child: Image.asset(
                        AssetRes.scanYourFace,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        height: Get.height * 0.43,
                        color: ColorRes.color_4F359B,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: Get.width * 0.129,
                left: Get.height * 0.078,
                child: Center(
                  child: SizedBox(
                    height: 228,
                    width: 228,
                    child: controller.imageFront == null
                        ? const SizedBox()
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(300),
                            child: RepaintBoundary(
                              key: controller.widgetKey,
                              child: Image.file(
                                File(controller.imageFront.toString()),
                                width: Get.width,
                                height: 200,
                                fit: BoxFit.fitWidth,
                                alignment: Alignment.topCenter,
                              ),
                            ),
                          ),
                  ),
                ),
              ),
              /*   Positioned(top: 200,
                  child: Container(height: 300,width: Get.width,color: Colors.black,)),*/
            ])
          ],
        ),
      ],
    );
  }
}
