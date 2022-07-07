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

class IdScannerScreen extends StatelessWidget {
  final IdScannerController controller = Get.put(IdScannerController());
  IdVerificationController Idcontroller =Get.put(IdVerificationController());

  IdScannerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() {
        return Stack(
          children: [
            SafeArea(
              child: GetBuilder<IdScannerController>(
                builder: (_) {
                  return SingleChildScrollView(
                    physics: const NeverScrollableScrollPhysics(),
                    child: Column(
                      children: [
                        Container(
                          height: Get.height * 0.1071,
                          width: Get.width,
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [Color(0XFF50379D), Color(0XFFB77DDE)]),
                              color: ColorRes.color_4F359B,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(25),
                                  topLeft: Radius.circular(25))),
                          child: Row(
                            children: [
                              GestureDetector(onTap: () {
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
                        Container(
                          height: 83,
                          color: Colors.black,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    controller.retakePic();
                                  },
                                  child: Image.asset(
                                    AssetRes.referesh,
                                    height: 18.67,
                                    width: 26.67,
                                  ),
                                ),
                                const Spacer(),
                                GestureDetector(
                                  onTap: controller.onImageSubmitFront,
                                  child: Image.asset(
                                    AssetRes.send,
                                    height: 18.67,
                                    width: 26.67,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Stack(children: [
                          SizedBox(
                            child: buildCameraFunction(context, controller),
                          ),
                          Positioned(
                              top: Get.height * 0.3,
                              child: Container(
                                height: Get.height * 0.5,
                                color: Colors.black,
                                width: Get.width,
                                child: Stack(
                                  children: [
                                    Container(
                                      height: Get.height * 0.16,
                                      width: Get.width,
                                      color: ColorRes.color_E2E2E2.withOpacity(0.5),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            Strings.permanentResidentCard,
                                            style: textStyleFont20W700,
                                          ),
                                          SizedBox(
                                            height: Get.height * 0.01,
                                          ),
                                          Text(
                                            Strings.placeYourId,
                                            style: textStyleFont14White,
                                          ),
                                          SizedBox(
                                            height: Get.height * 0.01,
                                          ),
                                          Text(Strings.pleaseMakeSure,
                                              style: textStyleFont14White),
                                          SizedBox(
                                            height: Get.height * 0.01,
                                          ),
                                        ],
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        controller.takePicForFront();
                                      },
                                      child: Center(
                                        child: Padding(
                                          padding:
                                          EdgeInsets.only(top: Get.height * 0.1),
                                          child: Container(
                                            height: 84,
                                            width: 84,
                                            decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                    image:
                                                    AssetImage(AssetRes.camera),
                                                    fit: BoxFit.cover)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ))
                        ]),
                      ],
                    ),
                  );
                },
              ),
            ),
            Idcontroller.loader.isTrue?const SmallLoader():const SizedBox(),
          ],
        );
      },)
    );
  }

  FutureBuilder<void> futureCamera() {
    return FutureBuilder<void>(
      future: controller.initializeControllerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          // If the Future is complete, display the preview.
          return SizedBox(
            /*  height: MediaQuery.of(context).size.height * 0.9,*/
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // SizedBox(
                  //   height: 34 + (Get.height / 36) + (Get.height / 20),
                  // ),
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

  Widget buildCameraFunction(context, IdScannerController controller) {
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        futureCamera(),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(children: [
              const Padding(
                padding: EdgeInsets.only(top: 10, left: 15),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Image(
                      image: AssetImage(
                        AssetRes.topLeft,
                      ),
                      height: 25,
                      width: 25,
                    )),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10, right: 15),
                child: Align(
                    alignment: Alignment.topRight,
                    child: Image(
                      image: AssetImage(AssetRes.topRight),
                      height: 25,
                      width: 25,
                    )),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 15, top: 160),
                child: Align(
                    alignment: Alignment.bottomRight,
                    child: Image(
                      image: AssetImage(AssetRes.bottomRight),
                      height: 25,
                      width: 25,
                    )),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15, top: 160),
                child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Image(
                      image: AssetImage(AssetRes.bottomLeft),
                      height: 25,
                      width: 25,
                    )),
              ),
              SizedBox(
                height: Get.height*0.3,
                width: Get.width,
                child: controller.imageFront == null
                    ? const SizedBox()
                        : RepaintBoundary(
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
              /*   Positioned(top: 200,
                  child: Container(height: 300,width: Get.width,color: Colors.black,)),*/
            ])
          ],
        ),
      ],
    );
  }
}

