import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:rainbow/screens/advertisement/ad_dashboard/change_password/change_password_controller.dart';

import '../../../../common/Widget/loaders.dart';
import '../../../../common/Widget/text_styles.dart';
import '../../../../utils/color_res.dart';
import '../../../../utils/strings.dart';
import '../../../auth/phonenumber/phonenumber_Controller.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ChangePasswordController controller = Get.put(ChangePasswordController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(
        () {
          return Stack(
            children: [
              SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Center(
                          child: Container(
                            height: Get.height * 0.94,
                            width: Get.width * 0.946666,
                            /*  margin: EdgeInsets.all(Get.width * 0.02669),*/
                            decoration: BoxDecoration(
                                color: ColorRes.color_4F359B,
                                borderRadius: BorderRadius.circular(25)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: Get.height * 0.03,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.only(left: 15),
                                    child: Icon(
                                      Icons.arrow_back_ios_outlined,
                                      size: 16.72,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: Get.height * 0.09,
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Text(
                                      Strings.verifyPhone,
                                      style: gilroyBoldTextStyle(fontSize: 26),
                                    )),
                                SizedBox(
                                  height: Get.height * 0.009,
                                ),
                                GetBuilder<PhoneNumberController>(
                                  builder: (controller) {
                                    return Padding(
                                        padding:
                                            const EdgeInsets.only(left: 15),
                                        child: Row(
                                          children: [
                                            Text(
                                              "${Strings.codeSent}${controller.phoneNumber.text.toString()}",
                                              style: TextStyle(
                                                  color: ColorRes.white
                                                      .withOpacity(0.5),
                                                  fontSize: 14,
                                                  fontFamily: "Gilroy-Light",
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ));
                                  },
                                ),
                                SizedBox(
                                  height: Get.height * 0.04,
                                ),
                                Form(
                                  key: formKey,
                                  child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 10),
                                      child: PinCodeTextField(
                                        appContext: context,
                                        textStyle: const TextStyle(
                                            color: Colors.black),
                                        pastedTextStyle: TextStyle(
                                          color: Colors.green.shade600,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        length: 4,
                                        // obscureText: true,
                                        // obscuringCharacter: '*',
                                        blinkWhenObscuring: true,
                                        animationType: AnimationType.fade,
                                        validator: (v) {
                                          if (v!.length < 4) {
                                            return Strings.enterYourOtp;
                                          } else {
                                            return null;
                                          }
                                        },
                                        pinTheme: PinTheme(
                                            inactiveFillColor: Colors.white,
                                            inactiveColor: Colors.white,
                                            shape: PinCodeFieldShape.circle,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            borderWidth: 1,
                                            fieldHeight: 60,
                                            fieldWidth: 60,
                                            activeColor: Colors.black,
                                            selectedColor: Colors.yellow,
                                            activeFillColor: Colors.white,
                                            selectedFillColor: Colors.white),
                                        cursorColor: Colors.black,
                                        animationDuration:
                                            const Duration(milliseconds: 300),
                                        enableActiveFill: true,
                                        enabled: true,
                                        // errorAnimationController: controller.errorController,
                                        controller: controller.verifyController,
                                        keyboardType: TextInputType.number,
                                        boxShadows: const [
                                          BoxShadow(
                                            offset: Offset(0, 1),
                                            color: Colors.black12,
                                            blurRadius: 10,
                                          )
                                        ],
                                        onCompleted: (v) {},
                                        onChanged: (value) {},
                                        beforeTextPaste: (text) {
                                          return true;
                                        },
                                      )),
                                ),
                                SizedBox(
                                  height: Get.height * 0.02,
                                ),
                                Center(
                                  child: Text(
                                    Strings.reciveCode,
                                    style: gilroyMediumTextStyle(
                                        color: ColorRes.white.withOpacity(0.5),
                                        fontSize: 16),
                                  ),
                                ),
                                SizedBox(
                                  height: Get.height * 0.022,
                                ),
                                GetBuilder<PhoneNumberController>(
                                  builder: (controller) {
                                    return InkWell(
                                      onTap: () {
                                        controller.phoneNumberRegister();
                                      },
                                      child: Center(
                                        child: Text(
                                          Strings.resendOtp,
                                          style: gilroyBoldTextStyle(
                                            fontSize: 16,
                                            color: ColorRes.color_69C200,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                SizedBox(
                                  height: Get.height * 0.04,
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    if (formKey.currentState!.validate()) {
                                      controller.verifyCode();
                                    }
                                  },
                                  child: Center(
                                    child: Container(
                                      width: Get.width * 0.84788,
                                      height: Get.height * 0.07575,
                                      decoration: BoxDecoration(
                                          color: ColorRes.color_E7D01F,
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Center(
                                          child: Text(
                                        Strings.verifyAccount,
                                        style: gilroyBoldTextStyle(
                                            color: Colors.black, fontSize: 16),
                                      )),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: Get.height * 0.04,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              controller.loader.isTrue ? const SmallLoader() : const SizedBox(),
            ],
          );
        },
      ),
    );
  }
}
