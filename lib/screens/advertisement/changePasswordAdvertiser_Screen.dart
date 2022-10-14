import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/buttons.dart';
import 'package:rainbow/common/Widget/loaders.dart';
import 'package:rainbow/common/Widget/text_field.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/screens/advertisement/ad_support/changePasswordAdvertiser_controller.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/color_res.dart';
import 'package:rainbow/utils/strings.dart';

class AdvertiserChangePasswordScreen extends StatelessWidget {
  const AdvertiserChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GetBuilder<ChangeAdvertiserController>(
      builder: (controller) {
        return Scaffold(
            backgroundColor: Colors.white,
            body: Obx(() {
              return Stack(
                children: [
                  SafeArea(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Container(
                              /*  height: Get.height * 0.96,
                          width: Get.width * 0.946666,*/
                              margin: EdgeInsets.all(Get.width * 0.02669),
                              decoration: BoxDecoration (
                                  gradient: const LinearGradient(
                                    colors: [
                                      ColorRes.color_50369C,
                                      ColorRes.color_D18EEE,
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  ),
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
                                    height: Get.height * 0.07,
                                  ),
                                  Center(
                                    child: Container(
                                      height: 137.39,
                                      width: 137,
                                      decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(AssetRes.lock),
                                              fit: BoxFit.cover)),
                                    ),
                                  ),
                                  SizedBox(
                                    height: Get.height * 0.04,
                                  ),
                                  Center(
                                    child: SizedBox(
                                      height: 39.9,
                                      child: Text(
                                        Strings.newPassword,
                                        style: gilroySemiBoldTextStyle(
                                            fontSize: 30),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: Get.height * 0.01,
                                  ),
                                  Center(
                                    child: SizedBox(
                                      height: 49,
                                      child: Text(
                                        Strings.newPasswordChange,
                                        style: gilroyMediumTextStyle(
                                            color:
                                                ColorRes.white.withOpacity(0.5),
                                            fontSize: 16),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: Get.height * 0.05,
                                  ),
                                  GetBuilder<ChangeAdvertiserController>(
                                      id: "new",
                                      builder: (controller) {
                                        return Center(
                                          child: SizedBox(
                                            width: Get.width * 0.85,
                                            child: AppTextFiled(
                                              controller:
                                                  controller.currentPassword,
                                              title: Strings.currentPassword,
                                              hintText: Strings.passwordExample,
                                              suffix: InkWell(
                                                  onTap: () {
                                                    controller
                                                        .onTapShowPassword();
                                                    controller.update(["new"]);
                                                  },
                                                  child: controller
                                                              .showPassword ==
                                                          true
                                                      ? const Icon(
                                                          Icons
                                                              .remove_red_eye_outlined,
                                                          color: Colors.grey,
                                                        )
                                                      : const Icon(
                                                          Icons
                                                              .remove_red_eye_rounded,
                                                          color: Colors.grey,
                                                        )),
                                              obscure:
                                                  controller.showPassword ==
                                                          true
                                                      ? false
                                                      : true,
                                            ),
                                          ),
                                        );
                                      }),
                                  SizedBox(
                                    height: Get.height * 0.01,
                                  ),
                                  GetBuilder<ChangeAdvertiserController>(
                                      id: "new",
                                      builder: (controller) {
                                        return Center(
                                          child: SizedBox(
                                            width: Get.width * 0.85,
                                            child: AppTextFiled(
                                              controller: controller
                                                  .newPasswordController,
                                              title: Strings.newPassword,
                                              hintText: Strings.passwordExample,
                                              suffix: InkWell(
                                                  onTap: () {
                                                    controller
                                                        .onTapShowNewPassword();
                                                    controller.update(["new"]);
                                                  },
                                                  child: controller
                                                              .showNewPassword ==
                                                          true
                                                      ? const Icon(
                                                          Icons
                                                              .remove_red_eye_outlined,
                                                          color: Colors.grey,
                                                        )
                                                      : const Icon(
                                                          Icons
                                                              .remove_red_eye_rounded,
                                                          color: Colors.grey,
                                                        )),
                                              obscure:
                                                  controller.showNewPassword ==
                                                          true
                                                      ? false
                                                      : true,
                                            ),
                                          ),
                                        );
                                      }),
                                  SizedBox(
                                    height: Get.height * 0.01,
                                  ),
                                  GetBuilder<ChangeAdvertiserController>(
                                      id: "new",
                                      builder: (controller) {
                                        return Center(
                                          child: SizedBox(
                                            width: Get.width * 0.85,
                                            child: AppTextFiled(
                                              controller: controller
                                                  .confirmPasswordController,
                                              title: Strings.confirmPassword,
                                              hintText: Strings.passwordExample,
                                              suffix: InkWell(
                                                  onTap: () {
                                                    controller
                                                        .onTapShowConfirmPassword();
                                                    controller.update(["new"]);
                                                  },
                                                  child: controller
                                                              .showConfirmPassword ==
                                                          true
                                                      ? const Icon(
                                                          Icons
                                                              .remove_red_eye_outlined,
                                                          color: Colors.grey,
                                                        )
                                                      : const Icon(
                                                          Icons
                                                              .remove_red_eye_rounded,
                                                          color: Colors.grey,
                                                        )),
                                              obscure: controller
                                                          .showConfirmPassword ==
                                                      true
                                                  ? false
                                                  : true,
                                            ),
                                          ),
                                        );
                                      }),
                                  SizedBox(
                                    height: Get.height * 0.018,
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: SubmitButton(
                                      onTap: controller.onRegisterTap,
                                      text: Strings.submit,
                                    ),
                                  ),
                                  /*  GestureDetector(
                                    onTap: ,
                                    child: Center(
                                      child: Container(
                                        width: Get.width * 0.8450,
                                        height: Get.height * 0.07624,
                                        decoration: BoxDecoration(
                                            color: ColorRes.color_E7D01F,
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Center(
                                          child: Text(
                                            Strings.submit,
                                            style: gilroyBoldTextStyle(
                                                color: Colors.black,
                                                fontSize: 16),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),*/
                                  SizedBox(height: Get.height * 0.18),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  controller.loader.isTrue
                      ? const FullScreenLoader()
                      : const SizedBox()
                ],
              );
            }));
      },
    );
  }
}
