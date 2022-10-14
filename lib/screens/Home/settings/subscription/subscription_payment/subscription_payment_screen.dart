import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/buttons.dart';
import 'package:rainbow/screens/Home/settings/subscription/subscription_payment/subscription_payment_controller.dart';
import 'package:rainbow/utils/strings.dart';

import '../../../../../common/Widget/text_styles.dart';
import '../../../../../utils/asset_res.dart';
import '../../../../../utils/color_res.dart';

class SubscriptionPaymentScreen extends StatelessWidget {
  SubscriptionPaymentScreen({Key? key}) : super(key: key);
  SubscriptionPaymentController controller =
      Get.put(SubscriptionPaymentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: Get.width,
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
              appBar(),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Center(
                        child: SizedBox(
                          width: Get.width * 0.67,
                          child: Text(
                            Strings.iAMPROUDMOM,
                            style: sfProTextReguler(fontSize: 28),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.065,
                      ),
                      const PremiumPackage(),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: Get.width * 0.1),
                        child: Column(
                          children: [
                            CardDeatail(
                              index: 0,
                              controller: controller,
                              name: Strings.cardName01,
                              date: Strings.cardDate01,
                              imageLogo: AssetRes.visalogo,
                            ),
                            SizedBox(
                              height: Get.height * 0.0184,
                            ),
                            CardDeatail(
                              index: 1,
                              controller: controller,
                              name: Strings.cardName02,
                              date: Strings.cardDate01,
                              imageLogo: AssetRes.visalogo,
                            ),
                            SizedBox(
                              height: Get.height * 0.0184,
                            ),
                            CardDeatail(
                              index: 2,
                              controller: controller,
                              name: Strings.cardName03,
                              date: Strings.cardDate01,
                              imageLogo: AssetRes.masterLogo,
                            ),
                            SizedBox(
                              height: Get.height * 0.024630,
                            ),
                            Text(
                              Strings.subscriptionPaymenDes,
                              style: gilroySemiBoldTextStyle(fontSize: 14),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.024630,
                      ),
                      SubmitButton(
                        child: Text(
                          Strings.continue01,
                          style: gilroySemiBoldTextStyle(
                              fontSize: 16,
                              color: ColorRes.black,
                              letterSpacing: 0.5),
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget appBar() {
    return SizedBox(
      width: Get.width,
      child: Column(
        children: [
          SizedBox(
            height: Get.height * 0.03,
          ),
          Row(
            children: [
              SizedBox(
                width: Get.width * 0.05,
              ),
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Image.asset(
                  AssetRes.backIcon,
                  height: 16,
                  width: 16,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: Get.width * 0.3,
              ),
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Text(
                  Strings.subscription,
                  style: gilroyBoldTextStyle(fontSize: 18),
                ),
              ),
              SizedBox(
                width: Get.width * 0.05,
              ),
            ],
          ),
          SizedBox(
            height: Get.height * 0.04,
          ),
        ],
      ),
    );
  }
}

class CardDeatail extends StatelessWidget {
  final String imageLogo;
  final String name;
  final String date;
  final int index;
  final SubscriptionPaymentController controller;

  const CardDeatail({
    Key? key,
    required this.imageLogo,
    required this.name,
    required this.date,
    required this.controller,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SubscriptionPaymentController>(
      id: 'index',
      builder: (controller) => InkWell(
        onTap: () {
          controller.changeIndex(index);
        },
        child: Container(
          width: Get.width,
          height: Get.height * 0.0800,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(12),
              ),
              border: controller.index == index
                  ? Border.all(
                      color: ColorRes.color_50369C,
                      width: 3,
                      style: BorderStyle.solid)
                  : null,
              color: ColorRes.white),
          child: Row(
            children: [
              SizedBox(
                width: Get.width * 0.02133,
              ),
              Image.asset(
                imageLogo,
                width: Get.width * 0.13,
              ),
              SizedBox(
                width: Get.width * 0.03466,
              ),
              Text(
                name,
                style: gilroySemiBoldTextStyle(
                    fontSize: 12,
                    letterSpacing: 0.02,
                    color: ColorRes.color_434343),
              ),
              const Spacer(),
              Text(
                date,
                style: gilroySemiBoldTextStyle(
                    fontSize: 12,
                    letterSpacing: 0.02,
                    color: ColorRes.color_434343),
              ),
              SizedBox(
                width: Get.width * 0.03466,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PremiumPackage extends StatelessWidget {
  const PremiumPackage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: Get.width * 0.05866),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(Get.width * 0.0255466),
                height: Get.width * 0.12,
                width: Get.width * 0.12,
                decoration: const BoxDecoration(
                    color: ColorRes.color_FFEC5C, shape: BoxShape.circle
                    // image: DecorationImage(image: AssetImage(AssetRes.poket),)
                    ),
                child: Image.asset(
                  AssetRes.poket,
                  width: 20,
                  height: 20,
                  fit: BoxFit.fitHeight,
                ),
              ),
              SizedBox(
                width: Get.width * 0.02666,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Strings.premium,
                    style: interTextMedium(fontSize: 29),
                  ),
                  Text(Strings.premium01,
                      style: interTextReguler(fontSize: 14)),
                ],
              )
            ],
          ),
          SizedBox(
            height: Get.height * 0.029556,
          ),
          Text(
            Strings.whatYoullGet,
            style:
                interTextReguler(fontSize: 22, color: ColorRes.color_E9E9E9),
          ),
          SizedBox(
            height: Get.height * 0.029556,
          ),
          Row(
            children: [
              const Icon(
                Icons.check_circle,
                color: ColorRes.color_E4E4EC,
                size: 20,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(Strings.unlimitedAccess,
                  style: interTextReguler(
                      fontSize: 18, color: ColorRes.color_E4E4EC)),
            ],
          ),
          SizedBox(
            height: Get.height * 0.029556,
          ),
          Row(
            children: [
              const Icon(
                Icons.check_circle,
                color: ColorRes.color_E4E4EC,
                size: 20,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(Strings.dateSupport,
                  style: interTextReguler(
                      fontSize: 18, color: ColorRes.color_E4E4EC)),
            ],
          ),
          SizedBox(
            height: Get.height * 0.0344,
          ),
          Padding(
            padding: EdgeInsets.only(right: Get.width * 0.085333),
            child: const DottedLine(dashColor: ColorRes.color_A9A9AA),
          ),
          SizedBox(
            height: Get.height * 0.0123,
          ),
          RichText(
            text: TextSpan(children: [
              TextSpan(
                text: Strings.textSpan01,
                style: interTextMedium(fontSize: 32, color: ColorRes.white),
              ),
              TextSpan(
                text: Strings.textspan02,
                style: interTextReguler(fontSize: 18, color: ColorRes.white),
              ),
            ]),
          ),
          SizedBox(
            height: Get.height * 0.0492,
          )
        ],
      ),
    );
  }
}
