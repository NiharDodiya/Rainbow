import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/screens/Profile/widget/about_me.dart';
import 'package:rainbow/screens/Profile/widget/other_visitors_viewed.dart';
import 'package:rainbow/screens/Profile/widget/profileImage.dart';
import 'package:rainbow/screens/Profile/widget/profile_appbar.dart';
import 'package:rainbow/screens/Profile/widget/profile_details.dart';
import 'package:rainbow/screens/Profile/widget/testimonials.dart';
import 'package:rainbow/utils/color_res.dart';
import 'package:rainbow/utils/strings.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: Get.width,
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
                profileAppbar(Strings.profile),
                profileImage(),
                profileDetails(),
                aboutProfiler("About Me"),
                const SizedBox(height: 30,),
                aboutProfiler("Hobbies and Interest"),
                testimonials(),
                otherVisitorsViewed(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
