import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/app_dropdown.dart';
import 'package:rainbow/common/Widget/text_field.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/screens/auth/idScanner/idscaneer_screen.dart';
import 'package:rainbow/screens/idVerification/idverification_controller.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/color_res.dart';
import 'package:rainbow/utils/strings.dart';

class IdVerificationScreen extends StatelessWidget {
  const IdVerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    IdVerificationController controller = Get.put(IdVerificationController());
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: GetBuilder<IdVerificationController>(
            id: 'IdVerification_screen',
            builder: (controller) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(Get.width * 0.02669),
                      decoration: BoxDecoration(
                          color: ColorRes.color_4F359B,
                          borderRadius: BorderRadius.circular(25)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: Get.height * 0.05,
                            ),
                            GestureDetector(onTap: () {
                              Get.back();
                            },
                              child: const Icon(
                                Icons.arrow_back_ios_outlined,
                                size: 16.72,
                              ),
                            ),
                            SizedBox(
                              height: Get.height * 0.05,
                            ),
                            Text(
                              Strings.idVerification,
                              style: textStyleFont26WhiteBold,
                            ),
                            SizedBox(
                              height: Get.height * 0.01,
                            ),
                            Row(children: [
                              Container(
                                height: 29,
                                width: 29,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: ColorRes.color_B279DB),
                              ),
                              Container(
                                height: 5,
                                width: Get.width * 0.3,
                                color: ColorRes.color_C4C4C4,
                              ),
                              Container(
                                height: 29,
                                width: 29,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: ColorRes.color_C4C4C4),
                              ),
                              Container(
                                height: 5,
                                width: Get.width * 0.3,
                                color: ColorRes.color_C4C4C4,
                              ),
                              Container(
                                height: 29,
                                width: 29,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: ColorRes.color_C4C4C4),
                              ),
                            ]),
                            SizedBox(
                              height: Get.height * 0.02,
                            ),
                            SizedBox(
                              width: Get.width * 0.85,
                              child: GestureDetector(
                                onTap: () {
                                  controller.idTypeDropDown();
                                },
                                child: AppTextFiled(
                                  controller: controller.idType,
                                  title: Strings.idType,
                                  hintText: Strings.idType,
                                  suffix: Image.asset(AssetRes.arrowDown,
                                      height: 17),
                                  enable: false,
                                ),
                              ),
                            ),
                            !controller.idTypeDrop
                                ? const SizedBox()
                                : AppDroDownIdType(
                                    paramList: controller.ethnicityList,
                                    onTap: controller.idTypeVerification,
                                  ),
                            SizedBox(
                              height: Get.height * 0.02,
                            ),
                            SizedBox(
                              width: Get.width * 0.85,
                              child: AppTextFiled(
                                controller: controller.idNO,
                                title: Strings.idNo,
                                hintText: Strings.idNoT,
                                enable: true,
                              ),
                            ),
                            SizedBox(
                              height: Get.height * 0.038,
                            ),
                            Text(
                              Strings.uploadFrontPicture,
                              style: textStyleFont14WhiteBold,
                            ),
                            SizedBox(
                              height: Get.height * 0.02,
                            ),
                            GestureDetector(onTap: () {
                              FocusScope.of(context).unfocus();
                                   Get.to(()=>IdScannerScreen());
                            },
                              child:controller.imageFront==null? Container(
                                height: 217,
                                width: Get.width * 0.85,
                                decoration: BoxDecoration(
                                    color: ColorRes.color_F7F9FF,
                                    borderRadius: BorderRadius.circular(30)),
                                child: Stack(
                                  children: [
                                    Center(
                                      child: SizedBox(
                                          height: 120.77,
                                          width: Get.width * 0.47,
                                          child:
                                              Image.asset(AssetRes.frontPicture)),
                                    )
                                  ],
                                ),
                              ): Container(
                                height: 217,
                                width: Get.width * 0.85,
                                decoration: BoxDecoration(
                                  image: DecorationImage(image:  FileImage(
                                    File(controller.imageFront.toString()),
                                  ),fit: BoxFit.cover),
                                    color: ColorRes.color_F7F9FF,
                                    borderRadius: BorderRadius.circular(30)),
                              ),
                            ),
                            SizedBox(
                              height: Get.height * 0.038,
                            ),
                            Text(
                              Strings.uploadBackPicture,
                              style: textStyleFont14WhiteBold,
                            ),
                            SizedBox(
                              height: Get.height * 0.02,
                            ),
                            GestureDetector(onTap: () {
                              Get.to(()=>IdScannerBackScreen());
                            },
                              child: controller.imageBack==null? Container(
                                height: 217,
                                width: Get.width * 0.85,
                                decoration: BoxDecoration(
                                    color: ColorRes.color_F7F9FF,
                                    borderRadius: BorderRadius.circular(30)),
                                child: Stack(
                                  children: [
                                    Center(
                                      child: SizedBox(
                                          height: 120.77,
                                          width: Get.width * 0.47,
                                          child:
                                          Image.asset(AssetRes.backPicture)),
                                    )
                                  ],
                                ),
                              ): Container(
                                height: 217,
                                width: Get.width * 0.85,
                                decoration: BoxDecoration(
                                    image: DecorationImage(image:FileImage(
                                      File(controller.imageBack.toString()),
                                    ),fit: BoxFit.cover),
                                    color: ColorRes.color_F7F9FF,
                                    borderRadius: BorderRadius.circular(30)),
                              ),
                            ),
                            SizedBox(
                              height: Get.height * 0.046,
                            ),
                            GestureDetector(
                              onTap: () {
                                controller.onRegisterTap();
                              },
                              child: Container(
                                width: Get.width * 0.84,
                                height: Get.height * 0.073,
                                decoration: BoxDecoration(
                                    color: ColorRes.color_E7D01F,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Center(
                                    child: Text(
                                  Strings.next,
                                  style: textStyleFont16Black,
                                )),
                              ),
                            ),
                            SizedBox(height: Get.height * 0.033),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ));
  }
}
