import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/screens/Home/home_controller.dart';
import 'package:rainbow/screens/dashboard/dashBoard.dart';
import 'package:rainbow/service/pref_services.dart';
import 'package:rainbow/utils/color_res.dart';
import 'package:rainbow/utils/pref_keys.dart';
import 'package:rainbow/utils/strings.dart';

class TermsConditionsScreen extends StatelessWidget {
  final bool? showBackBtn;

  TermsConditionsScreen({Key? key, this.showBackBtn}) : super(key: key);
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Container(
              margin: EdgeInsets.all(Get.width * 0.02669),
              decoration: BoxDecoration(
                  color: ColorRes.color_4F359B,
                  borderRadius: BorderRadius.circular(25)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: Get.height * 0.07,
                  ),
                  showBackBtn == false
                      ? const SizedBox()
                      : GestureDetector(
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
                    height: Get.height * 0.05,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(Strings.termsConditions,
                        style: gilroyBoldTextStyle(fontSize: 30),
                        textAlign: TextAlign.center),
                  ),
                  SizedBox(
                    height: Get.height * 0.042,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: Get.width * 1,
                      height: Get.height * 0.058,
                      child: Text(Strings.privacyPolicy,
                          style: gilroyMediumTextStyle(fontSize: 16),
                          textAlign: TextAlign.center),
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.035,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      height: Get.height * 0.60,
                      width: Get.width * 0.85,
                      child: Text(
                        Strings.agreementTerms,
                        style: gilroyMediumTextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () async {
                        homeController.init();
                        await PrefService.setValue(
                            PrefKeys.showTermsCondition, false);

                        homeController.friendPostListData = [];

                        await PrefService.setValue(PrefKeys.isLogin, true);

                        Get.offAll(() => const Dashboard());
                      },
                      child: Container(
                        width: Get.width * 0.84,
                        height: Get.height * 0.073,
                        decoration: BoxDecoration(
                            color: ColorRes.colorE7D01F,
                            borderRadius: BorderRadius.circular(15)),
                        child: Center(
                            child: Text(
                          Strings.accCon,
                          style: gilroyBoldTextStyle(color: Colors.black),
                        )),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.063,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
