import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/loaders.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/model/listCardModel.dart';
import 'package:rainbow/screens/Home/settings/payment/add_cart/add_cart_screen.dart';
import 'package:rainbow/screens/Home/settings/payment/edit_card/edit_card_screen.dart';
import 'package:rainbow/screens/Home/settings/payment/payment_controller.dart';

import '../../../../utils/asset_res.dart';
import '../../../../utils/color_res.dart';
import '../../../../utils/strings.dart';

class PaymentScreen extends StatelessWidget {
  PaymentScreen({Key? key}) : super(key: key);
  PaymentController controller = Get.put(PaymentController());

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Obx((){
        return Stack(
          children: [
            SafeArea(
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
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 32,
                            ),
                        SizedBox(
                          height: Get.width * 0.508,
                          child: PageView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: controller.listCardModel.data?.length ?? 0,
                            onPageChanged: (index) {
                              controller.selectedIndex = index;
                              controller.update(["img"]);
                            },
                            scrollDirection: Axis.horizontal,
                            controller: controller.pageController,
                            itemBuilder: (context, index) => Column(
                              children: const [
                                PaymentCards(),
                              ],
                            ),
                          ),
                        ),
                            SizedBox(
                              height: Get.height * 0.0196798,
                            ),

                            /// Card Address
                            Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: Get.width * 0.0426),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(Strings.natalieNara,
                                            style: textStyleFont14White),
                                        Container(
                                          margin: const EdgeInsets.only(top: 5.5),
                                          height: 4,
                                          width: 4,
                                          decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(2)),
                                              color: ColorRes.color_FFEC5C),
                                        ),
                                        Text(Strings.endingIn0212,
                                            style: textStyleFont14White),
                                        Container(
                                          margin: const EdgeInsets.only(top: 5.5),
                                          height: 4,
                                          width: 4,
                                          decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(2)),
                                              color: ColorRes.color_FFEC5C),
                                        ),
                                        Text(Strings.date,
                                            style: textStyleFont14White),
                                      ],
                                    ),
                                    SizedBox(
                                      height: Get.height * 0.01598,
                                    ),
                                    Text(
                                      Strings.cardAddress,
                                      style: textStyleFont14White,
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: Get.height * 0.0184482,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: Get.width * 0.04266),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  //set As a Default Value
                                  Container(
                                    height: 32,
                                    width: Get.width * 0.41066666,
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(50)),
                                        gradient: LinearGradient(
                                          colors: [
                                            ColorRes.color_36C5F0.withOpacity(1),
                                            ColorRes.color_368CF0.withOpacity(1),
                                          ],
                                        )),
                                    child: Center(
                                        child: Text(
                                          Strings.setasDefaultPayment,
                                          style: gilroySemiBoldTextStyle(fontSize: 12),
                                        )),
                                  ),
                                  //Remove
                                  InkWell(
                                    onTap: () {
                                      controller.navigateToRemove(context);
                                    },
                                    child: Container(
                                      height: 32,
                                      width: Get.width * 0.225,
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(50)),
                                          gradient: LinearGradient(
                                            colors: [
                                              ColorRes.color_F86666.withOpacity(1),
                                              ColorRes.color_F82222.withOpacity(1),
                                            ],
                                          )),
                                      child: Center(
                                        child: Text(
                                          Strings.remove,
                                          style:
                                          gilroySemiBoldTextStyle(fontSize: 12),
                                        ),
                                      ),
                                    ),
                                  ),
                                  //Edit
                                  InkWell(
                                    onTap: () {

                                      Get.to(
                                          EditCardScreen(
                                            index: controller.listCardModel.data?[controller.selectedIndex].id ?? 0,
                                            cardHolder: controller.viewCardModel.data?.cardHolder ?? "",
                                            month: controller.viewCardModel.data?.expMonth.toString() ?? "",
                                            year: controller.viewCardModel.data?.expYear.toString() ?? "",
                                            fullName: controller.viewCardModel.data?.cardAddress?[0].fullName ?? "",
                                            city: controller.viewCardModel.data?.cardAddress?[0].city ?? "",
                                            country: controller.viewCardModel.data?.cardAddress?[0].country ?? "",
                                           cardNmber: controller.viewCardModel.data?.cardNumber ??  "",
                                           postalCode: controller.viewCardModel.data?.cardAddress?[0].postalCode ?? "",
                                            address: controller.viewCardModel.data?.cardAddress?[0].address ?? "",

                                           // cvvController: controller.viewCardModel.data?.cardAddress?[controller.selectedIndex]. ?? "",
                                          )

                                      );

                                    },
                                    child: Container(
                                      height: 32,
                                      width: Get.width * 0.225,
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(50)),
                                        gradient: LinearGradient(
                                          colors: [
                                            ColorRes.color_FFED62.withOpacity(1),
                                            ColorRes.color_F9DD08.withOpacity(1),
                                          ],
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          Strings.edit,
                                          style: gilroySemiBoldTextStyle(
                                              fontSize: 12, color: ColorRes.black),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 18.02,
                            ),
                           GetBuilder<PaymentController>(
                             id: "img",
                               builder: (controller){
                             return  Align(
                               alignment: Alignment.center,
                               child: CarouselIndicator(
                                 cornerRadius: 30,
                                 height: 6,
                                 width: 6,
                                 count: controller.listCardModel.data?.length ?? 1,
                                 index: controller.selectedIndex,
                               ),
                             );
                           }),
                            /*Center(
                              child: GetBuilder<PaymentController>(
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
                                            : ColorRes.color_D8D8D8,
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
                                        color: controller.selectedIndex == 1
                                            ? ColorRes.color_989898
                                            : ColorRes.color_D8D8D8,
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
                                            : ColorRes.color_D8D8D8,
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(9),
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                  ],
                                ),
                              ),
                            ),*/
                            const SizedBox(
                              height: 22.03,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: Get.width * 0.10666,
                                ),
                                Text(
                                  "Last Transactions",
                                  style: gilroyMediumTextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 9.41,
                            ),
                            const Tranzaction(
                              name: Strings.card01,
                              imagePath: AssetRes.p01,
                              minits: Strings.cardminit01,
                              doller: Strings.cardDoller01,
                            ),
                            const Tranzaction(
                              name: Strings.card02,
                              imagePath: AssetRes.p02,
                              minits: Strings.cardminit02,
                              doller: Strings.cardDoller02,
                            ),
                            const Tranzaction(
                              name: Strings.card03,
                              imagePath: AssetRes.p03,
                              minits: Strings.cardminit03,
                              doller: Strings.cardDoller03,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            controller.loader.value==true?const FullScreenLoader():const SizedBox(),
          ],
        );
      }),
    );
  }
}

