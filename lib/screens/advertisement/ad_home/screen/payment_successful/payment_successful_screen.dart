import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/buttons.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/strings.dart';

import '../../../../../utils/color_res.dart';
import '../../../ad_dashboard/ad_dashboard.dart';

class PaymentSuccessfulScreen extends StatelessWidget {
  const PaymentSuccessfulScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: Get.width,
          height: Get.height,
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: Get.height * 0.165024,
                ),
                Text(
                  Strings.paymentSuccessful,
                  style: gilroySemiBoldTextStyle(fontSize: 24),
                ),
                SizedBox(
                  height: Get.height * 0.02832,
                ),
                Container(
                  height: 177,
                  width: 177,
                  decoration: BoxDecoration(
                      color: ColorRes.color_3835A6,
                      border: Border.all(
                        color: ColorRes.color_514EC6,
                        width: 15,
                      ),
                      shape: BoxShape.circle),
                  child: const Icon(
                    Icons.check_rounded,
                    size: 50,
                  ),
                ),
                // SizedBox(
                //   height: Get.height * 0.04064,
                // ),
                Container(
                  height: 250,
                  width: Get.width,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Stack(
                    children: [
                      SizedBox(
                        height: 250,
                        width: Get.width,
                        child: Image.asset(
                          AssetRes.blurBack,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 60, vertical: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              Strings.playerName,
                              style: poppinsRegularBold(fontSize: 12),
                            ),
                            SizedBox(
                              height: Get.height * 0.007389,
                            ),
                            Text(
                              Strings.miracleKeen,
                              style: poppinsMediumBold(fontSize: 14),
                            ),
                            SizedBox(
                              height: Get.height * 0.0209,
                            ),
                            Text(
                              Strings.transactionNumber,
                              style: poppinsRegularBold(fontSize: 12),
                            ),
                            SizedBox(
                              height: Get.height * 0.007389,
                            ),
                            Text(
                              Strings.traNo,
                              style: poppinsMediumBold(fontSize: 14),
                            ),
                            SizedBox(
                              height: Get.height * 0.0209,
                            ),
                            Text(
                              Strings.service,
                              style: poppinsRegularBold(fontSize: 12),
                            ),
                            SizedBox(
                              height: Get.height * 0.007389,
                            ),
                            Text(
                              Strings.postAds,
                              style: poppinsMediumBold(fontSize: 14),
                            ),
                            SizedBox(
                              height: Get.height * 0.0209,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),

                  // child: BackdropFilter(
                  //     filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20)),
                ),
                SizedBox(height: Get.height * 0.0714),
                SubmitButton(
                  onTap: () {
                    Get.off(() => AdvertisementDashBord());
                  },
                  text: Strings.backToHome,
                ),
                SizedBox(
                  height: Get.height * 0.02832,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// Column(
//       children: [
//         Text("Payment Successful",style: gilroySemiBoldTextStyle(fontSize: 24),)
//       ],
//     );
