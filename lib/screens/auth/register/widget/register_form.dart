import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/text_field.dart';
import 'package:rainbow/screens/auth/register/register_controller.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/strings.dart';

class RegisterForm extends StatelessWidget {
  RegisterForm({Key? key}) : super(key: key);

  final RegisterController controller = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextFiled(
          controller: controller.fullNameController,
          title: Strings.fullName,
          hintText: Strings.fullName,
        ),
        AppTextFiled(
          controller: controller.emailController,
          title: Strings.email,
          hintText: Strings.email,
          textInputType: TextInputType.emailAddress,
        ),
        AppTextFiled(
          controller: controller.pwdController,
          title: Strings.password,
          hintText: Strings.password,
          obscure: true,
        ),
        AppTextFiled(
          controller: controller.confirmPwdController,
          title: Strings.reTypePassword,
          hintText: Strings.reTypePassword,
          obscure: true,
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
            );
          },
        ),
        AppTextFiled(
          controller: controller.phoneController,
          title: Strings.phoneNumber,
          hintText: Strings.phoneNumber,
          textInputType: TextInputType.phone,
        ),
        AppTextFiled(
          controller: controller.statusController,
          title: Strings.maritalStatus,
          hintText: Strings.maritalStatus,
          suffix: Image.asset(AssetRes.arrowDown, height: 17),
          enable: false,
        ),
        AppTextFiled(
          controller: controller.ethnicityController,
          title: Strings.ethnicity,
          hintText: Strings.ethnicity,
          suffix: Image.asset(AssetRes.arrowDown, height: 17),
          enable: false,
        ),
        AppTextFiled(
          controller: controller.dobController,
          title: Strings.birthDate,
          hintText: Strings.birthDate,
          suffix: Image.asset(AssetRes.calendar, height: 17),
          enable: false,
        ),
        AppTextFiled(
          controller: controller.kidsController,
          title: Strings.noOfKids,
          hintText: Strings.noOfKids,
          suffix: Image.asset(AssetRes.arrowDown, height: 17),
          enable: false,
        ),
      ],
    );
  }
}
