import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/buttons.dart';
import 'package:rainbow/utils/strings.dart';

import '../../../../common/Widget/text_styles.dart';
import '../../../../utils/asset_res.dart';
import '../../../../utils/color_res.dart';

class CancelApprove extends StatelessWidget {
  const CancelApprove({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: Get.width,
          height: Get.height,
          //- 80,
          //padding: const EdgeInsets.only(left: 30,right: 30,top: 40),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                ColorRes.color_50369C,
                ColorRes.color_D18EEE,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            children: [
              appbar(),
              SizedBox(
                height: Get.height * 0.07881,
              ),
              Text(
                Strings.cancelAprove,
                style: gilroySemiBoldTextStyle(fontSize: 24),
              ),
              SizedBox(
                height: Get.height * 0.0283,
              ),
              Container(
                height: Get.width * 0.472,
                width: Get.width * 0.472,
                decoration: BoxDecoration(
                  color: ColorRes.color_F28D8D,
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: ColorRes.color_FFC9C9, width: Get.width * 0.0426),
                ),
                child: Image.asset(
                  AssetRes.block,
                  color: ColorRes.color_FFAA64,
                ),
              ),
              SizedBox(
                height: Get.height * 0.0431,
              ),
              SizedBox(
                width: 210,
                child: Text(
                  Strings.cancelAppoveDes,
                  style: gilroyMediumTextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
              const Spacer(),
              SubmitButton(
                  child: Text(
                Strings.confirm,
                style: gilroyBoldTextStyle(fontSize: 16, color: ColorRes.black),
              )),
              SizedBox(height: Get.height * 0.04926)
            ],
          ),
        ),
      ),
    );
  }
}

Widget appbar() {
  return SizedBox(
    width: Get.width,
    child: Padding(
      padding: const EdgeInsets.only(left: 20, right: 30, top: 15, bottom: 10),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios),
        )
      ]),
    ),
  );
}
