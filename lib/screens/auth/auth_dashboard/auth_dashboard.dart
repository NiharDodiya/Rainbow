import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/screens/auth/login/login_screen.dart';
import 'package:rainbow/screens/auth/register/register_screen.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/color_res.dart';
import 'package:rainbow/utils/strings.dart';

var height = Get.height;
var width = Get.width;

class AuthDashboard extends StatelessWidget {
  const AuthDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Container(
            margin: EdgeInsets.all(Get.width * 0.02669),
            decoration: BoxDecoration(
              color: ColorRes.color_4F359B,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              children: [
                Stack(
                  children: [
                    logoRainbow(),
                    continueWithEmail(),
                    googleFacebook(),
                    alreadyHaveAccount(),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget logoRainbow() {
    return Column(
      children: [
        SizedBox(
          height: height * 0.14,
        ),
        Center(
          child: Container(
            height: Get.height * 0.120,
            width: Get.width * 0.845,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AssetRes.rainBowLogo), fit: BoxFit.fill)),
          ),
        ),
        const SizedBox(
          height: 13,
        ),
        Center(
            child: Text(
          Strings.buildingFamilies,
          style: textStyleFont18White,
        )),
        SizedBox(
          height: height * 0.1,
        ),
      ],
    );
  }

  Widget sizedBox14() {
    return const SizedBox(
      height: 14,
    );
  }

  Widget continueWithEmail() {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: Get.height * 0.39),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                // Get.to(() => LoginScreen());
                Get.to(() => RegisterScreen());
              },
              child: Container(
                height: height * 0.076,
                width: width * 0.85,
                decoration: BoxDecoration(
                    color: ColorRes.color_E7D01F,
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.email_sharp,
                      color: Colors.black,
                      size: 18,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      Strings.continueWithEmail,
                      style: textStyleFont16Black,
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "OR",
              style: textStyleFont14White,
            ),
          ],
        ),
      ),
    );
  }

  Widget googleFacebook() {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: Get.height * 0.51),
        child: Column(
          children: [
            const SizedBox(
              height: 8,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: height * 0.076,
                  width: width * 0.40,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 1.5),
                      color: ColorRes.color_4F359B,
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          height: 14,
                          child: Image.asset(
                            AssetRes.googleIcon,
                          )),
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                          height: 14,
                          width: 42,
                          child: Text(
                            Strings.google,
                            style: textStyleFont12White,
                          ))
                    ],
                  ),
                ),
                const SizedBox(
                  width: 25,
                ),
                Container(
                  height: height * 0.076,
                  width: width * 0.40,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 1.5),
                      color: ColorRes.color_4F359B,
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          height: 14,
                          child: Image.asset(
                            AssetRes.facebook,
                          )),
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                          height: 14,
                          width: 56,
                          child: Text(
                            Strings.facebook,
                            style: textStyleFont12White,
                          ))
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.1,
            ),
          ],
        ),
      ),
    );
  }

  Widget alreadyHaveAccount() {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: Get.height * 0.70),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  Strings.alreadyHaveAccount,
                  style: textStyleFont14White,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => LoginScreen());
                  },
                  child: Text(Strings.signIn,
                      style: textStyleFont14WhiteBold,
                      textAlign: TextAlign.center),
                ),
              ],
            ),
            sizedBox14(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  Strings.signUp,
                  style: textStyleFont14WhiteBold,
                ),
                Text(
                  Strings.forAdvertise,
                  style: textStyleFont14White,
                ),
              ],
            ),
            sizedBox14(),
            SizedBox(
              width: Get.width * 0.67,
              height: Get.height * 0.040,
              child: Center(
                child: SizedBox(
                    height: height * 0.040,
                    width: width * 0.67,
                    child: Text(
                      Strings.termsServices,
                      style: textStyleFont10White,
                      textAlign: TextAlign.center,
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
