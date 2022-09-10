import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/buttons.dart';
import 'package:rainbow/common/Widget/country_name.dart';
import 'package:rainbow/common/Widget/loaders.dart';
import 'package:rainbow/common/Widget/text_field.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/common/helper.dart';
import 'package:rainbow/screens/Home/settings/payment/edit_card/edit_card_controller.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/color_res.dart';
import 'package:rainbow/utils/strings.dart';

class EditCardScreen extends StatelessWidget {
  int? index;
  String? cardHolder;
  String? month;
  String? year;
  String? fullName;
  String? address;
  String? city;
  String? country;
  String? postalCode;
  String? cardNmber;

  EditCardScreen({
    required this.index,
    required this.cardHolder,
    required this.month,
    required this.year,
    required this.fullName,
    required this.address,
    required this.city,
    required this.country,
    required this.postalCode,
    required this.cardNmber,
    Key? key
  }) : super(key: key);

  final EditCardController editCardController = Get.put(EditCardController());

  @override
  Widget build(BuildContext context) {
    editCardController.nameOnCardController.text = cardHolder!;
    editCardController.expiryMonthController.text = month!;
    editCardController.expiryYearController.text = year!;
    editCardController.fullNameController.text  = fullName!;
    editCardController.addressController.text = address!;
    editCardController.cityController.text = city!;
    editCardController.countryController.text = country!;
    editCardController.postalCodeController.text = postalCode!;
    editCardController.cardNmberController.text = cardNmber!;
    editCardController.selectCountry = country!;

    return Scaffold(
      body: Obx(() {
        return Stack(
          children: [
            Container(
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
              child: GetBuilder<EditCardController>(
                  id: "addCard",
                  builder: (controller) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        appBar(),
                        Expanded(
                          child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            padding: EdgeInsets.symmetric(
                                horizontal: Get.width * 0.0906),
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
                                        controller:
                                            controller.postalCodeController,
                                        title: Strings.postalCode,
                                        hintText: Strings.postalCodeHint,
                                      ),
                                    ),
                                  ],
                                ),
                                GetBuilder<EditCardController>(
                                  id: 'addCard',
                                  builder: (controller) {
                                    return dropdownButton(
                                        title: "Country",
                                        hintText: "Canada",
                                        selectedValue: controller.selectCountry,
                                        onTap: controller.onCountryCoCityChange,
                                        dropdownList: countryCity,
                                        height: Get.height * 0.3);
                                  },
                                ),
                                /*  AppTextFiled(
                          controller: controller.countryController,
                          title: Strings.country,
                          hintText: Strings.london,
                          bottomPadding: 0,
                        ),*/
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
                                          controller:
                                              controller.expiryYearController,
                                          title: Strings.expiryYear,
                                          hintText: Strings.expiryDateHint,
                                          textInputType: TextInputType.number),
                                    ),
                                    SizedBox(
                                      width: Get.width * 0.05866,
                                    ),
                                    Expanded(
                                      child: AppTextFiled(
                                        controller:
                                            controller.expiryMonthController,
                                        title: Strings.expiryMonth,
                                        hintText: Strings.expiryDateHint,
                                        textInputType: TextInputType.number,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                AppTextFiled(
                                  controller: controller.cvvController,
                                  title: Strings.cVV,
                                  hintText: Strings.cVVHint,
                                  textInputType: TextInputType.number,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SubmitButton(
                                  text: Strings.editCard,
                                  onTap: () =>
                                      controller.editCart(index: index),
                                ),
                                SizedBox(
                                  height: Get.width * 0.05866,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    );
                  }),
            ),
            editCardController.loader.value == true
                ? const FullScreenLoader()
                : const SizedBox(),
          ],
        );
      }),
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
                  width: 35,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: Get.width * 0.3,
              ),
              Text(
                Strings.editCard,
                style: gilroyBoldTextStyle(),
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
