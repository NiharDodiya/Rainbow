import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/country_name.dart';
import 'package:rainbow/common/Widget/text_field.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/common/helper.dart';
import 'package:rainbow/screens/auth/registerfor_adviser/registeradviser_controller.dart';
import 'package:rainbow/utils/asset_res.dart';
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
              obscure: true,
            ),
            AppTextFiled(
              controller: controller.confirmPwdController,
              title: Strings.reTypePassword,
              hintText: "************",
              obscure: true,
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
            GetBuilder<AdviserRegisterController>(
              id: "country",
              builder: (controller) {
                return dropdownButton(
                    title: "Country",
                    hintText: "Canada",
                    selectedValue: controller.selectedValue,
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
            ),
            AppTextFiled(
              controller: controller.postalCode,
              title: Strings.postalCode,
              hintText: "123125",
              textInputType: TextInputType.number,
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
