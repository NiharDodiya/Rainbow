import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/buttons.dart';
import 'package:rainbow/common/Widget/country_name.dart';
import 'package:rainbow/common/Widget/loaders.dart';
import 'package:rainbow/common/Widget/text_field.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/common/helper.dart';
import 'package:rainbow/screens/account_Information/account_information_controller.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/color_res.dart';
import 'package:rainbow/utils/strings.dart';

class AccountInformationScreen extends StatelessWidget {
  AccountInformationScreen({Key? key}) : super(key: key);
  AccountInformationController controller =
      Get.find<AccountInformationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: Get.width,
            decoration: const BoxDecoration(color: ColorRes.color_4F359B),
            child: Column(children: [
              appBar(),
              SizedBox(
                height: Get.height * 0.191785714,
                width: Get.width * 0.35181,
                child: Stack(
                  children: [
                    GetBuilder<AccountInformationController>(
                      id: "Getpic",
                      builder: (controller) => Container(
                        height: Get.width * 0.336,
                        width: Get.width * 0.336,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: ColorRes.white, width: 7),
                          image: controller.imagePath == null
                              ? const DecorationImage(
                                  image: AssetImage(AssetRes.account),
                                )
                              : DecorationImage(
                                  image: FileImage(
                                    File(controller.imagePath!.path),
                                  ),
                                  fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: Get.width * 0.01333,
                      right: Get.width * 0.01333,
                      child: Container(
                        height: Get.width * 0.09,
                        width: Get.width * 0.09,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorRes.white,
                          border: Border.all(
                              color: ColorRes.color_CE8CEC, width: 4),
                        ),
                        child: Center(
                          child: InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                  elevation: 10,
                                  barrierColor: ColorRes.black.withOpacity(0.4),
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10.0),
                                    ),
                                  ),
                                  backgroundColor: ColorRes.color_4F359B,
                                  context: context,
                                  builder: (context) {
                                    return Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        GestureDetector(
                                          onTap: controller.navigateToCamera,
                                          child: const ListTile(
                                            leading: Icon(Icons.camera),
                                            title: Text(Strings.camera),
                                          ),
                                        ),
                                        Container(
                                          height: 0.5,
                                          width: Get.width,
                                          color: ColorRes.white,
                                        ),
                                        GestureDetector(
                                          onTap: controller.navigateToGallary,
                                          child: const ListTile(
                                            leading: Icon(Icons
                                                .photo_size_select_actual_outlined),
                                            title: Text(Strings.gallery),
                                          ),
                                        ),
                                      ],
                                    );
                                  });
                            },
                            child: SizedBox(
                              width: Get.width * 0.038,
                              height: Get.width * 0.038,
                              child: Image.asset(AssetRes.edit),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              GetBuilder<AccountInformationController>(
                id: 'update',
                builder: (controller) => Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            controller.selectAccount();
                          },
                          child: SizedBox(
                            width: Get.width * 0.5,
                            height: Get.height * 0.05,
                            child: Center(
                              child: Text(
                                Strings.account,
                                textAlign: TextAlign.start,
                                style: gilroyBoldTextStyle(fontSize: 12),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            controller.selectCompny();
                          },
                          child: SizedBox(
                            width: Get.width * 0.5,
                            height: Get.height * 0.05,
                            child: Center(
                              child: Text(
                                Strings.company,
                                style: gilroyBoldTextStyle(fontSize: 12),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: Get.width * .5,
                          height: !controller.companySelected ? 3 : 1,
                          color: !controller.companySelected
                              ? ColorRes.color_FFED62
                              : ColorRes.white,
                        ),
                        Container(
                          width: Get.width * .5,
                          height: controller.companySelected ? 3 : 1,
                          color: controller.companySelected
                              ? ColorRes.color_FFED62
                              : ColorRes.white,
                        )
                      ],
                    ),
                    SizedBox(
                      height: Get.height - (Get.height * 0.379),
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: Get.width * 0.072),
                        child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: controller.companySelected
                                ? companyPart()
                                : accountPart(context)),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }

  Widget countryCodePicker(BuildContext context) {
    return InkWell(
      onTap: () => controller.onCountryTap(context),
      child: Row(
        children: [
          Text(controller.countryModel.flagEmoji),
          const SizedBox(width: 9),
          Text(
            "+${controller.countryModel.phoneCode}",
            style: textStyleFont14Alert,
          ),
          SizedBox(width: Get.width * 0.04533),
          Image.asset(AssetRes.dropdown, height: 6),
          SizedBox(width: Get.width * 0.024),
        ],
      ),
    );
  }

  Widget accountPart(context) {
    return Obx(() => controller.loader.isTrue
        ? const FullScreenLoader()
        : Column(
            children: [
              SizedBox(height: Get.height * 0.0197),
              AppTextFiled(
                controller: controller.fullNameController,
                title: Strings.fullName,
                hintText: Strings.fullName,
              ),
              AppTextFiled(
                controller: controller.emailController,
                title: Strings.email,
                hintText: Strings.email,
              ),
              AppTextFiled(
                controller: controller.houseNumberController,
                title: Strings.houseNumber,
                hintText: Strings.houseNumberHint,
              ),
              AppTextFiled(
                controller: controller.streetNumberController,
                title: Strings.streetName,
                hintText: Strings.street,
              ),
              AppTextFiled(
                controller: controller.cityController,
                title: Strings.city,
                hintText: Strings.ontrario,
              ),
              GetBuilder<AccountInformationController>(
                id: 'doctor',
                builder: (controller) {
                  return dropdownButton(
                      title: "Country",
                      hintText: "Canada",
                      selectedValue: controller.selectCountry,
                      onTap: controller.onCountryChange,
                      dropdownList: countryCity,
                      height: Get.height * 0.3);
                },
              ),
              AppTextFiled(
                controller: controller.postalCodeController,
                title: Strings.postalCode,
                hintText: Strings.postalCodeHint,
              ),
              AppTextFiled(
                prefix: countryCodePicker(context),
                controller: controller.phoneNumberController,
                title: Strings.phoneNumber,
                hintText: Strings.phoneNumberHint,
              ),
              SizedBox(height: Get.height * 0.0197),
              SubmitButton(
                text: Strings.save,
                onTap: controller.accountSave,
              ),
              SizedBox(height: Get.height * 0.0197),
            ],
          ));
  }

  Widget companyPart() {
    return Obx(
      () => controller.loader.isTrue
          ? const FullScreenLoader()
          : Column(
              children: [
                SizedBox(height: Get.height * 0.0197),
                GetBuilder<AccountInformationController>(
                    id: 'doctor',
                    builder: (controller) => dropdownButton(
                          dropdownList: controller.dropdownList,
                          hintText: Strings.profession,
                          title: Strings.profession,
                          selectedValue: controller.userProfession,
                          onTap: controller.onCountryProfession,
                        )),
                AppTextFiled(
                  controller: controller.companyName,
                  title: Strings.companyName,
                  hintText: Strings.myCompany,
                ),
                AppTextFiled(
                  controller: controller.companyNumber,
                  title: Strings.companyNumber,
                  hintText: Strings.companyNumberDigit,
                  obscure: false,
                ),
                AppTextFiled(
                  controller: controller.companyStreetNumberController,
                  title: Strings.streetName,
                  hintText: Strings.street,
                  obscure: false,
                ),
                AppTextFiled(
                  controller: controller.companyCityController,
                  title: Strings.city,
                  hintText: Strings.city,
                  multiLine: true,
                ),
                GetBuilder<AccountInformationController>(
                  id: 'doctor',
                  builder: (controller) {
                    return dropdownButton(
                        title: "Country",
                        hintText: "Canada",
                        selectedValue: controller.selectCompanyCountry,
                        onTap: controller.onCompanyCountryChange,
                        dropdownList: countryCity,
                        height: Get.height * 0.3);
                  },
                ),
                GestureDetector(
                  onTap: () {},
                  child: AppTextFiled(
                    controller: controller.companyPostalCodeController,
                    title: Strings.postalCode,
                    hintText: Strings.postalCodeDigitHint,
                    enable: true,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: AppTextFiled(
                    controller: controller.website,
                    title: Strings.website,
                    hintText: Strings.websiteHint,
                    enable: true,
                  ),
                ),
                SizedBox(height: Get.height * 0.0197),
                SubmitButton(
                  text: Strings.save,
                  onTap: () => controller.accountSave(),
                ),
                SizedBox(height: Get.height * 0.0197),
              ],
            ),
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
              width: Get.width * 0.2,
            ),
            GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Text(
                  "Account Information",
                  style: gilroyBoldTextStyle(),
                )),
            SizedBox(
              width: Get.width * 0.077,
            ),
            //Floating Button
          ],
        ),
        SizedBox(
          height: Get.height * 0.02,
        ),
      ],
    ),
  );
}
