import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/model/viewAdvertiserModel.dart';
import 'package:rainbow/screens/Home/settings/settings_controller.dart';
import 'package:rainbow/screens/Profile/profile_api/profile_model.dart';
import 'package:rainbow/screens/auth/auth_dashboard/auth_dashboard.dart';
import 'package:rainbow/service/pref_services.dart';
import 'package:rainbow/utils/pref_keys.dart';

logoutPopup({required BuildContext context}) {

  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius:
              BorderRadius.circular(20)),
          backgroundColor: Colors.white,
          title: Text("Logout", style: gilroySemiBoldTextStyle(fontSize: 18, color: Colors.black),),
          content: Text("Do you want to logout ?", style: gilroyMediumTextStyle(fontSize: 14, color: Colors.black),),
          actions: <Widget>[
            TextButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            Container(
              height: 20,
              width: 0.5,
              color: Colors.grey,

            ),
            TextButton(
              child: const Text('yes'),
              onPressed: () async{


                SettingsController controller = Get.put(SettingsController());
                Navigator.of(context).pop();
                await controller.logOutDetails();
                PrefService.clear();
              },
            ),
          ],
        );
      });

}


logoutPopupAdvertise({required BuildContext context}) {

  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius:
              BorderRadius.circular(20)),
          backgroundColor: Colors.white,
          title: Text("Logout", style: gilroySemiBoldTextStyle(fontSize: 18, color: Colors.black),),
          content: Text("Do you want to logout ?", style: gilroyMediumTextStyle(fontSize: 14, color: Colors.black),),
          actions: <Widget>[
            TextButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            Container(
              height: 20,
              width: 0.5,
              color: Colors.grey,

            ),
            TextButton(
              child: const Text('yes'),
              onPressed: () async{

                await PrefService.clear();
                Get.offAll(() => AuthDashboard());
                PrefService.setValue(PrefKeys.skipBoardingScreen, true);
                PrefService.clear();
              },
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
