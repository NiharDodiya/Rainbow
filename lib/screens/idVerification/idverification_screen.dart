import 'dart:io';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/app_dropdown.dart';
import 'package:rainbow/common/Widget/loaders.dart';
import 'package:rainbow/common/Widget/text_field.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/screens/auth/idScanner/idScanner_controller.dart';
import 'package:rainbow/screens/auth/idScanner/idscaneer_screen.dart';
import 'package:rainbow/screens/idVerification/idverification_controller.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/color_res.dart';
import 'package:rainbow/utils/strings.dart';

class IdVerificationScreen extends StatelessWidget {
  IdVerificationScreen({Key? key}) : super(key: key);

  final IdScannerController idController = Get.put(IdScannerController());

  @override
  Widget build(BuildContext context) {
    IdVerificationController controller = Get.put(IdVerificationController());
    return Scaffold(
        backgroundColor: Colors.white,
        body: Obx(() {
          return Stack(
            children: [
              SafeArea(
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
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(height: Get.height * 0.05),
                                  GestureDetector(
                                    onTap: Get.back,
                                    child: const Icon(
                                      Icons.arrow_back_ios_outlined,
                                      size: 16.72,
                                    ),
                                  ),
                                  SizedBox(height: Get.height * 0.05),
                                  Text(
                                    Strings.idVerification,
                                    style: gilroyBoldTextStyle(fontSize: 26),
                                  ),
                                  SizedBox(height: Get.height * 0.01),
                                  Row(
                                    children: [
                                      Container(
                                        height: 29,
                                        width: 29,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: ColorRes.color_B279DB,
                                        ),
                                      ),
                                      Container(
                                        height: 5,
                                        width: Get.width * 0.3,
                                        color: controller.imageFront != null
                                            ? ColorRes.color_B279DB
                                            : ColorRes.color_C4C4C4,
                                      ),
                                      Container(
                                        height: 29,
                                        width: 29,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: ColorRes.color_C4C4C4,
                                        ),
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
                                          color: ColorRes.color_C4C4C4,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: Get.height * 0.02),
                                  /*    SizedBox(
                                  width: Get.width * 0.85,
                                  child: GestureDetector(
                                    onTap: () {
                                      controller.idTypeDropDown();
                                    },
                                    child: AppTextFiled(
                                      controller: controller.idType,
                                      title: Strings.idType,
                                      hintText: Strings.idType,
                                      fontsize: 14,
                                      suffix: Image.asset(AssetRes.arrowDown,
                                          height: 17),
                                      enable: false,
                                    ),
                                  ),
                                ),*/
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        Strings.idType,
                                        style: gilroySemiBoldTextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      GetBuilder<IdVerificationController>(
                                        id: "IdVerification_screen",
                                        builder: (controller) {
                                          return DropdownButtonHideUnderline(
                                            child: DropdownButton2(
                                              isExpanded: true,
                                              hint: Row(
                                                children: [
                                                  const SizedBox(width: 4),
                                                  Expanded(
                                                    child: Text(
                                                      Strings.permanentResident,
                                                      style:
                                                          gilroyMediumTextStyle(
                                                        fontSize: 16,
                                                        color: ColorRes.black
                                                            .withOpacity(0.3),
                                                      ),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              items: controller.idTypeList
                                                  .map((item) =>
                                                      DropdownMenuItem<String>(
                                                        value: item,
                                                        child: Text(
                                                          item,
                                                          style:
                                                              gilroyMediumTextStyle(
                                                                  fontSize: 16,
                                                                  color: ColorRes
                                                                      .black),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ))
                                                  .toList(),
                                              value: controller.selectedId,
                                              onChanged: (value) {
                                                controller.selectedId =
                                                    value.toString();
                                                controller.idType.text =
                                                    value.toString();
                                                controller.update(
                                                    ["IdVerification_screen"]);
                                              },
                                              icon: Image.asset(
                                                  AssetRes.arrowDown,
                                                  height: 17),
                                              iconSize: 14,
                                              iconEnabledColor: Colors.grey,
                                              iconDisabledColor: Colors.grey,
                                              buttonHeight: 60,
                                              buttonWidth: Get.width * 0.85,
                                              buttonPadding:
                                                  const EdgeInsets.only(
                                                      left: 14, right: 23),
                                              buttonDecoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: Colors.white,
                                              ),
                                              buttonElevation: 2,
                                              itemHeight: 40,
                                              itemPadding:
                                                  const EdgeInsets.only(
                                                      left: 20, right: 14),
                                              dropdownMaxHeight:
                                                  Get.height * 0.3,
                                              /* height: Get.height*0.19,*/
                                              dropdownWidth: Get.width * 0.85,
                                              dropdownPadding: null,
                                              dropdownDecoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(14),
                                                color: Colors.white,
                                              ),
                                              dropdownElevation: 8,
                                              scrollbarRadius:
                                                  const Radius.circular(40),
                                              scrollbarThickness: 6,
                                              scrollbarAlwaysShow: true,
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                  !controller.idTypeDrop
                                      ? const SizedBox()
                                      : AppDroDownIdType(
                                          paramList: controller.idTypeList,
                                          onTap: controller.idTypeVerification,
                                        ),
                                  SizedBox(height: Get.height * 0.02),
                                  SizedBox(
                                    width: Get.width * 0.85,
                                    child: AppTextFiled(
                                      controller: controller.idNO,
                                      title: Strings.idNo,
                                      hintText: Strings.idNoT,
                                      fontsize: 14,
                                      enable: true,
                                    ),
                                  ),
                                  SizedBox(height: Get.height * 0.038),
                                  Text(
                                    Strings.uploadFrontPicture,
                                    style: gilroyBoldTextStyle(fontSize: 14),
                                  ),
                                  SizedBox(height: Get.height * 0.02),
                                  GestureDetector(
                                    onTap: () {
                                      FocusScope.of(context).unfocus();
                                      idController.imageFront = null;
                                      Get.to(
                                        () => IdScannerBackScreen(
                                          isFront: true,
                                          onSend:
                                              idController.onImageSubmitFront,
                                          onTack: idController.takePicForFront,
                                        ),
                                      );
                                    },
                                    child: controller.imageFront == null
                                        ? Container(
                                            height: 217,
                                            width: Get.width * 0.85,
                                            decoration: BoxDecoration(
                                              color: ColorRes.color_F7F9FF,
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            ),
                                            child: Stack(
                                              children: [
                                                Center(
                                                  child: SizedBox(
                                                    height: 120.77,
                                                    width: Get.width * 0.47,
                                                    child: Image.asset(
                                                      AssetRes.frontPicture,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        : Container(
                                            height: 217,
                                            width: Get.width * 0.85,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: FileImage(
                                                  File(controller.imageFront
                                                      .toString()),
                                                ),
                                                fit: BoxFit.cover,
                                              ),
                                              color: ColorRes.color_F7F9FF,
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            ),
                                          ),
                                  ),
                                  SizedBox(height: Get.height * 0.038),
                                  Text(
                                    Strings.uploadBackPicture,
                                    style: gilroyBoldTextStyle(fontSize: 14),
                                  ),
                                  SizedBox(height: Get.height * 0.02),
                                  GestureDetector(
                                    onTap: () {
                                      FocusScope.of(context).unfocus();
                                      idController.imageBack = null;
                                      Get.to(() => IdScannerBackScreen(
                                            isFront: false,
                                            onSend:
                                                idController.onImageSubmitBack,
                                            onTack: idController.takePicForBack,
                                          ));
                                    },
                                    child: controller.imageBack == null
                                        ? Container(
                                            height: 217,
                                            width: Get.width * 0.85,
                                            decoration: BoxDecoration(
                                              color: ColorRes.color_F7F9FF,
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            ),
                                            child: Stack(
                                              children: [
                                                Center(
                                                  child: SizedBox(
                                                    height: 120.77,
                                                    width: Get.width * 0.47,
                                                    child: Image.asset(
                                                      AssetRes.backPicture,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        : Container(
                                            height: 217,
                                            width: Get.width * 0.85,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: FileImage(
                                                  File(controller.imageBack
                                                      .toString()),
                                                ),
                                                fit: BoxFit.cover,
                                              ),
                                              color: ColorRes.color_F7F9FF,
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            ),
                                          ),
                                  ),
                                  SizedBox(height: Get.height * 0.046),
                                  GestureDetector(
                                    onTap: controller.onRegisterTap,
                                    child: Container(
                                      width: Get.width * 0.84,
                                      height: Get.height * 0.073,
                                      decoration: BoxDecoration(
                                        color: ColorRes.color_E7D01F,
                                        borderRadius: BorderRadius.circular(15),
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
              ),
              controller.loader.isTrue
                  ? const FullScreenLoader()
                  : const SizedBox()
            ],
          );
        }));
  }
}
