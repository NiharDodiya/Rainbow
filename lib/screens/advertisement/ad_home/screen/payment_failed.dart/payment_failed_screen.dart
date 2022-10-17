import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/screens/advertisement/ad_home/ad_home_controller.dart';
import 'package:rainbow/utils/strings.dart';

import '../../../../../common/Widget/buttons.dart';
import '../../../../../common/Widget/text_styles.dart';
import '../../../../../utils/asset_res.dart';
import '../../../../../utils/color_res.dart';
import '../../../ad_dashboard/ad_dashboard.dart';

class PaymentFailedScreen extends StatelessWidget {
  PaymentFailedScreen({Key? key}) : super(key: key);
  final AdHomeController adHomeController = Get.put(AdHomeController());

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
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      onPressed: () {
                        Get.to(AdvertisementDashBord());
                      },
                      icon: const Icon(Icons.arrow_back_ios),
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.135024,
                ),
                Text(
                  Strings.paymentFailed,
                  style: gilroySemiBoldTextStyle(fontSize: 24),
                ),
                SizedBox(
                  height: Get.height * 0.02832,
                ),
                Container(
                  padding: const EdgeInsets.all(30),
                  height: 177,
                  width: 177,
                  decoration: BoxDecoration(
                      color: ColorRes.color_F28D8D,
                      border: Border.all(
                        color: ColorRes.color_FFC9C9,
                        width: 14,
                      ),
                      shape: BoxShape.circle),
                  child: Container(
                    height: 10,
                    width: 10,
                    decoration: const BoxDecoration(
                      color: ColorRes.color_A52C2C,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.close_rounded,
                      size: 50,
                    ),
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
                              "${adHomeController.viewAdvertiserModel.data?.fullName ?? ""}",
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
                  text: Strings.backToHome,
                  onTap: () {
                    Get.off(() => AdvertisementDashBord());
                  },
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
