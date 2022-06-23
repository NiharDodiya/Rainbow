import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/utils/color_res.dart';
import 'package:rainbow/utils/strings.dart';

class SelfieVerificationScreen extends StatelessWidget {
  const SelfieVerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(Get.width * 0.02669),
                decoration: BoxDecoration(
                    color: ColorRes.color_4F359B,
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: Get.height * 0.05,
                      ),
                      const Icon(
                        Icons.arrow_back_ios_outlined,
                        size: 16.72,
                      ),
                      SizedBox(
                        height: Get.height * 0.03,
                      ),
                      Text(Strings.selfie,style: textStyleFont26WhiteBold,),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      Row(children: [
                        Container(
                          height: 29,
                          width: 29,
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
                          height: 29,
                          width: 29,
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
                          height: 29,
                          width: 29,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: ColorRes.color_C4C4C4),
                        ),
                      ]),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      Text(Strings.prepareScan,style: textStyleFont26WhiteBold,),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
