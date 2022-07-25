import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/buttons.dart';
import 'package:rainbow/common/Widget/loaders.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/screens/auth/auth_dashboard/auth_dashbord_controller.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/color_res.dart';
import 'package:rainbow/utils/strings.dart';

class AuthDashboard extends StatelessWidget {
  AuthDashboard({Key? key}) : super(key: key);

  final AuthDashBordController controller = Get.put(AuthDashBordController());

  @override
  Widget build(BuildContext context) {
    controller.onInti();
    return GetBuilder<AuthDashBordController>(
      id: "auth",
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Obx(
            () {
              return Stack(
                children: [
                  Center(
                    child: Container(
                      margin: EdgeInsets.all(Get.width * 0.02667),
                      decoration: BoxDecoration(
                        color: ColorRes.color_4F359B,
                        borderRadius: BorderRadius.circular(36),
                      ),
                      child: Column(
                        children: [
                          logoRainbow(),
                          continueWithEmail(),
                          googleFacebook(controller),
                          alreadyHaveAccount(controller),
                        ],
                      ),
                    ),
                  ),
                  controller.loading.isTrue
                      ? const FullScreenLoader()
                      : const SizedBox()
                ],
              );
            },
          ),
        );
      },
    );
  }

  Widget logoRainbow() {
    return Column(
      children: [
        SizedBox(height: Get.height * 0.20),
        Center(
          child: Container(
            height: Get.height * 0.120,
            width: Get.width * 0.845,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AssetRes.rainBowLogo),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        const SizedBox(height: 13),
        Center(
          child: Text(
            Strings.buildingFamilies,
            style: gilroyBoldTextStyle(),
          ),
        ),
      ],
    );
  }

  Widget sizedBox14() {
    return const SizedBox(height: 14);
  }

  Widget continueWithEmail() {
    return Column(
      children: [
        SizedBox(height: Get.height * 0.085),
        SubmitButton(
          onTap: controller.onContinueWithEmailTap,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.email_sharp,
                color: Colors.black,
                size: 18,
              ),
              const SizedBox(width: 8),
              Text(
                Strings.continueWithEmail,
                style: gilroyBoldTextStyle(color: Colors.black, fontSize: 16),
              )
            ],
          ),
        ),
        const SizedBox(height: 8),
        Text(
          "OR",
          style: textStyleFont14White,
        ),
      ],
    );
  }

  Widget googleFacebook(AuthDashBordController controller) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: controller.signWithGoogle,
              child: Container(
                height: Get.height * 0.076,
                width: Get.width * 0.40,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 1.5),
                  color: ColorRes.color_4F359B,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 14,
                      child: Image.asset(
                        AssetRes.googleIcon,
                      ),
                    ),
                    const SizedBox(width: 10),
                    SizedBox(
                      height: 14,
                      child: Text(
                        Strings.google,
                        style: gilroyMediumTextStyle(fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 25),
            GestureDetector(
              onTap: controller.faceBookSignIn,
              child: Container(
                height: Get.height * 0.076,
                width: Get.width * 0.40,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 1.5),
                  color: ColorRes.color_4F359B,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 14,
                      child: Image.asset(
                        AssetRes.facebook,
                      ),
                    ),
                    const SizedBox(width: 10),
                    SizedBox(
                      height: 14,
                      child: Text(
                        Strings.facebook,
                        style: gilroyMediumTextStyle(fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget alreadyHaveAccount(AuthDashBordController controller) {
    return Column(
      children: [
        SizedBox(height: Get.height * 0.0788),
        GestureDetector(
          onTap: controller.onSignInTap,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                Strings.alreadyHaveAccount,
                style: textStyleFont14White,
              ),
              Text(
                Strings.signIn,
                style: gilroyBoldTextStyle(fontSize: 14),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        sizedBox14(),
        InkWell(
          onTap: () => controller.onSignUpTap(),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                Strings.signUp,
                style: gilroyBoldTextStyle(fontSize: 14),
              ),
              Text(
                Strings.forAdvertise,
                style: textStyleFont14White,
              ),
            ],
          ),
        ),
        sizedBox14(),
        SizedBox(
          width: Get.width * 0.67,
          height: Get.height * 0.040,
          child: Center(
            child: SizedBox(
              height: Get.height * 0.040,
              width: Get.width * 0.67,
              child: Text(
                Strings.termsServices,
                style: gilroyMediumTextStyle(fontSize: 10),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
