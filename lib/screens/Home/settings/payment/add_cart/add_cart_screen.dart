import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/text_field.dart';
import 'package:rainbow/screens/Home/settings/payment/add_cart/add_cart_controller.dart';

import '../../../../../common/Widget/buttons.dart';
import '../../../../../common/Widget/text_styles.dart';
import '../../../../../utils/asset_res.dart';
import '../../../../../utils/color_res.dart';
import '../../../../../utils/strings.dart';

class AddCartScreen extends StatelessWidget {
  AddCartScreen({Key? key}) : super(key: key);
  AddCartController controller = Get.put(AddCartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<AddCartController>(
        builder: (controller) => SafeArea(
          child: Container(
            width: Get.width,
            height: Get.height,
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                appBar(),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    padding:
                        EdgeInsets.symmetric(horizontal: Get.width * 0.0906),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Strings.billingInformation,
                          style: gilroyMediumTextStyle(
                              fontSize: 18, letterSpacing: -0.55),
                        ),
                        SizedBox(
                          height: Get.height * 0.0431,
                        ),

                        AppTextFiled(
                          controller: controller.fullNameController,
                          title: Strings.fullName,
                          hintText: Strings.natalieNara,
                        ),
                        // SizedBox(height: Get.height *0.0184,),
                        AppTextFiled(
                          controller: controller.addressController,
                          title: Strings.address,
                          hintText: Strings.addressHint,
                        ),
                        // SizedBox(
                        //   height: Get.height * 0.0184,
                        // ),
                        Row(
                          children: [
                            Expanded(
                              child: AppTextFiled(
                                controller: controller.cityController,
                                title: Strings.city,
                                hintText: Strings.cityHint,
                              ),
                            ),
                            SizedBox(
                              width: Get.width * 0.05866,
                            ),
                            Expanded(
                              child: AppTextFiled(
                                controller: controller.postalCodeController,
                                title: Strings.postalCode,
                                hintText: Strings.postalCodeHint,
                              ),
                            ),
                          ],
                        ),
                        AppTextFiled(
                          controller: controller.countryController,
                          title: Strings.country,
                          hintText: Strings.london,
                          bottomPadding: 0,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          Strings.cardInformation,
                          style: gilroyMediumTextStyle(
                              fontSize: 18, letterSpacing: -0.55),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        AppTextFiled(
                          controller: controller.nameOnCardController,
                          title: Strings.nameonCard,
                          hintText: Strings.aycanDoganlar,
                        ),
                        AppTextFiled(
                          controller: controller.cardNmberController,
                          title: Strings.cardNumber,
                          hintText: Strings.cardNumberHint,
                        ),
                        // SizedBox(
                        //   height: Get.height * 0.0184,
                        // ),
                        Row(
                          children: [
                            Expanded(
                              child: AppTextFiled(
                                  controller: controller.expiryDateController,
                                  title: Strings.expiryDate,
                                  hintText: Strings.expiryDateHint,
                                  textInputType: TextInputType.number),
                            ),
                            SizedBox(
                              width: Get.width * 0.05866,
                            ),
                            Expanded(
                              child: AppTextFiled(
                                controller: controller.cvvController,
                                title: Strings.cVV,
                                hintText: Strings.cVVHint,
                                textInputType: TextInputType.number,
                              ),
                            ),
                          ],
                        ),
                        SubmitButton(
                          text: Strings.addCard,
                          onTap: controller.addCart,
                        ),
                        SizedBox(
                          height: Get.width * 0.05866,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
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
                    Strings.addCard,
                    style: gilroyBoldTextStyle(),
                  )),
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
