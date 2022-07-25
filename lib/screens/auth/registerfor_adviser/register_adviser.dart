import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/app_dropdown.dart';
import 'package:rainbow/common/Widget/buttons.dart';
import 'package:rainbow/common/Widget/loaders.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/screens/auth/registerfor_adviser/adviserForm.dart';
import 'package:rainbow/screens/auth/registerfor_adviser/registeradviser_controller.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/color_res.dart';
import 'package:rainbow/utils/strings.dart';

class AdviserRegisterScreen extends StatelessWidget {
  AdviserRegisterScreen({Key? key}) : super(key: key);
  AdviserRegisterController controller = Get.put(AdviserRegisterController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
          backgroundColor: ColorRes.white,
          body: Obx(() {
            return Stack(
              children: [
                SingleChildScrollView(
                    padding: EdgeInsets.all(Get.width * 0.02667),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: Get.width * 0.0733),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(36),
                        color: ColorRes.color_4F359B,
                      ),
                      child: GetBuilder<AdviserRegisterController>(
                        id: 'register_screen',
                        builder: (controller) {
                          return Stack(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  /// top bar area
                                  SizedBox(height: Get.height * 0.0616),
                                  Image.asset(
                                    AssetRes.rainBowLogo,
                                    height: Get.height * 0.05541,
                                  ),
                                  SizedBox(height: Get.height * 0.0308),
                                  Text(Strings.register,
                                      style: textStyleFont30WhiteExtraBold),
                                  SizedBox(height: Get.height * 0.02094),

                                  /// form
                                  AdviserRegisterForm(),

                                  /// register button
                                  registerButtons(controller),
                                ],
                              ),
                              GetBuilder<AdviserRegisterController>(
                                id: 'register_screen',
                                builder: (controller) {
                                  return !controller.martialStatusDropdown
                                      ? const SizedBox()
                                      : Positioned(
                                          top: Get.height * 1.213,
                                          width: Get.width * 0.8,
                                          child: AppDropdown(
                                            paramList:
                                                controller.martialStatusList,
                                            onTap: controller.onStatusChange,
                                          ),
                                        );
                                },
                              ),
                              // !controller.countryCityDropdown
                              //     ? const SizedBox()
                              //     : Positioned(
                              //   top: Get.height * 1.35,width: Get.width * 0.8,
                              //   child: AppDropDownAdviser(
                              //     paramList: controller.countryCity,
                              //     onTap: controller.onCountryCityChange,
                              //   ),
                              // ),
                            ],
                          );
                        },
                      ),
                    )),
                controller.loader.isTrue
                    ? const FullScreenLoader()
                    : const SizedBox()
              ],
            );
          })),
    );
  }

  Widget registerButtons(AdviserRegisterController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: Get.height * 0.015),
        SubmitButton(
          text: Strings.next,
          onTap: controller.onRegisterTap,
        ),
        SizedBox(height: Get.height * 0.082),
      ],
    );
  }
}
