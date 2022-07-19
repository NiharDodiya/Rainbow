import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/buttons.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/color_res.dart';
import 'package:rainbow/utils/strings.dart';

class AdvertisementApprovedScreen extends StatelessWidget {
  const AdvertisementApprovedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: 680,
          width: Get.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                ColorRes.color_50369C,
                ColorRes.color_50369C,
                ColorRes.color_D18EEE,
                ColorRes.color_D18EEE,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            children: [
              textDetails(),
              SizedBox(
                height: Get.height * 0.08,
              ),
              imageShow(),
              SizedBox(
                height: Get.height * 0.1,
              ),
              backToHome()
            ],
          ),
        ),
      ),
    );
  }

  Widget textDetails() {
    return Column(
      children: [
        SizedBox(
          height: Get.height * 0.1219,
        ),
        SizedBox(
            height: 64,
            width: 264,
            child: Text(
              Strings.advertisementApproved,
              style: gilroyBoldTextStyle(
                fontSize: 24,
              ),
              textAlign: TextAlign.center,
            )),
        const SizedBox(
          height: 22,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 43, right: 41),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Strings.transactionNumber,
                    style: gilroyMediumTextStyle(
                        color: ColorRes.color_C4C4C4, fontSize: 12),
                  ),
                  Text(
                    Strings.transactionHint,
                    style: gilroyMediumTextStyle(fontSize: 14),
                  ),
                ],
              ),
              SizedBox(
                width: Get.width * 0.256,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Strings.service,
                    style: gilroyMediumTextStyle(
                        color: ColorRes.color_C4C4C4, fontSize: 12),
                  ),
                  Text(
                    Strings.postAds,
                    style: gilroyMediumTextStyle(fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        Container(
          height: 25,
          width: 282,
          decoration: BoxDecoration(
            /*      gradient: const LinearGradient(
                  colors: [
                    // ColorRes.color_50369C,
                    ColorRes.color_50369C,
                    ColorRes.color_B57BDD,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),*/
            boxShadow: [
              BoxShadow(
                color: ColorRes.color_B57BDD.withOpacity(0.3),
                spreadRadius: 12,
                blurRadius: 12,
                offset: const Offset(4, 5),
              ),
            ],
          ),
          child: Text(
            Strings.approvedByRainbowAdmin,
            style: gilroyMediumTextStyle(fontSize: 12),
          ),
        )
      ],
    );
  }

  Widget imageShow() {
    return Image.asset(
      AssetRes.baby,
      height: Get.height * 0.377,
      width: 245,
    );
  }

  Widget backToHome() {
    return SubmitButton(
      text: Strings.backToHome,
    );
  }
}
