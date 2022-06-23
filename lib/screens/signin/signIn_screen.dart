import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/color_res.dart';
import 'package:rainbow/utils/strings.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = Get.height;
    var width = Get.width;
    return Scaffold(
      backgroundColor: ColorRes.color_4F359B,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: height * 0.2,
            ),
            Center(
              child: Container(
                height: Get.height * 0.120,
                width: Get.width * 0.8,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(AssetRes.rainBowLogo))),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
                child: Text(
              Strings.buildingFamilies,
              style: textStyleFont18White,
            )),
            const SizedBox(
              height: 25,
            ),
            Container(
              height: height * 0.076,
              width: width * 0.85,
              decoration: BoxDecoration(
                  color: Colors.yellow,
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
            const SizedBox(
              height: 8,
            ),
            Text(
              "OR",
              style: textStyleFont14White,
            ),
            Row(
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
                          width: 56,
                          child: Text(
                            Strings.facebook,
                            style: textStyleFont12White,
                          ))
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
