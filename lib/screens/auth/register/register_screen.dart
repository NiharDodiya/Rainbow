import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/buttons.dart';
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
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
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
                                  SizedBox(height: Get.height * 0.01),

                                  /// register button
                                  registerButtons(controller),
                                ],
                              ),
                            ],
                          );
                        },
                      ),
                    )),
                controller.loader.isTrue
                    ? const SmallLoader()
                    : const SizedBox()
              ],
            );
          })),
    );
  }

  Widget registerButtons(RegisterController controller) {
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
        GestureDetector(
          onTap: controller.onLoginTap,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                Strings.alreadyHaveAccount,
                style: textStyleFont14WhiteW500,
                textAlign: TextAlign.center,
              ),
              Text(
                Strings.signIn,
                style: textStyleFont14WhiteBold,
                textAlign: TextAlign.center,
              ),
            ],
          ),
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
