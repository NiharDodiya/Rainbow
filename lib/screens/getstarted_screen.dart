import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/screens/idVerification/idverification_screen.dart';
import 'package:rainbow/screens/terms_conditions/terms_conditions_screen.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/color_res.dart';
import 'package:rainbow/utils/strings.dart';

class GetStartedScreens extends StatelessWidget {
  const GetStartedScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.color_4F359B,
      body: SafeArea(
        child: Column(
          children: [
            logoRainbow(context),
          ],
        ),
      ),
    );
  }

  Widget logoRainbow(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Image(
                      image: const AssetImage(
                        AssetRes.sp1,
                      ),
                      height: Get.height * 0.35,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    left: 90,
                  ),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Image(
                      image: AssetImage(
                        AssetRes.sp3,
                      ),
                      height: 12,
                    ),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Image(
                      image: const AssetImage(
                        AssetRes.sp2,
                      ),
                      height: Get.height * 0.27,
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: Get.height * 0.08,
              left: 11,
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: const Icon(
                  Icons.arrow_back_ios_outlined,
                  size: 16.72,
                ),
              ),
            ),
            Positioned(
              top: Get.height * 0.23,
              left: 30,
              child: Container(
                height: Get.height * 0.120,
                width: Get.width * 0.8,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(AssetRes.rainBowLogo),
                        fit: BoxFit.contain)),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 335, top: Get.height * 0.35),
              child: const Align(
                alignment: Alignment.topLeft,
                child: Image(
                  image: AssetImage(
                    AssetRes.greyCircle,
                  ),
                  height: 42,
                  width: 42,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 335, top: Get.height * 0.51),
              child: const Align(
                alignment: Alignment.topRight,
                child: Image(
                  image: AssetImage(
                    AssetRes.whiteCircle,
                  ),
                  height: 59,
                  width: 59,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: Get.height * 0.38),
              child: Center(
                  child: Text(
                Strings.notVerified,
                style: gilroyBoldTextStyle(fontSize: 26),
                textAlign: TextAlign.center,
              )),
            ),
            Padding(
              padding: EdgeInsets.only(top: Get.height * 0.51),
              child: Center(
                  child: Text(
                Strings.completeYourProfile,
                style: gilroyMediumTextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              )),
            ),
            getStarted(context)
          ],
        ),
      ],
    );
  }

  Widget getStarted(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: Get.height * 0.80),
      child: Center(
        child: GestureDetector(
          onTap: () {
            alertBoxPopUp(context);
          },
          child: Container(
            width: Get.width * 0.80,
            height: 60,
            decoration: BoxDecoration(
              color: ColorRes.color_E7D01F,
              borderRadius: BorderRadius.circular(15),
              gradient: const LinearGradient(
                colors: [ColorRes.color_FFEC5C, ColorRes.color_DFC60B],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Center(
                child: Text(
              Strings.getStarted,
              style: gilroyBoldTextStyle(color: Colors.black, fontSize: 16),
            )),
          ),
        ),
      ),
    );
  }

  Future alertBoxPopUp(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
          child: AlertDialog(
            backgroundColor: Colors.white,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15))),
            actions: [
              SizedBox(
                height: Get.height * 0.5,
                width: Get.width,
                child: Column(
                  children: [
                    SizedBox(
                      height: Get.height * 0.008,
                    ),
                    Center(
                      child: Text(
                        Strings.important,
                        style: gilroySemiBoldTextStyle(color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.01,
                    ),
                    SizedBox(
                      height: Get.height * 0.05755,
                      width: Get.width * 0.74,
                      child: Center(
                        child: Text(
                          Strings.smoothProcess,
                          style: gilroyMediumTextStyle(
                              color: ColorRes.color_656F85, fontSize: 14),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.01,
                    ),
                    Center(
                      child: Text(
                        Strings.prepare,
                        style: gilroyMediumTextStyle(
                            color: ColorRes.color_656F85, fontSize: 14),
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.02,
                    ),
                    Center(
                      child: Text(
                        Strings.success,
                        style: gilroySemiBoldTextStyle(color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.02,
                    ),
                    SizedBox(
                      width: Get.width * 0.7893,
                      height: Get.height * 0.05707,
                      child: Center(
                        child: Text(
                          Strings.allow,
                          style: gilroyMediumTextStyle(
                              fontSize: 14, color: ColorRes.color_656F85),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.012,
                    ),
                    SizedBox(
                      width: Get.width * 0.9303,
                      height: Get.height * 0.08561,
                      child: Center(
                          child: Text(
                        Strings.update,
                        style: gilroyMediumTextStyle(
                            fontSize: 14, color: ColorRes.color_656F85),
                        textAlign: TextAlign.center,
                      )),
                    ),
                    SizedBox(
                      height: Get.height * 0.012,
                    ),
                    Spacer(),
                    const Divider(
                      thickness: 1,
                      height: 1,
                      color: ColorRes.color_CACACA,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: GestureDetector(
                            onTap: () {
                              Get.to(() => const IdVerificationScreen());
                            },
                            child: Text(
                              Strings.gotIt,
                              style:
                                  gilroySemiBoldTextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        const Spacer(),
                        Container(
                          height: 30,
                          width: 1,
                          color: ColorRes.color_CACACA,
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: Text
                                (
                                Strings.cancel,
                                style: gilroySemiBoldTextStyle(
                                    color: Colors.black),
                              )),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
