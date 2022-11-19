

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/buttons.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/screens/advertisement/ad_home/ad_home_controller.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/strings.dart';

import '../../../../../utils/color_res.dart';
import '../../../ad_dashboard/ad_dashboard.dart';
import '../create_advertisement/create_advertisement_controller.dart';

class PaymentSuccessfulScreen extends StatelessWidget {
  PaymentSuccessfulScreen({Key? key}) : super(key: key);
  final AdHomeController adHomeController = Get.put(AdHomeController());



  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        Get.to(() => AdvertisementDashBord());
        return true;
      },
      child: Scaffold(
        body: SafeArea(
          child: Container(
            width: Get.width,
            height: Get.height,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  ColorRes.color_50369C,
                  ColorRes.colorD18EEE,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: SingleChildScrollView(
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
                    Strings.paymentSuccessful,
                    style: gilroySemiBoldTextStyle(fontSize: 24),
                  ),
                  const SizedBox(
                    height: 23,
                  ),
                  Container(
                    height: 177,
                    width: 177,
                    decoration: BoxDecoration(
                        color: ColorRes.color_3835A6,
                        border: Border.all(
                          color: ColorRes.color_514EC6,
                          width: 14,
                        ),
                        image: const DecorationImage(
                            image: AssetImage(AssetRes.paymentSuccessfulMark)),
                        shape: BoxShape.circle),
                  ),
                  const SizedBox(
                    height: 23,
                  ),
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
                                adHomeController.viewAdvertiserModel.data?.fullName ?? "",
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
                                "122900083HN",
                                //"${adHomeController.advertisersCreateModel.data?.transactionId ?? ""}",
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
                      Get.to(() => AdvertisementDashBord());
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
      ),
    );
  }
}
// Column(
//       children: [
//         Text("Payment Successful",style: gilroySemiBoldTextStyle(fontSize: 24),)
//       ],
//     );
