import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/loaders.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/screens/Profile/profile_controller.dart';
import 'package:rainbow/screens/Profile/widget/about_me.dart';
import 'package:rainbow/screens/Profile/widget/other_visitors_viewed.dart';
import 'package:rainbow/screens/Profile/widget/profile_appbar.dart';
import 'package:rainbow/screens/Profile/widget/profile_details.dart';
import 'package:rainbow/screens/Profile/widget/testimonials.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/color_res.dart';
import 'package:rainbow/utils/strings.dart';
import 'package:readmore/readmore.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);
  ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    controller.onInit();
    return Scaffold(
      body: Obx((){
        return Stack(
          children: [
            GetBuilder<ProfileController>(
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
                        // profileImage(/*controller*/
                        //     controller.viewProfile.data==null?"":controller.viewProfile.data!.backgroundImage.toString(),
                        //     controller.viewProfile.data==null?"":controller.viewProfile.data!.profileImage.toString()
                        // ),
                        profileImagesLoad(controller),
                        profileDetails(controller),
                        aboutProfiler(
                            Strings.aboutMe,
                            /* controller.viewProfile.data == null
                              ? */
                            Strings
                                .aboutMeDes /*   : controller.viewProfile.data!.aboutMe.toString()*/),
                        const SizedBox(
                          height: 30,
                        ),
                        hobbiesAndInterest(),
                        /* aboutProfiler(
                          "Hobbies and Interest",
                          controller.viewProfile.data == null
                              ? ""
                              : controller.viewProfile.data!.hobbiesAndInterest
                                  .toString()),*/
                        testimonials(),
                        otherVisitorsViewed(),
                      ],
                    ),
                  ),
                );
              },
            ),
            controller.loader.isTrue?SmallLoader():SizedBox()
          ],
        );
      } )

    );
  }

  Widget profileImagesLoad(ProfileController controller) {
    return SizedBox(
      height: 292,
      width: Get.width,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 25),
            child: controller.viewProfile.data != null
                ? Container(
                    height: Get.height * 0.2857,
                    width: Get.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(controller
                            .viewProfile.data!.backgroundImage
                            .toString()),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                : Container(
                    height: Get.height * 0.2857,
                    width: Get.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                        image: AssetImage(AssetRes.overlay),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
          ),
          Positioned(
            top: Get.height * 0.11,
            left: Get.width * 0.30,
            child: controller.viewProfile.data != null
                ? Container(
                    height: Get.height * 0.38666,
                    width: Get.width * 0.38666,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(controller
                            .viewProfile.data!.profileImage
                            .toString()),
                        fit: BoxFit.contain,
                      ),
                    ),
                  )
                : Container(
                    height: Get.height * 0.38666,
                    width: Get.width * 0.38666,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: const DecorationImage(
                        image: AssetImage(AssetRes.se_profile),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
          ),
          Positioned(
            top: Get.height * 0.35,
            left: Get.width * 0.599,
            child: Container(
              height: 30,
              width: 30,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(AssetRes.checkMark),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget hobbiesAndInterest() {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Text(
            Strings.hobbies,
            style: beVietnamProBoldTextStyle(fontSize: 18),
          ),
          Container(
            margin: const EdgeInsets.only(top: 15),
            child: ReadMoreText(
                controller.viewProfile.data==null?"": controller.viewProfile.data!.hobbiesAndInterest.toString(),
              /* aboutMe,*/
              trimLines: 3,
              trimMode: TrimMode.Line,
              delimiter: " ",
              trimCollapsedText: Strings.seeMore,
              trimExpandedText: Strings.seeLess,
              style: beVietnamProRegularTextStyle(
                color: ColorRes.white.withOpacity(0.70),
              ),
              moreStyle: beVietnamProRegularTextStyle(
                color: ColorRes.color_FF6B97,
              ),
              lessStyle: beVietnamProRegularTextStyle(
                color: ColorRes.color_FF6B97,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
