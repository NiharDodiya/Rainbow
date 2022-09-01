import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/loaders.dart';
import 'package:rainbow/screens/advertisement/ad_home/ad_home_controller.dart';
import 'package:rainbow/screens/advertisement/ad_home/screen/update_advertisement/update_advertisement_controller.dart';
import 'package:rainbow/screens/advertisement/ad_home/widget/advertisement_list.dart';
import 'package:rainbow/screens/advertisement/ad_home/widget/appbar.dart';
import 'package:rainbow/screens/advertisement/ad_home/widget/no_advertisement.dart';
import 'package:rainbow/utils/color_res.dart';
import '../../../common/Widget/text_styles.dart';
import '../../dashboard/dashboard_controller.dart';

class AdHomeScreen extends StatefulWidget {
  AdHomeScreen({Key? key}) : super(key: key);

  @override
  State<AdHomeScreen> createState() => _AdHomeScreenState();
}

class _AdHomeScreenState extends State<AdHomeScreen> {
  DashboardController dashboardController = Get.put(DashboardController());

  AdHomeController adHomeController = Get.put(AdHomeController());

  UpdateAdvertiseController updateAdvertiseController = Get.put(UpdateAdvertiseController());

  final DashboardController controller = Get.put(DashboardController());



  @override
  Widget build(BuildContext context) {
    adHomeController.myAdvertiserListData();
    return WillPopScope(
      onWillPop: () async {
        if (controller.currentTab == 0) {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(backgroundColor: Colors.white,
                  title: Text("Are you sure you want exit app",
                    style: gilroyBoldTextStyle(
                        fontSize: 20, color: Colors.black),),
                  actions: <Widget>[
                    FlatButton(
                      child: Text("ok", style: gilroyBoldTextStyle(
                          fontSize: 18, color: Colors.black),),
                      onPressed: () {
                        SystemNavigator.pop();
                      },
                    )
                  ],
                );
              });
        } else {
          controller.onBottomBarChange(0);
          setState(() {});
        }
        return false;
      },
        child: Scaffold(
      body: SafeArea(
          child:Container(
            width: Get.width,
            //height: Get.height - 80,
            //padding: const EdgeInsets.only(left: 30,right: 30,top: 40),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  ColorRes.color_50369C,
                  ColorRes.color_D18EEE,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Obx(() {
              return Stack(
                children: [
                  Column(
                    children: [
                      appbar(),
                      GetBuilder<AdHomeController>(
                          id: 'list',
                          builder: (controller) {
                            return (controller.myAdvertiserModel.data?.length ?? 0)==0
                                ? noAdvertisement()
                                : advertisementList();
                          }
                      ),
                    ],
                  ),
                  adHomeController.loader.isTrue?const FullScreenLoader():const SizedBox(),
                  updateAdvertiseController.loader.value==true?const FullScreenLoader():const SizedBox(),
                ],
              );
            }),
          )
      ),
    ),
    );
  }
}
