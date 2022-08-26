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
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/color_res.dart';
import 'package:rainbow/utils/strings.dart';
import 'package:readmore/readmore.dart';

class ProfileScreen extends StatelessWidget {
  int i;
  ProfileScreen({Key? key, required this.i}) : super(key: key);
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: Get.height * 0.035,
                    ),
                    Expanded(
                      flex: 1,
                      child: profileAppbar(
                          Strings.profile, true, context, i, controller.onTapToHomeScreen),
                    ),
                    //controller.onTapToHomeScreen
                    Expanded(
                      flex: 13,
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            profileImagesLoad(controller),
                            profileDetails(),
                            aboutProfiler(
                              Strings.aboutMe,
                              controller.viewProfile.data == null
                                  ? ""
                                  : controller.viewProfile.data!.about
                                      .toString(),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            hobbiesAndInterest(),
                            testimonial(controller),
                            otherVisitorsViewed(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          controller.loader.isTrue ? const FullScreenLoader() : const SizedBox()
        ],
      );
    }));
  }

  Widget profileImagesLoad(ProfileController controller) {
    return SizedBox(
      height: Get.height * 0.425,
      width: Get.width,
      child: Stack(
        children: [
          Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 25),
              child: SizedBox(
                height: Get.height * 0.2857,
                width: Get.width,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    controller.viewProfile.data == null
                        ? ""
                        : controller.viewProfile.data!.backgroundImage
                            .toString(),
                    height: Get.height * 0.2857,
                    width: Get.width,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: Get.height * 0.2857,
                        width: Get.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: const DecorationImage(
                                image: AssetImage(AssetRes.overlay),
                                fit: BoxFit.cover)),
                      );
                    },
                  ),
                ),

                /*  CachedNetworkImage(
                  imageUrl: controller.viewProfile.data == null
                      ? ""
                      : controller.viewProfile.data!.backgroundImage.toString(),
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
                  errorWidget: (context, url, error) => Container(
                    height: Get.height * 0.2857,
                    width: Get.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                            image: AssetImage(AssetRes.overlay),
                            fit: BoxFit.cover)),
                  ),
                  fit: BoxFit.fill,
                ),*/
              )),
          Positioned(
            top: Get.height * 0.11,
            left: Get.width * 0.30,
            child: SizedBox(
              height: Get.height * 0.38666,
              width: Get.width * 0.38666,
              child: CachedNetworkImage(
                imageUrl: controller.viewProfile.data == null
                    ? ""
                    : controller.viewProfile.data!.profileImage.toString(),
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
                errorWidget: (context, url, error) => Container(
                    decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(AssetRes.portrait_placeholder),
                  ),
                )),
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
    return controller.viewProfile.data == null
        ? const SizedBox()
        :  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        Padding(padding: const EdgeInsets.only(left: 28),
        child: Text(
          Strings.hobbies,
          style: beVietnamProBoldTextStyle(fontSize: 18),
        ),),
        Container(
          margin: const EdgeInsets.only(top: 15),
          child: (controller.viewProfile.data!.hobbiesAndInterest.toString() == '')
              ?const Center(
            child: Text("-"),
          )
              :Padding(padding: const EdgeInsets.only(left: 28),child: Align(
            alignment: Alignment.topLeft,
            child: ReadMoreText(
              controller.viewProfile.data!.hobbiesAndInterest
                  .toString(),
              /* aboutMe,*/
              trimLines: 3,
              trimMode: TrimMode.Line,
              delimiter: " ",
              trimCollapsedText: Strings.seeMore,
              trimExpandedText: Strings.seeLess,
              style: beVietnamProRegularTextStyle(
                  color: ColorRes.white.withOpacity(0.70),fontSize: 18
              ),
              moreStyle: beVietnamProRegularTextStyle(
                color: ColorRes.color_FF6B97,
              ),
              lessStyle: beVietnamProRegularTextStyle(
                color: ColorRes.color_FF6B97,
              ),
            ),
          ),),
          // child: ReadMoreText(
          //   controller.viewProfile.data!.hobbiesAndInterest
          //       .toString() ==
          //       ""
          //       ? "-": controller.viewProfile.data!.hobbiesAndInterest
          //       .toString(),
          //   /* aboutMe,*/
          //   trimLines: 3,
          //   trimMode: TrimMode.Line,
          //   delimiter: " ",
          //   trimCollapsedText: Strings.seeMore,
          //   trimExpandedText: Strings.seeLess,
          //   style: beVietnamProRegularTextStyle(
          //       color: ColorRes.white.withOpacity(0.70),fontSize: 18
          //   ),
          //   moreStyle: beVietnamProRegularTextStyle(
          //     color: ColorRes.color_FF6B97,
          //   ),
          //   lessStyle: beVietnamProRegularTextStyle(
          //     color: ColorRes.color_FF6B97,
          //   ),
          // ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Widget testimonial(ProfileController controller) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: controller.viewProfile.data == null
          ? const SizedBox()
          : SizedBox(
              // height: 435,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        Strings.testimonials,
                        style: beVietnamProBoldTextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  controller.viewProfile.data!.testimonialsList!.isEmpty
                      ? Center(
                          child: Text(
                            "-",
                            style: beVietnamProBoldTextStyle(
                                color: ColorRes.white.withOpacity(0.70),
                                fontSize: 16),
                          ),
                        )
                      : controller.viewTestimonials(),
                  controller.viewProfile.data!.testimonialsList!.isEmpty
                      ? const SizedBox()
                      : Column(
                          children: [
                            Divider(
                              height: 25,
                              color: ColorRes.white.withOpacity(0.7),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                controller.count == 1
                                    ? const SizedBox(width: 20)
                                    : InkWell(
                                        onTap: () {
                                          controller.count--;
                                          controller.update(["profile"]);
                                        },
                                        child: Container(
                                          height: 20,
                                          width: 20,
                                          margin: const EdgeInsets.only(
                                            left: 10,
                                            right: 10,
                                            bottom: 10,
                                            top: 5,
                                          ),
                                          child: Image.asset(
                                            AssetRes.leftIcon,
                                            height: 20,
                                            width: 20,
                                          ),
                                        ),
                                      ),
                                Container(
                                  height: 20,
                                  width: 30,
                                  margin:
                                      const EdgeInsets.only(bottom: 10, top: 5),
                                  alignment: Alignment.center,
                                  child: Text(
                                    controller.count.toString(),
                                    style: gilroyMediumTextStyle(fontSize: 14),
                                  ),
                                ),
                                controller.count ==
                                        (controller.viewProfile.data!
                                                    .testimonialsList!.length /
                                                2)
                                            .ceil()
                                    ? const SizedBox(width: 40)
                                    : InkWell(
                                        onTap: () {
                                          controller.count++;
                                          controller.update(["profile"]);
                                        },
                                        child: Container(
                                          height: 20,
                                          width: 20,
                                          margin: const EdgeInsets.only(
                                            left: 10,
                                            right: 10,
                                            bottom: 10,
                                            top: 5,
                                          ),
                                          child: Image.asset(
                                            AssetRes.rightIcon,
                                            height: 20,
                                            width: 20,
                                          ),
                                        ),
                                      )
                              ],
                            ),
                          ],
                        )
                ],
              ),
            ),
    );
  }
}
