import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/utils/color_res.dart';

Widget premiumPopUpBox() {
  return Container(
    height: Get.height / 4,
    width: Get.width / 1.3,
    decoration: BoxDecoration(
      color: ColorRes.white,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:  [
        Spacer(),
        const SizedBox(
          width: 130,
          child:  Text(
            "Subscribe to our Premium Version",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Gilroy-SemiBold',
              color: ColorRes.appBlack,
              fontSize: 16,
              fontWeight: FontWeight.w500
            ),
          ),
        ),
        Spacer(),
        Row(
         mainAxisAlignment: MainAxisAlignment.center,
          children: const[
            Text("£9.99", style: TextStyle(fontSize: 35, fontWeight: FontWeight.w100 ,color: ColorRes.appBlack,  fontFamily: 'Gilroy-SemiBold',),),
            Text("/", style: TextStyle(color: ColorRes.appBlack, fontSize: 35),),
            Text("month", style: TextStyle(fontSize: 35,  color: ColorRes.appBlack,  fontFamily: 'Gilroy-SemiBold',),),
          ],
        ),
        Spacer(),
        Container(
          height: Get.height/18,
          width: Get.width/2.5,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
              gradient: const LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  ColorRes.color_B279DB,
                  ColorRes.color_4F359B,
                ],
              )
          ),
          child: const Text("Subscribe", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
        ),
        Spacer(),
      ],
    ),
  );
}
