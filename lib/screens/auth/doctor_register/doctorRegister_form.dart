import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/country_name.dart';
import 'package:rainbow/common/Widget/text_field.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/common/helper.dart';
import 'package:rainbow/screens/auth/doctor_register/doctorRegister_controller.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/color_res.dart';
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
              textInputType: TextInputType.phone,
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
            GetBuilder<DoctorRegisterController>(
                id: "drop",
                builder: (controller){
                  return  Container(
                    width: Get.width/1.20,
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
                              icon: Image.asset(AssetRes.arrowDown, height: 20),),
                            SizedBox(width: 5,),
                          ],
                        ),

                      ],
                    ),
                  );
                }),
            GetBuilder<DoctorRegisterController>(
                id: "drop",
                builder: (controller){
                  return  (controller.countryBox == true)
                      ?Container(
                    height: 160,
                    width: 390,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: SingleChildScrollView(

                      child: Column(
                        children: (controller.country.text.isEmpty)
                            ?listCountryModel.data!.map((e) {
                          return Padding(
                            padding: EdgeInsets.only(left: 20, top: 7, bottom: 7),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: InkWell(
                                onTap: (){
                                  controller.country.text = e.name!;
                                  controller.countryBox = false;
                                  controller.update(["drop"]);
                                },
                                child: Text(e.name!, style: TextStyle(color: Colors.black, fontSize: 16),
                                ),
                              ),
                            ),
                          );
                        }).toList()
                            :controller.filterList.map((e) {
                          return Padding(
                            padding: EdgeInsets.only(left: 20, top: 7, bottom: 7),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: InkWell(
                                onTap: (){
                                  controller.country.text = e.name!;
                                  controller.countryBox = false;
                                  controller.update(["drop"]);
                                },
                                child: Text(e.name!, style: TextStyle(color: Colors.black, fontSize: 16),
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
            /*GetBuilder<DoctorRegisterController>(
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
            ),*/

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
