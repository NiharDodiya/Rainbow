import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/screens/Profile/profile_controller.dart';
import 'package:rainbow/screens/Profile/widget/about_me.dart';
import 'package:rainbow/screens/Profile/widget/other_visitors_viewed.dart';
import 'package:rainbow/screens/Profile/widget/profileImage.dart';
import 'package:rainbow/screens/Profile/widget/profile_appbar.dart';
import 'package:rainbow/screens/Profile/widget/profile_details.dart';
import 'package:rainbow/screens/Profile/widget/testimonials.dart';
import 'package:rainbow/utils/color_res.dart';
import 'package:rainbow/utils/strings.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);
  ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    controller.onInit();
    return Scaffold(
      body: GetBuilder<ProfileController>(
        id: "profile",
        builder: (controller) {
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  profileAppbar(Strings.profile, true),
                  profileImage(
                      controller.viewProfile.data==null?"":controller.viewProfile.data!.backgroundImage.toString(),
                      controller.viewProfile.data==null?"":controller.viewProfile.data!.profileImage.toString()),
                  profileDetails(controller),
                  aboutProfiler(
                      "About Me",
                      controller.viewProfile.data == null
                          ? ""
                          : controller.viewProfile.data!.aboutMe.toString()),
                  const SizedBox(
                    height: 30,
                  ),
                  aboutProfiler(
                      "Hobbies and Interest",
                      controller.viewProfile.data == null
                          ? ""
                          : controller.viewProfile.data!.hobbiesAndInterest
                              .toString()),
                  testimonials(),
                  otherVisitorsViewed(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
