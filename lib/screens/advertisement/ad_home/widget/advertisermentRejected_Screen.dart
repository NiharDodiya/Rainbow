import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/buttons.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/color_res.dart';
import 'package:rainbow/utils/strings.dart';

class AdvertisermentRejectedScreen extends StatelessWidget {
  const AdvertisermentRejectedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              ColorRes.color_50369C,
              ColorRes.color_50369C,
              ColorRes.colorD18EEE,
              ColorRes.colorD18EEE,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              textDetails(),
              // SizedBox(height: Get.height*0.08,),

              imageShow(),
              SizedBox(
                height: Get.height * 0.02,
              ),
              backToHome(),
              SizedBox(
                height: Get.height * 0.1,
              ),
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
              Strings.advertisementRejected,
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Strings.transactionNumber,
                    style: gilroyMediumTextStyle(
                        color: ColorRes.colorC4C4C4, fontSize: 12),
                  ),
                  Text(
                    Strings.transactionHint,
                    style: gilroyMediumTextStyle(fontSize: 14),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Strings.service,
                    style: gilroyMediumTextStyle(
                        color: ColorRes.colorC4C4C4, fontSize: 12),
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
          height: 139,
          width: 282,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: ColorRes.colorB57BDD.withOpacity(0.3),
                spreadRadius: 12,
                blurRadius: 12,
                offset: const Offset(4, 5),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Strings.postRejectedByViolation,
                style: gilroyMediumTextStyle(fontSize: 12),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                Strings.violationOf,
                style: gilroyMediumTextStyle(fontSize: 12),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                Strings.violationOfTermsConditions,
                style: gilroyMediumTextStyle(fontSize: 12),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                Strings.etc,
                style: gilroyMediumTextStyle(fontSize: 12),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget imageShow() {
    return Column(
      children: [
        Image.asset(
          AssetRes.babyCry,
          height: Get.height * 0.377,
          width: 245,
        ),
        const SizedBox(
          height: 25,
        ),
        Text(
          Strings.refundedPayment,
          style: gilroyRegularTextStyle(
              color: ColorRes.colorC4C4C4, fontSize: 12),
        )
      ],
    );
  }

  Widget backToHome() {
    return InkWell(
      onTap: () {
        Get.back();
      },
      child: const SubmitButton(
        text: Strings.backToHome,
      ),
    );
  }
}
