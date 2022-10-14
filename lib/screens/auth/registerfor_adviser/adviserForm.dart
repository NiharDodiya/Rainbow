import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/country_name.dart';
import 'package:rainbow/common/Widget/text_field.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/common/helper.dart';
import 'package:rainbow/screens/auth/registerfor_adviser/registeradviser_controller.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/color_res.dart';
import 'package:rainbow/utils/strings.dart';

class AdviserRegisterForm extends StatelessWidget {
  AdviserRegisterForm({Key? key}) : super(key: key);
  AdviserRegisterController controller = Get.put(AdviserRegisterController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdviserRegisterController>(
      id: 'register_form',
      builder: (controller) {
        return Column(
          children: [
            AppTextFiled(
              controller: controller.fullNameController,
              title: Strings.fullName,
              hintText: "Margarette Murray",
            ),
            AppTextFiled(
              controller: controller.emailController,
              title: Strings.email,
              hintText: "mmurray123@gmail.com",
              textInputType: TextInputType.emailAddress,
            ),
            AppTextFiled(
              controller: controller.pwdController,
              title: Strings.password,
              hintText: "************",
              suffix: InkWell(
                  onTap: () {
                    controller.onTapShowPassword();
                    controller.update(["register_form"]);
                  },
                  child: controller.showPassword == true
                      ? const Icon(
                          Icons.remove_red_eye_outlined,
                          color: Colors.grey,
                        )
                      : const Icon(
                          Icons.remove_red_eye_rounded,
                          color: Colors.grey,
                        )),
              obscure: controller.showPassword == true ? false : true,
            ),
            AppTextFiled(
              controller: controller.confirmPwdController,
              title: Strings.reTypePassword,
              hintText: "************",
              suffix: InkWell(
                  onTap: () {
                    controller.onTapShowRetypePassword();
                    controller.update(["register_form"]);
                  },
                  child: controller.showRetype == true
                      ? const Icon(
                          Icons.remove_red_eye_outlined,
                          color: Colors.grey,
                        )
                      : const Icon(
                          Icons.remove_red_eye_rounded,
                          color: Colors.grey,
                        )),
              obscure: controller.showRetype == true ? false : true,
            ),
            GetBuilder<AdviserRegisterController>(
              id: 'address1',
              builder: (controller) {
                return AppTextFiled(
                  controller: controller.houseNumber,
                  title: Strings.houseNumber,
                  hintText: "123",
                  multiLine: true,
                  onChange: controller.onAddress1Change,
                );
              },
            ),
            GetBuilder<AdviserRegisterController>(
              id: 'address2',
              builder: (controller) {
                return AppTextFiled(
                  controller: controller.streetName,
                  title: Strings.streetName,
                  hintText: "Street",
                  multiLine: true,
                  onChange: controller.onAddress2Change,
                );
              },
            ),
            GetBuilder<AdviserRegisterController>(
              id: 'phone_filed',
              builder: (controller) {
                return AppTextFiled(
                  controller: controller.city,
                  title: Strings.city,
                  hintText: "Ontrario",
                  inputPadding: EdgeInsets.only(left: Get.width * 0.04),
                );
              },
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                Strings.country,
                style: gilroySemiBoldTextStyle(fontSize: 14),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GetBuilder<AdviserRegisterController>(
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
                                  controller: controller.country,
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
            GetBuilder<AdviserRegisterController>(
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
                              children: (controller.country.text.isEmpty)
                                  ? listCountryModel.data!.map((e) {
                                      return Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, top: 7, bottom: 7),
                                        child: InkWell(
                                          onTap: () {
                                            controller.country.text = e.name!;
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
                                            controller.country.text = e.name!;
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
            const SizedBox(
              height: 10,
            ),
            /*GetBuilder<AdviserRegisterController>(
              id: "country",
              builder: (controller) {
                return dropdownButton(
                    title: "Country",
                    hintText: "Canada",
                    selectedValue: controller.selectedValue,
                    controller: controller.country,
                    onTap: controller.onStatusChange,
                    dropdownList: countryCity,
                    height: Get.height * 0.3);
                //   GestureDetector(
                //   onTap: () {
                //      controller.onCountryCitySelect();
                //   },
                //   child: AppTextFiled(
                //     controller: controller.country,
                //     title: Strings.country,
                //     hintText: Strings.country,
                //     enable: true,
                //     suffix: Image.asset(AssetRes.arrowDown,height: 15,width: 15,),
                //   ),
                // );
              },
            ),*/
            AppTextFiled(
              controller: controller.postalCode,
              title: Strings.postalCode,
              hintText: "123125",
              // textInputType: TextInputType.number,
              enable: true,
            ),
            GetBuilder<AdviserRegisterController>(
              id: 'phone_filed',
              builder: (controller) {
                return AppTextFiled(
                  controller: controller.phoneNumber,
                  title: Strings.phoneNumber,
                  hintText: "123 456 789",
                  textInputType: TextInputType.phone,
                  prefix: countryCodePicker(context),
                  inputPadding: EdgeInsets.only(left: Get.width * 0.04),
                );
              },
            ),
          ],
        );
      },
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
}
