import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/utils/color_res.dart';
import 'package:rainbow/utils/strings.dart';

class SelfieVerificationScreen extends StatelessWidget {
  const SelfieVerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(Get.width * 0.02669),
                decoration: BoxDecoration(
                    color: ColorRes.color_4F359B,
                    borderRadius: BorderRadius.circular(25)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: Get.height * 0.05,
                    ),
                    GestureDetector(
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
                      height: Get.height * 0.03,
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          Strings.selfie,
                          style: textStyleFont26WhiteBold,
                        )),
                    SizedBox(
                      height: Get.height * 0.008,
                    ),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 25,
                            width: 25,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: ColorRes.color_B279DB),
                          ),
                          Container(
                            height: 5,
                            width: Get.width * 0.3,
                            color: ColorRes.color_C4C4C4,
                          ),
                          Container(
                            height: 25,
                            width: 25,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: ColorRes.color_C4C4C4),
                          ),
                          Container(
                            height: 5,
                            width: Get.width * 0.3,
                            color: ColorRes.color_C4C4C4,
                          ),
                          Container(
                            height: 25,
                            width: 25,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: ColorRes.color_C4C4C4),
                          ),
                        ]),
                    SizedBox(
                      height: Get.height * 0.03,
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          Strings.prepareScan,
                          style: textStyleFont26WhiteBold,
                        )),
                    SizedBox(
                      height: Get.height * 0.035,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: SizedBox(
                          height: Get.height * 0.060,
                          width: Get.width * 0.9014,
                          child: Text(
                            Strings.makeSure,
                            style: textStyleFont16Whit,
                            textAlign: TextAlign.center,
                          )),
                    ),
                    SizedBox(
                      height: Get.height * 0.02,
                    ),
                    Center(
                      child: Container(
                        height: 225,
                        width: 225,
                        decoration: const BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.05,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Center(
                        child: Container(
                          width: Get.width * 0.84,
                          height: Get.height * 0.073,
                          decoration: BoxDecoration(
                              color: ColorRes.color_E7D01F,
                              borderRadius: BorderRadius.circular(15)),
                          child: Center(
                              child: Text(
                            Strings.next,
                            style: textStyleFont16Black,
                          )),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.05,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
