import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:rainbow/common/Widget/buttons.dart';
import 'package:rainbow/common/Widget/country_name.dart';
import 'package:rainbow/common/Widget/loaders.dart';
import 'package:rainbow/common/Widget/text_field.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/common/helper.dart';
import 'package:rainbow/screens/account_Information/account_information_controller.dart';
import 'package:rainbow/screens/advertisement/ad_home/ad_home_controller.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/color_res.dart';
import 'package:rainbow/utils/strings.dart';

class AccountInformationScreen extends StatelessWidget {
  AccountInformationScreen({Key? key}) : super(key: key);
  final AccountInformationController controller =
      Get.find<AccountInformationController>();

  final AdHomeController adHomeController = Get.put(AdHomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: Get.height,
            width: Get.width,
            decoration: const BoxDecoration(color: ColorRes.color_4F359B),
            child: Obx(() => Stack(
                  children: [
                    Column(children: [
                      appBar(),
                      SizedBox(
                        width: Get.width * 0.35181,
                        child: Stack(
                          children: [
                            GetBuilder<AccountInformationController>(
                              id: "Getpic",
                              builder: (controller) => (
                                  adHomeController
                                          .viewAdvertiserModel
                                          .data!
                                          .profileImage!
                                          .isEmpty ||
                                      adHomeController.viewAdvertiserModel.data!
                                              .profileImage ==
                                          "")
                                  ? (controller.imagePath == null)
                                      ? Container(
                                          height: Get.width * 0.336,
                                          width: Get.width * 0.336,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: ColorRes.white,
                                                width: 7),
                                            image: const DecorationImage(
                                              image:
                                                  AssetImage(AssetRes.account),
                                            ),
                                          ),
                                        )
                                      : Container(
                                          height: Get.width * 0.336,
                                          width: Get.width * 0.336,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: ColorRes.white,
                                                width: 7),
                                            image: DecorationImage(
                                                image: FileImage(
                                                  File(controller
                                                      .imagePath!.path),
                                                ),
                                                fit: BoxFit.cover),
                                          ),
                                        )
                                  : Container(
                                      height: Get.width * 0.336,
                                      width: Get.width * 0.336,
                                      padding: const EdgeInsets.all(7),
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(99),
                                        child: Container(
                                          height: Get.width * 0.336,
                                          width: Get.width * 0.336,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: CachedNetworkImage(
                                            imageUrl: adHomeController
                                                .viewAdvertiserModel
                                                .data!
                                                .profileImage!
                                                .toString(),
                                            fit: BoxFit.cover,
                                            placeholder: ((context, url) =>
                                                Image.asset(
                                                  AssetRes.account,
                                                  height: Get.width * 0.336,
                                                  width: Get.width * 0.336,
                                                  fit: BoxFit.cover,
                                                )),
                                            errorWidget:
                                                ((context, url, error) =>
                                                    Image.asset(
                                                      AssetRes.account,
                                                      height: Get.width * 0.336,
                                                      width: Get.width * 0.336,
                                                      fit: BoxFit.cover,
                                                    )),
                                          ),
                                        ),
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
                                      color: ColorRes.colorCE8CEC, width: 4),
                                ),
                                child: Center(
                                  child: InkWell(
                                    onTap: () {
                                      controller.img = true;
                                      showModalBottomSheet(
                                          elevation: 10,
                                          barrierColor:
                                              ColorRes.black.withOpacity(0.4),
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10.0),
                                            ),
                                          ),
                                          backgroundColor:
                                              ColorRes.color_4F359B,
                                          context: context,
                                          builder: (context) {
                                            return Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[
                                                GestureDetector(
                                                  onTap: controller
                                                      .navigateToCamera,
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
                                                  onTap: controller
                                                      .navigateToGallary,
                                                  child: const ListTile(
                                                    leading: Icon(Icons
                                                        .photo_size_select_actual_outlined),
                                                    title:
                                                        Text(Strings.gallery),
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
                                        style:
                                            gilroyBoldTextStyle(fontSize: 12),
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
                                        style:
                                            gilroyBoldTextStyle(fontSize: 12),
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
                                      ? ColorRes.colorFFED62
                                      : ColorRes.white,
                                ),
                                Container(
                                  width: Get.width * .5,
                                  height: controller.companySelected ? 3 : 1,
                                  color: controller.companySelected
                                      ? ColorRes.colorFFED62
                                      : ColorRes.white,
                                )
                              ],
                            ),
                            SizedBox(
                              height: Get.height - (Get.height * 0.379),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: Get.width * 0.072),
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
                    controller.loader.isTrue
                        ? const FullScreenLoader()
                        : const SizedBox()
                  ],
                )),
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
            controller.countryModel.phoneCode,
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
    return Column(
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
          hintText: Strings.ontario,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            Strings.country,
            style: gilroySemiBoldTextStyle(fontSize: 14),
          ),
        ),
        const SizedBox(height: 10),
        GetBuilder<AccountInformationController>(
            id: "drop",
            builder: (controller) {
              return Container(
                width: Get.width / 1.20,
                height: 60,
                decoration: BoxDecoration(
                  color: ColorRes.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.only(left: 20, top: 5),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 14,
                          child: InkWell(
                            child: TextField(
                              onTap: controller.dropDownBox,
                              controller: controller.countryController,
                              style: textFieldText,
                              obscuringCharacter: "•",
                              onChanged: (value) {
                                controller.serching(value);
                              },
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintStyle: gilroyMediumTextStyle(
                                    fontSize: 18,
                                    color: ColorRes.black.withOpacity(0.3)),
                                hintText: "Canada",
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: controller.dropDownBox,
                          icon: Image.asset(AssetRes.arrowDown, height: 20),
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
        GetBuilder<AccountInformationController>(
            id: "drop",
            builder: (controller) {
              return (controller.countryBox == true)
                  ? Container(
                      height: 160,
                      width: Get.width / 1.20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: (controller.countryController.text.isEmpty)
                              ? listCountryModel.data!.map((e) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, top: 7, bottom: 7),
                                    child: InkWell(
                                      onTap: () {
                                        controller.countryController.text =
                                            e.name!;
                                        controller.countryBox = false;
                                        controller.update(["drop"]);
                                      },
                                      child: SizedBox(
                                        height: 25,
                                        width: Get.width,
                                        child: Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            e.name!,
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 16),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList()
                              : controller.filterList.map((e) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, top: 7, bottom: 7),
                                    child: InkWell(
                                      onTap: () {
                                        controller.countryController.text =
                                            e.name!;
                                        controller.countryBox = false;
                                        controller.update(["drop"]);
                                      },
                                      child: SizedBox(
                                        height: 25,
                                        width: Get.width,
                                        child: Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            e.name!,
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 16),
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
        const SizedBox(height: 10),
        /*GetBuilder<AccountInformationController>(
                id: 'doctor',
                builder: (controller) {
                  return dropdownButton(
                      title: "Country",
                      hintText: "Canada",
                      controller: controller.countryController,
                      selectedValue: controller.selectCountry,
                      onTap: controller.onCountryChange,
                      dropdownList: countryCity,
                      height: Get.height * 0.3);
                },
              ),*/
        AppTextFiled(
          controller: controller.postalCodeController,
          title: Strings.postalCode,
          hintText: Strings.postalCodeHint,
        ),
        /* AppTextFiled(
          prefix: countryCodePicker(context),
          controller: controller.phoneNumberController,
          title: Strings.phoneNumber,
          hintText: Strings.phoneNumberHint,
        ),*/
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            Strings.phoneNumber,
            style: gilroySemiBoldTextStyle(fontSize: 14),
          ),
        ),
        const SizedBox(height: 10),

        GetBuilder<AccountInformationController>(id: "phone",
          builder: (controller) {
          return controller.idCon==""?const SizedBox(): Container(
            height: 60,
            width: 350,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.only( left: 15),
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  IntlPhoneField(
                    //controller: controller.phoneNumberController,
                    enabled: false,
                    initialValue: controller.idCon==""?controller.adViewProfile.data?.phoneNumber?.split(' ').first:controller.idCon,
                    autovalidateMode: AutovalidateMode.disabled,
                    decoration: const InputDecoration(
                      iconColor: Colors.black,
                      hintMaxLines: 0,
                      prefixIconColor: Colors.black,
                      suffixIconColor: Colors.black,
                      counterText: "0",
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                    style: gilroySemiBoldTextStyle(fontSize: 14, color: Colors.black),
                    dropdownTextStyle:
                    textFieldText,
                    dropdownIconPosition: IconPosition.trailing,

                    dropdownIcon: const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black,
                    ),
                    onChanged: (phone) {
                      print(phone.completeNumber);
                      controller.idCon = phone.countryCode;
                    },
                    onCountryChanged: (country) {
                      print('Country changed to: ' + country.name);
                      controller.idCon ="${country.dialCode}" ;
                    },
                  ),
                  Container(
                    height: 60,
                    width: Get.width / 1.6,
                    padding: EdgeInsets.only(left: 5, top: 4),
                    decoration: BoxDecoration(
                      color: ColorRes.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextField(
                    controller: controller.phoneNumberController,

                    style: textFieldText,
                    keyboardType: TextInputType.phone,

                      decoration: InputDecoration(
                      border: InputBorder.none,
                      hintStyle: gilroyMediumTextStyle(
                          fontSize: 18,
                          color: ColorRes.black.withOpacity(0.3)),
                      hintText: Strings.phoneNumberHint,
                    ),
                  ),

                  ),
                ],
              ),
            ),
          );
        },
        ),
        /*  Container(height: 60,
          decoration: BoxDecoration(color: Colors.white),
          child: IntlPhoneField(dropdownTextStyle: TextStyle(color: Colors.black),
            autovalidateMode: AutovalidateMode.disabled,
            inputFormatters: [],
            initialValue: controller.idCon,style: TextStyle(color: Colors.black),
            decoration: const InputDecoration(border: InputBorder.none,),
            onChanged: (phone) {
              print(phone.completeNumber);
            },
            controller: controller.phoneNumberController,
            onCountryChanged: (country) {
              print('Country changed to: ' + country.name);
              controller.idCon = country.code;
            },
          ),
        ),*/
        SizedBox(height: Get.height * 0.0197),
        SubmitButton(
          text: Strings.save,
          onTap: controller.accountSave,
        ),
        SizedBox(height: Get.height * 0.0197),
      ],
    );
  }

  Widget companyPart() {
    return Column(
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
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            Strings.country,
            style: gilroySemiBoldTextStyle(fontSize: 14),
          ),
        ),
        const SizedBox(height: 10),
        GetBuilder<AccountInformationController>(
            id: "drop",
            builder: (controller) {
              return Container(
                width: Get.width / 1.20,
                height: 60,
                decoration: BoxDecoration(
                  color: ColorRes.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.only(left: 20, top: 5),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 14,
                          child: InkWell(
                            child: TextField(
                              controller: controller.companyCountryController,
                              style: textFieldText,
                              obscuringCharacter: "•",
                              onChanged: (value) {
                                controller.serching(value);
                              },
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintStyle: gilroyMediumTextStyle(
                                    fontSize: 18,
                                    color: ColorRes.black.withOpacity(0.3)),
                                hintText: "Canada",
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: controller.dropDownBox,
                          icon: Image.asset(AssetRes.arrowDown, height: 20),
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
        GetBuilder<AccountInformationController>(
            id: "drop",
            builder: (controller) {
              return (controller.countryBox == true)
                  ? Container(
                      height: 160,
                      width: Get.width / 1.20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: (controller.companyCountryController.text.isEmpty)
                              ? listNationalities.data!.map((e) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, top: 7, bottom: 7),
                                    child: InkWell(
                                      onTap: () {
                                        controller.companyCountryController.text =
                                            e.name!;
                                        controller.countryBox = false;
                                        controller.update(["drop"]);
                                      },
                                      child: SizedBox(
                                        height: 25,
                                        width: Get.width,
                                        child: Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            e.name!,
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 16),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList()
                              : controller.filterList.map((e) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, top: 7, bottom: 7),
                                    child: InkWell(
                                      onTap: () {
                                        controller.companyCountryController.text =
                                            e.name!;
                                        controller.countryBox = false;
                                        controller.update(["drop"]);
                                      },
                                      child: SizedBox(
                                        height: 25,
                                        width: Get.width,
                                        child: Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            e.name!,
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 16),
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
        const SizedBox(height: 10),
        /*GetBuilder<AccountInformationController>(
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
                ),*/
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
