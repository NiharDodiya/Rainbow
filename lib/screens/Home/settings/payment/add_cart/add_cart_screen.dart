import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/loaders.dart';
import 'package:rainbow/common/Widget/text_field.dart';
import 'package:rainbow/common/helper.dart';
import 'package:rainbow/screens/Home/settings/payment/add_cart/add_cart_controller.dart';

import '../../../../../common/Widget/buttons.dart';
import '../../../../../common/Widget/text_styles.dart';
import '../../../../../utils/asset_res.dart';
import '../../../../../utils/color_res.dart';
import '../../../../../utils/strings.dart';

class AddCartScreen extends StatelessWidget {
  AddCartScreen({Key? key}) : super(key: key);
  final AddCartController controller = Get.put(AddCartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return Stack(
          children: [
            GetBuilder<AddCartController>(
                id: "addCard",
                builder: (controller) {
                  return Container(
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
                                /*  GetBuilder<AddCartController>(
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
                            ),*/
                                Text(
                                  Strings.country,
                                  style: gilroySemiBoldTextStyle(fontSize: 14),
                                ),
                                const SizedBox(height: 8),
                                //dropdownButtonCountry(),
                                GetBuilder<AddCartController>(
                                    id: "drop",
                                    builder: (controller) {
                                      return Container(
                                        width: Get.width / 1.24,
                                        height: 60,
                                        decoration: BoxDecoration(
                                          color: ColorRes.white,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        padding: const EdgeInsets.only(
                                            left: 20, top: 5),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Expanded(
                                                  flex: 14,
                                                  child: InkWell(
                                                    child: TextField(
                                                      onTap: controller
                                                          .dropDownBox,
                                                      controller: controller
                                                          .countryController,
                                                      style: textFieldText,
                                                      obscuringCharacter: "•",
                                                      onChanged: (value) {
                                                        controller
                                                            .serching(value);
                                                      },
                                                      decoration:
                                                          InputDecoration(
                                                        border:
                                                            InputBorder.none,
                                                        hintStyle:
                                                            gilroyMediumTextStyle(
                                                                fontSize: 18,
                                                                color: ColorRes
                                                                    .black
                                                                    .withOpacity(
                                                                        0.3)),
                                                        hintText: "Canada",
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                IconButton(
                                                  onPressed:
                                                      controller.dropDownBox,
                                                  icon: Image.asset(
                                                      AssetRes.arrowDown,
                                                      height: 20),
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      );
                                    }),
                                GetBuilder<AddCartController>(
                                    id: "drop",
                                    builder: (controller) {
                                      return (controller.countryBox == true)
                                          ? Container(
                                              height: 160,
                                              width: Get.width / 1.24,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: Colors.white,
                                              ),
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  children: (controller
                                                          .countryController
                                                          .text
                                                          .isEmpty)
                                                      ? countryCity.map((e) {
                                                          return Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 20,
                                                                    top: 7,
                                                                    bottom: 7),
                                                            child: InkWell(
                                                              onTap: () {
                                                                controller
                                                                    .countryController
                                                                    .text = e;
                                                                controller
                                                                        .countryBox =
                                                                    false;
                                                                controller
                                                                    .update([
                                                                  "drop"
                                                                ]);
                                                              },
                                                              child: SizedBox(
                                                                width:
                                                                    Get.width,
                                                                height: 25,
                                                                child: Align(
                                                                  alignment:
                                                                      Alignment
                                                                          .topLeft,
                                                                  child: Text(
                                                                    e,
                                                                    style: const TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            16),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }).toList()
                                                      : controller.filterList
                                                          .map((e) {
                                                          return Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 20,
                                                                    top: 7,
                                                                    bottom: 7),
                                                            child: InkWell(
                                                              onTap: () {
                                                                controller
                                                                    .countryController
                                                                    .text = e;
                                                                controller
                                                                        .countryBox =
                                                                    false;
                                                                controller
                                                                    .update([
                                                                  "drop"
                                                                ]);
                                                              },
                                                              child: SizedBox(
                                                                width:
                                                                    Get.width,
                                                                height: 25,
                                                                child: Align(
                                                                  alignment:
                                                                      Alignment
                                                                          .topLeft,
                                                                  child: Text(
                                                                    e,
                                                                    style: const TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            16),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }).toList(),
                                                ),
                                              ),
                                            )
                                          : const SizedBox();
                                    }),
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
                                  title: Strings.nameOnCard,
                                  hintText: Strings.aycanDoganlar,
                                ),
                                Text(
                                  Strings.cardNumber,
                                  style: gilroySemiBoldTextStyle(fontSize: 14),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Stack(
                                  children: [
                                    Container(
                                      height: 60,
                                      width: Get.width,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, top: 5),
                                      child: TextField(
                                        controller:
                                            controller.cardNmberController,
                                        style: textFieldText,inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                        CustomInputFormatter()
                                      ],
                                        maxLength: 19,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintStyle: gilroyMediumTextStyle(
                                              fontSize: 18,
                                              color: ColorRes.black
                                                  .withOpacity(0.3)),
                                          hintText: Strings.cardNumberHint,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                // SizedBox(
                                //   height: Get.height * 0.0184,
                                // ),
                                Row(
                                  children: [
                                    Text(
                                      Strings.expiryDate,
                                      style: gilroySemiBoldTextStyle(fontSize: 14),
                                    ), SizedBox(width: Get.width * 0.25,),
                                    Text(
                                      Strings.cVV,
                                      style: gilroySemiBoldTextStyle(fontSize: 14),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Expanded(child: Container(
                                      height: 60,
                                      width: Get.width,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Padding(padding: const EdgeInsets.only(left: 20,top: 5),
                                        child: TextField( controller: controller.expiryYearController,inputFormatters: [
                                          LengthLimitingTextInputFormatter(5),
                                          CardExpirationFormatter()
                                        ],style: textFieldText,/*maxLength: 5,*/
                                            decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintStyle: gilroyMediumTextStyle(
                                              fontSize: 18,
                                              color: ColorRes.black
                                                  .withOpacity(0.3)),
                                          hintText: Strings.cVVHint,
                                        )),
                                      ),
                                    )),
                                  /*  Expanded(
                                      child: AppTextFiled(
                                          controller:
                                              controller.expiryYearController,
                                          title: Strings.expiryDate,
                                          hintText: Strings.expiryDateHint,
                                          textInputType: TextInputType.number),
                                    ),*/
                                    SizedBox(
                                      width: Get.width * 0.05866,
                                    ),
                                  /*  Expanded(
                                      child: AppTextFiled(
                                        controller:
                                            controller.expiryMonthController,
                                        title: Strings.expiryMonth,
                                        hintText: Strings.expiryDateHint,
                                        textInputType: TextInputType.number,
                                      ),
                                    ),*/
                                    Expanded(child: Container(
                                      height: 60,
                                      width: Get.width,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Padding(padding: const EdgeInsets.only(left: 20,top: 5),
                                        child: TextField( controller: controller.cvvController,style: textFieldText,inputFormatters: [ LengthLimitingTextInputFormatter(3),],
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintStyle: gilroyMediumTextStyle(
                                                  fontSize: 18,
                                                  color: ColorRes.black
                                                      .withOpacity(0.3)),
                                              hintText: Strings.cVVHint,
                                            )),
                                      ),
                                    )),
                                 /*   Expanded(child: AppTextFiled(
                                      controller: controller.cvvController,
                                      title: Strings.cVV,
                                      hintText: Strings.cVVHint,
                                      textInputType: TextInputType.number,
                                      obscure: true,
                                    ))*/
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SubmitButton(
                                  text: Strings.addCard,
                                  onTap: () {
                                    controller.addCart(context);
                                  },
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
                  );
                }),
            controller.loader.value == true
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
            height: Get.height * 0.06,
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
                width: Get.width * 0.28,
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

// enter 4 digit when enter space
AddCartController addCartController = Get.put(AddCartController());
class CustomInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    addCartController.cardNumber = newValue.text;

    var buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 4 == 0 && nonZeroIndex != text.length) {
        buffer.write(' '); // Replace this with anything you want to put after each 4 numbers
      }
    }

    var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: TextSelection.collapsed(offset: string.length)
    );
  }
}
// Expiry Date AddMethod Ui
class CardExpirationFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final newValueString = newValue.text;
    String valueToReturn = '';

    for (int i = 0; i < newValueString.length; i++) {
      if (newValueString[i] != '/') valueToReturn += newValueString[i];
      var nonZeroIndex = i + 1;
      final contains = valueToReturn.contains(RegExp(r'\/'));
      if (nonZeroIndex % 2 == 0 &&
          nonZeroIndex != newValueString.length &&
          !(contains)) {
        valueToReturn += '/';
      }
    }
    return newValue.copyWith(
      text: valueToReturn,
      selection: TextSelection.fromPosition(
        TextPosition(offset: valueToReturn.length),
      ),
    );
  }
}