class IdScannerBackScreen extends StatelessWidget {
  final IdScannerController controller = Get.put(IdScannerController());
  IdVerificationController Idcontroller =Get.put(IdVerificationController());

   IdScannerBackScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GetBuilder<IdScannerController>(
          builder: (_) {
            return SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                children: [
                  Container(
                    height: Get.height * 0.1071,
                    width: Get.width,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Color(0XFF50379D), Color(0XFFB77DDE)]),
                        color: ColorRes.color_4F359B,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(25),
                            topLeft: Radius.circular(25))),
                    child: Row(
                      children: [
                        GestureDetector(onTap: () {
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
                  Container(
                    height: 83,
                    color: Colors.black,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              controller.retakePic();
                            },
                            child: Image.asset(
                              AssetRes.referesh,
                              height: 18.67,
                              width: 26.67,
                            ),
                          ),
                          const Spacer(),
                          GestureDetector(
                           onTap: controller.onImageSubmitBack,
                            child: Image.asset(
                              AssetRes.send,
                              height: 18.67,
                              width: 26.67,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Stack(children: [
                    SizedBox(
                      child: buildCameraFunction(context, controller),
                    ),
                    Positioned(
                        top: Get.height * 0.3,
                        child: Container(
                          height: Get.height * 0.5,
                          color: Colors.black,
                          width: Get.width,
                          child: Stack(
                            children: [
                              Container(
                                height: Get.height * 0.16,
                                width: Get.width,
                                color: ColorRes.color_E2E2E2.withOpacity(0.5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      Strings.permanentResidentCard,
                                      style: textStyleFont20W700,
                                    ),
                                    SizedBox(
                                      height: Get.height * 0.01,
                                    ),
                                    Text(
                                      Strings.placeYourId,
                                      style: textStyleFont14White,
                                    ),
                                    SizedBox(
                                      height: Get.height * 0.01,
                                    ),
                                    Text(Strings.pleaseMakeSure,
                                        style: textStyleFont14White),
                                    SizedBox(
                                      height: Get.height * 0.01,
                                    ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  controller.takePicForBack();
                                },
                                child: Center(
                                  child: Padding(
                                    padding:
                                    EdgeInsets.only(top: Get.height * 0.1),
                                    child: Container(
                                      height: 84,
                                      width: 84,
                                      decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image:
                                              AssetImage(AssetRes.camera),
                                              fit: BoxFit.cover)),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ))
                  ]),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  FutureBuilder<void> futureCamera() {
    return FutureBuilder<void>(
      future: controller.initializeControllerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          // If the Future is complete, display the preview.
          return SizedBox(
            /*  height: MediaQuery.of(context).size.height * 0.9,*/
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // SizedBox(
                  //   height: 34 + (Get.height / 36) + (Get.height / 20),
                  // ),
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

  Widget buildCameraFunction(context, IdScannerController controller) {
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        futureCamera(),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(children: [
              const Padding(
                padding: EdgeInsets.only(top: 10, left: 15),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Image(
                      image: AssetImage(
                        AssetRes.topLeft,
                      ),
                      height: 25,
                      width: 25,
                    )),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10, right: 15),
                child: Align(
                    alignment: Alignment.topRight,
                    child: Image(
                      image: AssetImage(AssetRes.topRight),
                      height: 25,
                      width: 25,
                    )),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 15, top: 160),
                child: Align(
                    alignment: Alignment.bottomRight,
                    child: Image(
                      image: AssetImage(AssetRes.bottomRight),
                      height: 25,
                      width: 25,
                    )),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15, top: 160),
                child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Image(
                      image: AssetImage(AssetRes.bottomLeft),
                      height: 25,
                      width: 25,
                    )),
              ),
              SizedBox(
                  height: Get.height*0.3,
                  width: Get.width,
                  child: controller.imageBack == null
                      ? const SizedBox(): RepaintBoundary(
                            key: controller.widgetKey,
                            child: Image.file(
                              File(controller.imageBack.toString()),
                              width: Get.width,
                              height: 200,
                              fit: BoxFit.fitWidth,
                              alignment: Alignment.topCenter,
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

