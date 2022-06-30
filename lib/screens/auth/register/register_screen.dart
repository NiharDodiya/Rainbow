import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/app_dropdown.dart';
import 'package:rainbow/common/Widget/loaders.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/screens/auth/register/register_controller.dart';
import 'package:rainbow/screens/auth/register/widget/register_form.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/color_res.dart';
import 'package:rainbow/utils/strings.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  final RegisterController controller = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.white,
      body: Obx(() {
        if(controller.loader.isTrue)
          {
            return const SmallLoader();
          }
        return SafeArea(
          child: SingleChildScrollView(
              padding: EdgeInsets.all(Get.width * 0.02667),
              child:Container(
                padding: EdgeInsets.symmetric(horizontal: Get.width * 0.0733),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(36),
                  color: ColorRes.color_4F359B,
                ),
                child: GetBuilder<RegisterController>(
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
                            RegisterForm(),

                            /// register button
                            registerButtons(controller),
                          ],
                        ),
                        GetBuilder<RegisterController>(id: 'register_screen' ,builder: (controller) {
                          return     !controller.martialStatusDropdown
                              ? const SizedBox()
                              : Positioned(
                            top: Get.height * 1.213,width: Get.width * 0.8,
                            child: AppDropdown(
                              paramList: controller.martialStatusList,
                              onTap: controller.onStatusChange,
                            ),
                          );
                        },),
                        !controller.ethnicityDropdown
                            ? const SizedBox()
                            : Positioned(
                          top: Get.height * 1.34,width: Get.width * 0.8,
                          child: AppDropDownEthnicity(
                            paramList: controller.ethnicityList,
                            onTap: controller.onEthnicityChange,
                          ),
                        ),
                        !controller.kidsDropdown
                            ? const SizedBox()
                            : Positioned(
                          top: Get.height * 1.6,width: Get.width * 0.8,
                          child: AppDropDownNoOfKids(
                            paramList: controller.noOfKids,
                            onTap: controller.onKidsChange,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              )
          ),
        );
      })
    );
  }

  Widget registerButtons(RegisterController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: Get.height * 0.02),
        GestureDetector(
          onTap: () {
            controller.onRegisterTap();
          },
          child: Container(
            height: Get.height * 0.076,
            width: Get.width * 0.85,
            decoration: BoxDecoration(
                color: ColorRes.color_E7D01F,
                borderRadius: BorderRadius.circular(15)),
            child: Center(
              child: Text(
                Strings.register,
                style: textStyleFont16Black,
              ),
            ),
          ),
        ),
        SizedBox(height: Get.height * 0.055),
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
              onTap: controller.onLoginTap,
              child: Text(
                Strings.signIn,
                style: textStyleFont14WhiteBold,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        SizedBox(height: Get.height * 0.06),
        SizedBox(
          height: Get.height * 0.036,
          width: Get.width * 0.69,
          child: Text(
            Strings.termsServices,
            style: textStyleFont10White,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: Get.height * 0.060),
      ],
    );
  }
}
