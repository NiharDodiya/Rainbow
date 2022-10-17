import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/buttons.dart';
import 'package:rainbow/screens/Home/settings/subscription/subscription_controller.dart';
import 'package:rainbow/screens/Home/settings/subscription/subscription_payment/subscription_payment_screen.dart';
import 'package:rainbow/utils/strings.dart';

import '../../../../common/Widget/text_styles.dart';
import '../../../../utils/asset_res.dart';
import '../../../../utils/color_res.dart';

class SubscriptionScreen extends StatelessWidget {
  SubscriptionScreen({Key? key}) : super(key: key);
  final SubscriptionController controller = Get.put(SubscriptionController());

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
                ColorRes.colorD18EEE,
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
                  child: Column(
                    children: [
                      Center(
                        child: SizedBox(
                          width: Get.width * 0.677333333,
                          child: TextField(
                            style: sfProTextReguler(fontSize: 28),
                            cursorHeight: 28,
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.only(bottom: 0, top: 15),
                              hintText: Strings.enterPromoCode,
                              hintStyle: sfProTextReguler(fontSize: 28),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.065,
                      ),
                      SizedBox(
                          height: 300,
                          width: Get.width,
                          child: PageView.builder(
                            onPageChanged: (index) {
                              controller.changeIndex(index);
                            },
                            scrollDirection: Axis.horizontal,
                            controller: controller.pageController,
                            physics: const BouncingScrollPhysics(),
                            itemCount: 3,
                            itemBuilder: (context, index) =>
                                const PremiumPackage(),
                          )),
                      Center(
                        child: GetBuilder<SubscriptionController>(
                          id: 'index',
                          builder: (controller) => Row(
                            children: [
                              const Spacer(),
                              Container(
                                height: Get.width * 0.016,
                                width: Get.width * 0.016,
                                decoration: BoxDecoration(
                                    color: controller.selectedIndex == 0
                                        ? ColorRes.color_989898
                                        : ColorRes.colorD8D8D8,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(9))),
                              ),
                              SizedBox(
                                width: Get.width * 0.014,
                              ),
                              Container(
                                height: Get.width * 0.016,
                                width: Get.width * 0.016,
                                decoration: BoxDecoration(
                                  color: controller.selectedIndex == 1
                                      ? ColorRes.color_989898
                                      : ColorRes.colorD8D8D8,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(9),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: Get.width * 0.014,
                              ),
                              Container(
                                height: Get.width * 0.016,
                                width: Get.width * 0.016,
                                decoration: BoxDecoration(
                                  color: controller.selectedIndex == 2
                                      ? ColorRes.color_989898
                                      : ColorRes.colorD8D8D8,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(9),
                                  ),
                                ),
                              ),
                              const Spacer(),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.07019,
                      ),
                      SubmitButton(
                        onTap: () {
                          Get.to(() => SubscriptionPaymentScreen());
                        },
                        child: Text(
                          Strings.subscribe,
                          style: gilroySemiBoldTextStyle(
                              fontSize: 16, color: ColorRes.black),
                        ),
                      )
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
          const SizedBox(
            height: 40,
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
                  style: gilroyBoldTextStyle(
                    fontSize: 18,
                  ),
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
                    color: ColorRes.colorFFEC5C, shape: BoxShape.circle
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
          Text(Strings.whatYoullGet,
              style:
                  interTextReguler(fontSize: 22, color: ColorRes.colorE9E9E9)),
          SizedBox(
            height: Get.height * 0.029556,
          ),
          Row(
            children: [
              const Icon(
                Icons.check_circle,
                color: ColorRes.colorE4E4EC,
                size: 20,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(Strings.unlimitedAccess,
                  style: interTextReguler(
                      fontSize: 18, color: ColorRes.colorE4E4EC)),
            ],
          ),
          SizedBox(
            height: Get.height * 0.029556,
          ),
          Row(
            children: [
              const Icon(
                Icons.check_circle,
                color: ColorRes.colorE4E4EC,
                size: 20,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(Strings.dateSupport,
                  style: interTextReguler(
                      fontSize: 18, color: ColorRes.colorE4E4EC)),
            ],
          ),
          SizedBox(
            height: Get.height * 0.0344,
          ),
          Padding(
            padding: EdgeInsets.only(right: Get.width * 0.085333),
            child: const DottedLine(dashColor: ColorRes.colorA9A9AA),
          ),
          SizedBox(
            height: Get.height * 0.0123,
          ),
          RichText(
            text: TextSpan(children: [
              TextSpan(
                text: Strings.textSpan01,
                style: interTextMedium(fontSize: 30, color: ColorRes.white),
              ),
              TextSpan(
                text: Strings.textspan02,
                style: interTextReguler(fontSize: 16, color: ColorRes.white),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
