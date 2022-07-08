import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/text_field.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/screens/auth/register/register_controller.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/strings.dart';

class RegisterForm extends StatelessWidget {
  RegisterForm({Key? key}) : super(key: key);

  final RegisterController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(
      id: 'register_form',
      builder: (controller) {
        return Column(
          children: [
            AppTextFiled(
              controller: controller.fullNameController,
              title: Strings.fullName,
              hintText: Strings.fullName,
              fontsize: 16,
            ),
            AppTextFiled(
              controller: controller.emailController,
              title: Strings.email,
              hintText: Strings.email,
              textInputType: TextInputType.emailAddress,
              fontsize: 16,
            ),
            AppTextFiled(
              controller: controller.pwdController,
              title: Strings.password,
              hintText: Strings.password,
              obscure: true,
              fontsize: 16,
            ),
            AppTextFiled(
              controller: controller.confirmPwdController,
              title: Strings.reTypePassword,
              hintText: Strings.reTypePassword,
              obscure: true,
              fontsize: 16,
            ),
            GetBuilder<RegisterController>(
              id: 'address1',
              builder: (controller) {
                return AppTextFiled(
                  controller: controller.address1Controller,
                  title: Strings.addressLine1,
                  hintText: Strings.addressLine1,
                  multiLine: true,
                  onChange: controller.onAddress1Change,
                  fontsize: 16,
                );
              },
            ),
            GetBuilder<RegisterController>(
              id: 'address2',
              builder: (controller) {
                return AppTextFiled(
                  controller: controller.address2Controller,
                  title: Strings.addressLine2,
                  hintText: Strings.addressLine2,
                  multiLine: true,
                  onChange: controller.onAddress2Change,
                  fontsize: 16,
                );
              },
            ),
            GetBuilder<RegisterController>(
              id: 'phone_filed',
              builder: (controller) {
                return AppTextFiled(
                  controller: controller.phoneController,
                  title: Strings.phoneNumber,
                  hintText: Strings.phoneNumber,
                  textInputType: TextInputType.phone,
                  prefix: countryCodePicker(context),
                  inputPadding: EdgeInsets.only(left: Get.width * 0.04),
                  fontsize: 16,
                );
              },
            ),
            GetBuilder<RegisterController>(id: "register_screen",builder: (controller) {
              return GestureDetector(
                onTap: () {
                  controller.onStatusSelect();
                },
                child: AppTextFiled(
                  controller: controller.statusController,
                  title: Strings.maritalStatus,
                  hintText: Strings.maritalStatus,
                  suffix: Image.asset(AssetRes.arrowDown, height: 17),
                  enable: false,
                  fontsize: 16,
                ),
              );
            },

            ),
            GestureDetector(
              onTap: () {
                controller.onEthnicitySelect();
              },
              child: AppTextFiled(
                controller: controller.ethnicityController,
                title: Strings.ethnicity,
                hintText: Strings.ethnicity,
                suffix: Image.asset(AssetRes.arrowDown, height: 17),
                enable: false,
                fontsize: 16,
              ),
            ),
            GestureDetector(
              onTap: () {
                controller.showDatePicker(context);
              },
              child: AppTextFiled(
                controller: controller.dobController,
                title: Strings.birthDate,
                hintText: Strings.birthDate,
                suffix: Image.asset(AssetRes.calendar, height: 17),
                enable: false,
                fontsize: 16,
              ),
            ),
            GestureDetector(
              onTap: () {
                controller.onKidsSelect();
              },
              child: AppTextFiled(
                controller: controller.kidsController,
                title: Strings.noOfKids,
                hintText: Strings.noOfKids,
                suffix: Image.asset(AssetRes.arrowDown, height: 17),
                enable: false,
                fontsize: 16,
              ),
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