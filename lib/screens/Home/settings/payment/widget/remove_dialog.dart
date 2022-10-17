import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/text_styles.dart';

import 'package:rainbow/screens/Home/settings/payment/payment_controller.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/strings.dart';

import '../../../../../utils/color_res.dart';

class RemoveDialog extends StatelessWidget {
  RemoveDialog({Key? key}) : super(key: key);

  final PaymentController paymentController = Get.put(PaymentController());

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.only(
          top: 0,
          bottom: Get.height * 0.37,
          left: Get.width * 0.07,
          right: Get.width * 0.07),
      backgroundColor: ColorRes.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: Get.height * 0.03201,
          ),
          Row(
            children: [
              SizedBox(width: Get.width * 0.04),
              Text(
                Strings.removeCard,
                style: montserratRegularTextStyle(
                    color: ColorRes.color_303030,
                    fontSize: 16,
                    letterSpacing: 0.01),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: Get.height * 0.02216),
                Text(
                  Strings.removeDialogDes,
                  style: montserratRegularTextStyle(
                    color: ColorRes.color_303030,
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: Get.height * 0.01990),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(
                      AssetRes.visalogo,
                      width: Get.width * 0.136,
                    ),
                    // SizedBox(
                    //   width: Get.width * 0.0571733,
                    // ),
                    Text(
                      Strings.endingIn0212,
                      style: montserratRegularTextStyle(
                        color: ColorRes.color_303030,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      Strings.date,
                      style: montserratRegularTextStyle(
                        color: ColorRes.color_303030,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: Get.height * 0.02709),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        height: Get.height * 0.04,
                        width: Get.width * 0.2112,
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(50)),
                            gradient: LinearGradient(
                              colors: [
                                ColorRes.colorF86666.withOpacity(1),
                                ColorRes.colorF82222.withOpacity(1),
                              ],
                            )),
                        child: Center(
                          child: Text(
                            Strings.removeDialogCancel,
                            style: gilroySemiBoldTextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.back();
                        paymentController.removeCardApi();
                      },
                      child: Container(
                        height: Get.height * 0.04,
                        width: Get.width * 0.2112,
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(50)),
                            gradient: LinearGradient(
                              colors: [
                                ColorRes.colorF6E24A.withOpacity(1),
                                ColorRes.colorFEE000.withOpacity(1),
                              ],
                            )),
                        child: Center(
                          child: Text(
                            Strings.confirm,
                            style: gilroySemiBoldTextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: Get.height * 0.0258,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
