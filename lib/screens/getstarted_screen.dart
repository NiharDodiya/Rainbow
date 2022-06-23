import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/screens/auth/auth_dashboard/auth_dashboard.dart';
import 'package:rainbow/screens/auth/signin/signin_screen.dart';
import 'package:rainbow/screens/idVerification/idverification_screen.dart';
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
                  padding: EdgeInsets.only(left: 90,),
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
              top: Get.height * 0.23,
              left: 30,
              child: Container(
                height: Get.height * 0.120,
                width: Get.width * 0.8,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(AssetRes.rainBowLogo))),
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
              padding: EdgeInsets.only(top: height * 0.38),
              child: Center(
                  child: Text(
                Strings.notVerified,
                style: textStyleFont26WhiteBold,
                textAlign: TextAlign.center,
              )),
            ),
            Padding(
              padding: EdgeInsets.only(top: height * 0.51),
              child: Center(
                  child: Text(
                Strings.completeYourProfile,
                style: textStyleFont16WhitLight,
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
            width: width * 0.80,
            height: height * 0.073,
            decoration: BoxDecoration(
                color: ColorRes.color_E7D01F,
                borderRadius: BorderRadius.circular(15)),
            child: Center(
                child: Text(
              Strings.getStarted,
              style: textStyleFont16Black,
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
              Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                      child: Text(
                    Strings.important,
                    style: textStyleFont18Black,
                  )),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: height * 0.057,
                    width: width * 0.73,
                    child: Center(
                        child: Text(
                      Strings.smoothProcess,
                      style: textStyleFont16Alert,
                      textAlign: TextAlign.center,
                    )),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Center(
                      child: Text(
                    Strings.prepare,
                    style: textStyleFont14Alert,
                  )),
                  const SizedBox(
                    height: 18,
                  ),
                  Center(
                    child: Text(
                      Strings.success,
                      style: textStyleFont18Black,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  SizedBox(
                    width: width * 0.78,
                    height: height * 0.057,
                    child: Center(
                        child: Text(
                      Strings.allow,
                      style: textStyleFont14Alert,
                      textAlign: TextAlign.center,
                    )),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  SizedBox(
                    width: width * 0.78,
                    height: height * 0.085,
                    child: Center(
                        child: Text(
                      Strings.update,
                      style: textStyleFont14Alert,
                      textAlign: TextAlign.center,
                    )),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
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
                        child: GestureDetector(onTap: () {
                          Get.to(const IdVerificationScreen());
                        },
                          child: Text(
                            Strings.gotIt,
                            style: textStyleFont18Black,
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
                            child: Text(
                              Strings.cancel,
                              style: textStyleFont18Black,
                            )),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