class Tranzaction extends StatelessWidget {
  final String imagePath;
  final String name;
  final String minits;
  final String doller;

  const Tranzaction({
    Key? key,
    required this.imagePath,
    required this.name,
    required this.minits,
    required this.doller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: Get.width * 0.10666,
          right: Get.width * 0.10666,
          bottom: Get.height * 0.02216),
      child: Container(
        width: Get.width,
        height: 65,
        decoration: const BoxDecoration(
            color: ColorRes.white,
            borderRadius: BorderRadius.all(Radius.circular(12))),
        child: Center(
          child: Row(
            children: [
              SizedBox(
                width: Get.width * 0.0346,
              ),
              Container(
                height: Get.width * 0.0906,
                width: Get.width * 0.0906,
                decoration: const BoxDecoration(
                  color: ColorRes.black,
                  shape: BoxShape.circle,
                  // border: Border.all(
                  //     width: 2,
                  //     color: Theme.of(context).iconTheme.color!),
                ),
                child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(50)),
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.fill,
                    )),
              ),
              SizedBox(
                width: Get.width * 0.042,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: Get.height * 0.01897,
                  ),
                  Text(
                    name,
                    style: gilroySemiBoldTextStyle(
                        color: ColorRes.color_434343,
                        fontSize: 14,
                        letterSpacing: 0.2),
                  ),
                  Text(
                    minits,
                    style: gilroyMediumTextStyle(
                      color: ColorRes.color_959595,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Text(
                doller,
                style: gilroyMediumTextStyle(color: ColorRes.color_29A435),
              ),
              SizedBox(
                width: Get.width * 0.072,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PaymentCards extends StatelessWidget {
  const PaymentCards({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.width * 0.508,
      width: Get.width * 0.8133,
      child: Stack(children: [
        Image.asset(AssetRes.card),
        Column(
          children: [
            SizedBox(
              height: Get.width * 0.0620,
            ),
            Row(
              children: [
                SizedBox(
                  width: Get.width * 0.060986,
                ),
                SizedBox(
                  width: Get.width * 0.1829,
                  child: Image.asset(AssetRes.visa),
                ),
              ],
            ),
            SizedBox(
              height: Get.width * 0.01866,
            ),
            Row(
              children: [
                SizedBox(
                  width: Get.width * 0.060986,
                ),
                Text(
                  Strings.platinum,
                  style: montserratRegularTextStyle(fontSize: 15.25),
                ),
              ],
            ),
            SizedBox(
              height: Get.width * 0.1779,
            ),
            Row(
              children: [
                SizedBox(
                  width: Get.width * 0.060986,
                ),
                Text(
                  "• • • •",
                  style: gilroyBoldTextStyle(
                    fontSize: 15.25,
                  ),
                ),
                SizedBox(
                  width: Get.width * 0.0203,
                ),
                Text(
                  Strings.carddigits,
                  style: montserratMediumTextStyle(
                    fontSize: 15.25,
                  ),
                ),
              ],
            ),
          ],
        )
      ]),
    );
  }
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
            /*   GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Image.asset(
                AssetRes.backIcon,
                height: 16,
                width: 16,
                color: Colors.white,
              ),
            ),*/
            SizedBox(
              width: Get.width * 0.23,
            ),
            Text(
              Strings.manageCards,
              style: gilroyBoldTextStyle(),
            ),
            SizedBox(
              width: Get.width * 0.077,
            ),
            //Floating Button
            InkWell(
              onTap: () {
                Get.to(() => AddCartScreen());
              },
              child: Container(
                width: 28,
                height: 28,
                decoration: const BoxDecoration(
                  color: ColorRes.color_9297FF,
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
                child: const Icon(Icons.add, size: 17),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
