import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/country_name.dart';
import 'package:rainbow/common/Widget/country_name_controller/my_country_name.dart';
import 'package:rainbow/common/Widget/text_field.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/common/helper.dart';
import 'package:rainbow/screens/auth/register/register_controller.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/color_res.dart';
import 'package:rainbow/utils/strings.dart';

class RegisterForm extends StatelessWidget {
  RegisterForm({Key? key}) : super(key: key);

  final RegisterController controller = Get.find<RegisterController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(
      id: 'register_form',
      builder: (controller) {
        return Column(children: [
          AppTextFiled(
            controller: controller.fullNameController,
            title: Strings.fullName,
            hintText: Strings.natalieNara,
            fontsize: 16,
          ),
          AppTextFiled(
            controller: controller.emailController,
            title: Strings.email,
            hintText: Strings.naranataliEmail,
            textInputType: TextInputType.emailAddress,
            fontsize: 16,
          ),
          controller.isSocial
              ? const SizedBox()
              : AppTextFiled(
                  controller: controller.pwdController,
                  title: Strings.password,
                  hintText: Strings.passwordExample,
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
                  obscure: controller.showPassword == true?false:true,
                  fontsize: 16,
                ),
          controller.isSocial
              ? const SizedBox()
              : AppTextFiled(
                  controller: controller.confirmPwdController,
                  title: Strings.reTypePassword,
                  hintText: Strings.passwordExample,
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
                  obscure: controller.showRetype == true ?false:true,
                  fontsize: 16,
                ),
          GetBuilder<RegisterController>(
            id: 'address1',
            builder: (controller) {
              return AppTextFiled(
                controller: controller.address1Controller,
                title: Strings.addressLine1,
                hintText: Strings.addressLine1Hint,
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
                hintText: Strings.addressLine2Hint,
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
                hintText: Strings.phoneNumberHint,
                textInputType: TextInputType.phone,
                prefix: countryCodePicker(context),
                inputPadding: EdgeInsets.only(left: Get.width * 0.04),
                fontsize: 16,
              );
            },
          ),
          // GetBuilder<RegisterController>(id: "register_screen",builder: (controller) {
          //   return GestureDetector(
          //     onTap: () {
          //       controller.onStatusSelect();
          //     },
          //     child: AppTextFiled(
          //       controller: controller.statusController,
          //       title: Strings.maritalStatus,
          //       hintText: Strings.single,
          //       suffix: Image.asset(AssetRes.arrowDown, height: 17),
          //       enable: false,
          //       fontsize: 16,
          //     ),
          //   );
          // },
          //
          // ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Strings.maritalStatus,
                style: gilroySemiBoldTextStyle(fontSize: 14),
              ),
              const SizedBox(
                height: 10,
              ),
              GetBuilder<RegisterController>(
                id: "register_screen",
                builder: (controller) {
                  return DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      isExpanded: true,
                      hint: Row(
                        children: [
                          const SizedBox(
                            width: 4,
                          ),
                          Expanded(
                            child: Text(
                              "single",
                              style: gilroyMediumTextStyle(
                                  fontSize: 16,
                                  color: ColorRes.black.withOpacity(0.3)),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      items: controller.martialStatusList
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: gilroyMediumTextStyle(
                                      fontSize: 16, color: ColorRes.black),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ))
                          .toList(),
                      value: controller.selectedLocation,
                      onChanged: (value) {
                        controller.selectedLocation = value as String;
                        controller.statusController.text = value;
                        controller.update(["register_screen"]);
                      },
                      icon: Image.asset(AssetRes.arrowDown, height: 17),
                      iconSize: 14,
                      iconEnabledColor: Colors.grey,
                      iconDisabledColor: Colors.grey,
                      buttonHeight: 60,
                      buttonWidth: Get.width * 0.8,
                      buttonPadding: const EdgeInsets.only(left: 14, right: 23),
                      buttonDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      buttonElevation: 2,
                      itemHeight: 40,
                      barrierLabel: "Singel",
                      itemPadding: const EdgeInsets.only(left: 20, right: 14),
                      dropdownMaxHeight: 100,
                      /* height: Get.height*0.19,*/
                      dropdownWidth: Get.width * 0.8,
                      dropdownPadding: null,
                      dropdownDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.white,
                      ),
                      dropdownElevation: 8,
                      scrollbarRadius: const Radius.circular(40),
                      scrollbarThickness: 6,
                      scrollbarAlwaysShow: true,
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),

          GetBuilder<RegisterController>(
              id: "drop",
              builder: (controller){
                return  Container(
                  width: Get.width/1.24,
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
                            flex: 8,
                            child: InkWell(
                              child: TextField(
                                controller: controller.ethnicityController,
                                style: textFieldText,
                                obscuringCharacter: "•",
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
                            icon: Image.asset(AssetRes.arrowDown, height: 16),)
                        ],
                      ),

                    ],
                  ),
                );
              }),
          GetBuilder<RegisterController>(
              id: "drop",
              builder: (controller){
                return  (controller.countryBox == true)
                    ?Container(
                  height: 150,
                  width: 390,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: SingleChildScrollView(

                    child: Column(
                      children: listNationalities.data!.map((e) {
                        return Padding(
                          padding: EdgeInsets.only(left: 20, top: 7, bottom: 7),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: InkWell(
                              onTap: (){
                                controller.ethnicityController.text = e.name!;
                                controller.countryBox = false;
                                controller.update(["drop"]);
                                },
                              child: Text(e.name!, style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                )
                    :SizedBox();
              }),
          const SizedBox(
            height: 10,
          ),
         /* GetBuilder<RegisterController>(
            id: 'register_screen',
            builder: (controller) {
              return dropdownButton(
                title: Strings.ethnicity,
                hintText: "0",
                selectedValue: controller.selectedEthicity,

                onTap: controller.onTapEthnicity,
                dropdownList: countryNationCity,
                height: Get.height * 0.3,
              );
            },
          ),*/

          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     Text(
          //       Strings.ethnicity,
          //       style: gilroySemiBoldTextStyle(fontSize: 14),
          //     ),
          //     const SizedBox(
          //       height: 10,
          //     ),
          //     GetBuilder<RegisterController>(
          //       id: "register_screen",
          //       builder: (controller) {
          //         return DropdownButtonHideUnderline(
          //           child: DropdownButton2(
          //             isExpanded: true,
          //             hint: Row(
          //               children: [
          //                 const SizedBox(
          //                   width: 4,
          //                 ),
          //                 Expanded(
          //                   child: Text(
          //                     "0",
          //                     style: gilroyMediumTextStyle(
          //                         fontSize: 16,
          //                         color: ColorRes.black.withOpacity(0.3)),
          //                     overflow: TextOverflow.ellipsis,
          //                   ),
          //                 ),
          //               ],
          //             ),
          //             items: countryNationCity
          //                 .map((item) => DropdownMenuItem<String>(
          //                       value: item,
          //                       child: Text(
          //                         item,
          //                         style: gilroyMediumTextStyle(
          //                             fontSize: 16, color: ColorRes.black),
          //                         overflow: TextOverflow.ellipsis,
          //                       ),
          //                     ))
          //                 .toList(),
          //             value: controller.selectedEthicity,
          //             onChanged: (value) {
          //               controller.selectedEthicity = value as String;
          //               controller.ethnicityController.text = value;
          //               controller.update(["register_screen"]);
          //             },
          //             icon: Image.asset(AssetRes.arrowDown, height: 17),
          //             iconSize: 14,
          //             iconEnabledColor: Colors.grey,
          //             iconDisabledColor: Colors.grey,
          //             buttonHeight: 60,
          //             buttonWidth: Get.width * 0.8,
          //             buttonPadding: const EdgeInsets.only(left: 14, right: 23),
          //             buttonDecoration: BoxDecoration(
          //               borderRadius: BorderRadius.circular(20),
          //               color: Colors.white,
          //             ),
          //             buttonElevation: 2,
          //             itemHeight: 40,
          //             itemPadding: const EdgeInsets.only(left: 20, right: 14),
          //             dropdownMaxHeight: Get.height * 0.3,
          //             /* height: Get.height*0.19,*/
          //             dropdownWidth: Get.width * 0.8,
          //             dropdownPadding: null,
          //             dropdownDecoration: BoxDecoration(
          //               borderRadius: BorderRadius.circular(14),
          //               color: Colors.white,
          //             ),
          //             dropdownElevation: 8,
          //             scrollbarRadius: const Radius.circular(40),
          //             scrollbarThickness: 6,
          //             scrollbarAlwaysShow: true,
          //           ),
          //         );
          //       },
          //     ),
          //     const SizedBox(
          //       height: 10,
          //     ),
          //   ],
          // ),

          GestureDetector(
            onTap: () {
              controller.showDatePicker(context);
              FocusScope.of(context).unfocus();
            },
            child: AppTextFiled(
              controller: controller.dobController,
              title: Strings.birthDate,
              hintText: Strings.birthDateHint,
              suffix: Image.asset(AssetRes.calendar, height: 17),
              enable: false,
              fontsize: 16,
            ),
          ),
          // GestureDetector(
          //   onTap: () {
          //     controller.onKidsSelect();
          //     FocusScope.of(context).unfocus();
          //   },
          //   child: AppTextFiled(
          //     controller: controller.kidsController,
          //     title: Strings.noOfKids,
          //     hintText: Strings.noOfKidsHint,
          //     suffix: Image.asset(AssetRes.arrowDown, height: 17),
          //     enable: false,
          //     fontsize: 16,
          //   ),
          // ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Strings.noOfKids,
                style: gilroySemiBoldTextStyle(fontSize: 14),
              ),
              const SizedBox(
                height: 10,
              ),
              GetBuilder<RegisterController>(
                id: "register_screen",
                builder: (controller) {
                  return DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      isExpanded: true,
                      hint: Row(
                        children: [
                          const SizedBox(
                            width: 4,
                          ),
                          Expanded(
                            child: Text(
                              "0",
                              style: gilroyMediumTextStyle(
                                  fontSize: 16,
                                  color: ColorRes.black.withOpacity(0.3)),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      items: controller.noOfKids
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: gilroyMediumTextStyle(
                                      fontSize: 16, color: ColorRes.black),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ))
                          .toList(),
                      value: controller.selectedNoKids,
                      onChanged: (value) {
                        controller.selectedNoKids = value as String;
                        controller.kidsController.text = value;
                        controller.update(["register_screen"]);
                      },
                      icon: Image.asset(AssetRes.arrowDown, height: 17),
                      iconSize: 14,
                      iconEnabledColor: Colors.grey,
                      iconDisabledColor: Colors.grey,
                      buttonHeight: 60,
                      buttonWidth: Get.width * 0.8,
                      buttonPadding: const EdgeInsets.only(left: 14, right: 23),
                      buttonDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      buttonElevation: 2,
                      itemHeight: 40,
                      itemPadding: const EdgeInsets.only(left: 20, right: 14),
                      dropdownMaxHeight: Get.height * 0.3,
                      /* height: Get.height*0.19,*/
                      dropdownWidth: Get.width * 0.8,
                      dropdownPadding: null,
                      dropdownDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.white,
                      ),
                      dropdownElevation: 8,
                      scrollbarRadius: const Radius.circular(40),
                      scrollbarThickness: 6,
                      scrollbarAlwaysShow: true,
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ]);
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
