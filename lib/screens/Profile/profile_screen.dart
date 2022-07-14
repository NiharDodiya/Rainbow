import 'package:cached_network_image/cached_network_image.dart';
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
    return Scaffold(body: Obx(() {
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
                      profileImagesLoad(controller),
                      profileDetails(),
                      aboutProfiler(Strings.aboutMe, Strings.aboutMeDes),
                      const SizedBox(
                        height: 30,
                      ),
                      hobbiesAndInterest(),
                      testimonials(),
                      otherVisitorsViewed(),
                    ],
                  ),
                ),
              );
            },
          ),
          controller.loader.isTrue ? const SmallLoader() : const SizedBox()
        ],
      );
    }));
  }

  Widget profileImagesLoad(ProfileController controller) {
    return SizedBox(
      height: 280,
      width: Get.width,
      child: Stack(
        children: [
          Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 25),
              child: SizedBox(
                height: Get.height * 0.2857,
                width: Get.width,
                child: CachedNetworkImage(
                  imageUrl:
                      controller.viewProfile.data!.backgroundImage.toString(),
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // placeholder: (context, url) =>const Center(child:CircularProgressIndicator(),),
                  errorWidget: (context, url, error) =>  Container(
                    height: Get.height * 0.2857,
                    width: Get.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                            image: AssetImage(AssetRes.overlay),
                            fit: BoxFit.cover)),
                  ),
                  fit: BoxFit.fill,
                ),
              )),
          Positioned(
            top: Get.height * 0.11,
            left: Get.width * 0.30,
            child: SizedBox(
              height: Get.height * 0.38666,
              width: Get.width * 0.38666,
              child: CachedNetworkImage(
                imageUrl:
                    controller.viewProfile.data!.backgroundImage.toString(),
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // placeholder: (context, url) => const Center(child:  CircularProgressIndicator(),),
                errorWidget: (context, url, error) =>
                    Image.asset(AssetRes.se_profile),
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
    return controller.viewProfile.data!.hobbiesAndInterest.toString() == ""
        ? SizedBox()
        : Padding(
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
                    controller.viewProfile.data!.hobbiesAndInterest
                                .toString() ==
                            ""
                        ? ""
                        : controller.viewProfile.data!.hobbiesAndInterest
                            .toString(),
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
