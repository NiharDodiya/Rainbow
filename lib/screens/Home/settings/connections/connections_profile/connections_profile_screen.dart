import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/loaders.dart';
import 'package:rainbow/model/profile_model.dart';
import 'package:rainbow/screens/Home/settings/connections/connections_profile/connections_profile_controller.dart';
import 'package:rainbow/screens/Profile/widget/connect_block.dart';
import 'package:rainbow/screens/Profile/widget/other_visitors_viewed.dart';
import 'package:rainbow/screens/Profile/widget/profileImage.dart';
import 'package:rainbow/screens/Profile/widget/profile_appbar.dart';
import 'package:rainbow/screens/Profile/widget/testimonials.dart';
import 'package:rainbow/utils/color_res.dart';

class ConnectionsProfileScreen extends StatelessWidget {
  ConnectionsProfileScreen({Key? key}) : super(key: key);

  ConnectionsProfileController controller =
      Get.put(ConnectionsProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (controller.loader.isTrue) {
          return const SmallLoader();
        } else {
          ProfileData data = controller.profileModel.data!;
          return Container(
            width: Get.width,
            padding: const EdgeInsets.only(top: 25),
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
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  profileAppbar(data.fullName.toString(),false),
                  profileImage(data.profileImage, data.backgroundImage),
                  connectAndBlock(title: data.fullName,subTitle: "Surrogate Mom"),
                  testimonials(),
                  otherVisitorsViewed(),
                ],
              ),
            ),
          );
        }
      }),
    );
  }
}
