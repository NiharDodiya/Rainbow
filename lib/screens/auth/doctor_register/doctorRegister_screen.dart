import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:rainbow/common/Widget/app_dropdown.dart';
import 'package:rainbow/common/Widget/buttons.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/screens/auth/doctor_register/doctorRegister_controller.dart';
import 'package:rainbow/screens/auth/doctor_register/doctorRegister_form.dart';
import 'package:rainbow/screens/auth/doctor_register/dropDown_comanyname.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/color_res.dart';
import 'package:rainbow/utils/strings.dart';

import '../../../common/Widget/loaders.dart';

class DoctorRegisterScreen extends StatelessWidget {
  DoctorRegisterScreen({Key? key}) : super(key: key);
  DoctorRegisterController controller = Get.put(DoctorRegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    child: GetBuilder<DoctorRegisterController>(
                      id: 'doctor',
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
                                DoctorRegisterForm(),

                                /// register button
                                registerButtons(controller),
                              ],
                            ),
                            !controller.professions
                                ? const SizedBox()
                                : Positioned(
                                    top: Get.height * 0.35,
                                    child: SizedBox(
                                      height: Get.height * 0.2,
                                      width: Get.width * 0.79,
                                      child: AppDropDownProfessionType(
                                        paramList: controller.professionList,
                                        onTap: controller.onProfessionChange,
                                      ),
                                    ),
                                  ),
                            !controller.countryCityDropdown
                                ? const SizedBox()
                                : Positioned(
                                    top: Get.height * 1.065,
                                    width: Get.width * 0.8,
                                    child: AppDropDownCompanyCountry(
                                      paramList: controller.countryCity,
                                      onTap: controller.onCountryCoCityChange,
                                    ),
                                  ),
                          ],
                        );
                      },
                    ),
                  )),
              controller.loader.isTrue ? const SmallLoader() : const SizedBox()
            ],
          );
        }));
  }

  Widget registerButtons(DoctorRegisterController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: Get.height * 0.015),
        SubmitButton(
          text: Strings.register,
          onTap: controller.onRegisterTap,
        ),
        SizedBox(height: Get.height * 0.04680),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              Strings.alreadyHaveAccount,
              style: textStyleFont14WhiteW500,
              textAlign: TextAlign.center,
            ),
            GestureDetector(
              onTap: () {},
              child: Text(
                Strings.signIn,
                style: textStyleFont14WhiteBold,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        SizedBox(height: Get.height * 0.04557),
        SizedBox(
          height: Get.height * 0.036,
          width: Get.width * 0.69,
          child: Text(
            Strings.termsServices,
            style: gilroyMediumTextStyle(fontSize: 10),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: Get.height * 0.060),
      ],
    );
  }
}
