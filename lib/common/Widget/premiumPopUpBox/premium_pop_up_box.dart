import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/screens/Home/settings/payment/payment_screen.dart';
import 'package:rainbow/utils/color_res.dart';
import 'package:rainbow/utils/strings.dart';

premiumPopUpBox({required BuildContext context}) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          backgroundColor: Colors.white,
          actions: <Widget>[
            const SizedBox(
              height: 34,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Center(
                  child: SizedBox(
                      height: 40,
                      width: 152,
                      child: Text(
                        Strings.subscriptionPremium,
                        style: gilroySemiBoldTextStyle(
                            fontSize: 16, color: Colors.black),
                      ))),
            ),
            const SizedBox(
              height: 12,
            ),
            Center(
                child: Text(
              "£9.99 / month",
              style: gilroySemiBoldTextStyle(fontSize: 26, color: Colors.black),
            )),
            const SizedBox(
              height: 16,
            ),
            InkWell(
              onTap: () async {
                Navigator.pop(context);
                Get.to(PaymentScreen())
                    ?.then((value) => Navigator.pop(context));

                /* PaymentController paymentController = Get.put(PaymentController());
                 paymentController.loader.value = true;
                 await UserSubscriptionAddApi.userSubscriptionAddApi();
                 paymentController.loader.value = false;*/
                //subscribePopUp = false;
              },
              child: Center(
                child: Container(
                  height: 40,
                  width: 110,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(46.2),
                    gradient: const LinearGradient(
                      colors: [
                        ColorRes.color_4F359B,
                        ColorRes.color_B279DB,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.topRight,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "Subscribe",
                      style: gilroyBoldTextStyle(fontSize: 12),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 21,
            ),
          ],
        );
      });
  /*return showDialog(context: context, builder: (BuildContext context){
    return Padding(
      padding: EdgeInsets.only(top: 240, left: 40, right: 40, bottom: 240),
      child: Container(
        //height: Get.height / 4,
        width: Get.width / 1.3,
        decoration: BoxDecoration(
          color: ColorRes.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            const SizedBox(
              width: 130,
              child: Text(
                "Subscribe to our Premium Version",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: FontRes.gilroySemiBold,
                    color: ColorRes.appBlack,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "£9.99",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w100,
                    color: ColorRes.appBlack,
                    fontFamily: FontRes.gilroySemiBold,
                  ),
                ),
                Text(
                  "/",
                  style: TextStyle(color: ColorRes.appBlack, fontSize: 35),
                ),
                Text(
                  "month",
                  style: TextStyle(
                    fontSize: 35,
                    color: ColorRes.appBlack,
                    fontFamily: FontRes.gilroySemiBold,
                  ),
                ),
              ],
            ),
            Spacer(),
            GestureDetector(
              onTap: (){
                Get.to(PaymentScreen());
                subscribePopUp = false;
              },
              child: Container(
                height: Get.height / 18,
                width: Get.width / 2.5,
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
                    )),
                child: const Text(
                  "Subscribe",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: FontRes.gilroySemiBold,
                      color: ColorRes.white),
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  });*/
}

/*
Container(
    height: Get.height / 4,
    width: Get.width / 1.3,
    decoration: BoxDecoration(
      color: ColorRes.white,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Spacer(),
        const SizedBox(
          width: 130,
          child: Text(
            "Subscribe to our Premium Version",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: FontRes.gilroySemiBold,
                color: ColorRes.appBlack,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
        ),
        Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "£9.99",
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w100,
                color: ColorRes.appBlack,
                fontFamily: FontRes.gilroySemiBold,
              ),
            ),
            Text(
              "/",
              style: TextStyle(color: ColorRes.appBlack, fontSize: 35),
            ),
            Text(
              "month",
              style: TextStyle(
                fontSize: 35,
                color: ColorRes.appBlack,
                fontFamily: FontRes.gilroySemiBold,
              ),
            ),
          ],
        ),
        Spacer(),
        Container(
          height: Get.height / 18,
          width: Get.width / 2.5,
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
              )),
          child: const Text(
            "Subscribe",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                fontFamily: FontRes.gilroySemiBold,
                color: ColorRes.white),
          ),
        ),
        Spacer(),
      ],
    ),
  );
 */
