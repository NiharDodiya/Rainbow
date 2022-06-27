import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/screens/auth/idScanner/idScanner_controller.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/color_res.dart';
import 'package:rainbow/utils/strings.dart';

/*
class IdScannerScreen extends StatefulWidget {
  const IdScannerScreen({Key? key}) : super(key: key);

  @override
  State<IdScannerScreen> createState() => _IdScannerScreenState();
}

class _IdScannerScreenState extends State<IdScannerScreen> {
  File? scannedDocument;
  Future<PermissionStatus>? cameraPermissionFuture;

  @override
  void initState() {
    cameraPermissionFuture = Permission.camera.request();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<IdVerificationController>(id:"flash",builder: (controller) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
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
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Icon(
                        Icons.arrow_back_ios_outlined,
                        size: 16.72,
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
                      Image.asset(
                        AssetRes.referesh,
                        height: 18.67,
                        width: 26.67,
                      ),
                      const Spacer(),
                      Image.asset(
                        AssetRes.send,
                        height: 18.67,
                        width: 26.67,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: Get.height * 0.32266,
              ),
              Expanded(
                child: Container(
                  height: Get.height,
                  width: Get.width,
                  color: Colors.black,
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Column(
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
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: Get.height * 0.05),
                        child: Container(
                          height: 84,
                          width: 84,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(AssetRes.camera),
                                  fit: BoxFit.cover)),
                        ),
                      )
                    ],
                  ),
                ),
              )

              */
/*     Container(height: 262,
                child: FutureBuilder<PermissionStatus>(
                  future: cameraPermissionFuture,
                  builder: (BuildContext context,
                      AsyncSnapshot<PermissionStatus> snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.data!.isGranted) {
                        return Stack(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Expanded(
                                  child: scannedDocument != null
                                      ? Image(
                                    image: FileImage(scannedDocument!),
                                  )
                                      : DocumentScanner(
                                    // documentAnimation: false,
                                    noGrayScale: true,
                                    onDocumentScanned:
                                        (ScannedImage scannedImage) {
                                      setState(() {
                                        scannedDocument = scannedImage
                                            .getScannedDocumentAsFile();
                                        // imageLocation = image;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                            scannedDocument != null
                                ? Positioned(
                              bottom: 20,
                              left: 0,
                              right: 0,
                              child: RaisedButton(
                                  child: const Text("retry"),
                                  onPressed: () {
                                    setState(() {
                                      scannedDocument = null;
                                    });
                                  }),
                            )
                                : const SizedBox(),
                          ],
                        );
                      } else {
                        return const Center(
                          child: Text("camera permission denied"),
                        );
                      }
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              )*/ /*

            ],
          ),
        ),
      );
    },
    );
  }

  Widget corner() {
    return ClipPath(
      clipper: CustomClipPath(),
      child: Container(
        height: 15,
        width: 15,
        color: ColorRes.color_4F359B,
      ),
    );
  }
}





*/

class IdScannerScreen extends StatelessWidget {
  final IdScannerController controller = Get.put(IdScannerController());

  //final CropController cropController = CropController();

  IdScannerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<IdScannerController>(
        builder: (_) {
          return SingleChildScrollView(physics: NeverScrollableScrollPhysics(),
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
                      const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Icon(
                          Icons.arrow_back_ios_outlined,
                          size: 16.72,
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
                        Image.asset(
                          AssetRes.referesh,
                          height: 18.67,
                          width: 26.67,
                        ),
                        const Spacer(),
                        Image.asset(
                          AssetRes.send,
                          height: 18.67,
                          width: 26.67,
                        ),
                      ],
                    ),
                  ),
                ),
                Stack(
                  children:[ SizedBox(
                    child: buildCameraFunction(context, controller),
                  ),
                    Positioned(top: Get.height*0.69,
                        child: Container(height: Get.height * 0.1,color: Colors.black,width: Get.width,))]
                ),
              ],
            ),
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
                height: 0,
                width: Get.width,
                child: controller.image == null
                    ? const SizedBox()
                    : controller.galleryImage
                        ? Container(
                            height: 200,
                            width: Get.width,
                            color: Colors.black,
                            child: Image.file(
                              File(controller.image.toString()),
                              fit: BoxFit.fitHeight,
                            ),
                          )
                        : RepaintBoundary(
                            key: controller.widgetKey,
                            child: Image.file(
                              File(controller.image.toString()),
                              width: Get.width,
                              height: 200,
                              fit: BoxFit.fitWidth,
                              alignment: Alignment.topCenter,
                            ),
                          ),
              ),
           /*   Positioned(top: 200,
                  child: Container(height: 300,width: Get.width,color: Colors.black,)),*/
              Positioned(
                top: Get.height * 0.3,
                child: Container(
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
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(top: Get.height * 0.55),
                  child: Container(
                    height: 84,
                    width: 84,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(AssetRes.camera),
                            fit: BoxFit.cover)),
                  ),
                ),
              ),



            ])
          ],
        ),
      ],
    );
  }
}
