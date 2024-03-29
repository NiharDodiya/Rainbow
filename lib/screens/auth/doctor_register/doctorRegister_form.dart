import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/country_name.dart';
import 'package:rainbow/common/Widget/text_field.dart';
import 'package:rainbow/common/helper.dart';
import 'package:rainbow/screens/auth/doctor_register/doctorRegister_controller.dart';
import 'package:rainbow/utils/strings.dart';

class DoctorRegisterForm extends StatelessWidget {
  const DoctorRegisterForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DoctorRegisterController>(
      id: 'doctor',
      builder: (controller) {
        return Column(
          children: [
            dropdownButton(
              title: "Profession",
              hintText: "Doctor",
              selectedValue: controller.selectProfession,
              onTap: controller.onProfessionChange,
              dropdownList: controller.professionList,
            ),
            //       GestureDetector(onTap: () {
            // controller.onProfessionOnTap();
            //       },
            //         child: AppTextFiled(
            //           controller: controller.profession,
            //           title: Strings.profession,
            //           hintText: Strings.profession,
            //             suffix: Image.asset(AssetRes.arrowDown, height: 17),
            //         ),
            //       ),
            AppTextFiled(
              controller: controller.comanyName,
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
              controller: controller.streetName,
              title: Strings.streetName,
              hintText: Strings.street,
              obscure: false,
            ),
            GetBuilder<DoctorRegisterController>(
              id: 'doctor',
              builder: (controller) {
                return AppTextFiled(
                  controller: controller.city,
                  title: Strings.city,
                  hintText: Strings.city,
                  multiLine: true,
                );
              },
            ),
            GetBuilder<DoctorRegisterController>(
              id: 'doctor',
              builder: (controller) {
                return dropdownButton(
                    title: "Country",
                    hintText: "Canada",
                    selectedValue: controller.selectCountry,
                    onTap: controller.onCountryCoCityChange,
                    dropdownList: countryCity,
                    height: Get.height * 0.3);
                //   GestureDetector(onTap: () {
                //   controller.onCountryCoCitySelect();
                // },
                //   child: AppTextFiled(
                //     controller: controller.country,
                //     title: Strings.country,
                //     hintText: Strings.country,
                //     multiLine: true,
                //     suffix: Image.asset(AssetRes.arrowDown,height: 15,width: 15,),
                //   ),
                // );
              },
            ),

            GestureDetector(
              onTap: () {},
              child: AppTextFiled(
                controller: controller.postalCode,
                title: Strings.postalCode,
                hintText: Strings.postalCodeDigitHint,
                enable: true,
                // textInputType: TextInputType.number,
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
          ],
        );
      },
    );
  }
}
