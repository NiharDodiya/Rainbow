import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/loaders.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/model/profile_model.dart';
import 'package:rainbow/screens/Home/settings/connections/connections_profile/connections_profile_controller.dart';
import 'package:rainbow/screens/Home/settings/connections/connections_profile/widgets/hobbies_area.dart';
import 'package:rainbow/screens/Home/settings/connections/connections_profile/widgets/social_icons.dart';
import 'package:rainbow/screens/Profile/profile_controller.dart';
import 'package:rainbow/screens/Profile/widget/about_me.dart';
import 'package:rainbow/screens/Profile/widget/connect_block.dart';
import 'package:rainbow/screens/Profile/widget/other_visitors_viewed.dart';
import 'package:rainbow/screens/Profile/widget/postTestimonial_screen/postTestimonial_screen.dart';
import 'package:rainbow/screens/Profile/widget/profileImage.dart';
import 'package:rainbow/screens/Profile/widget/profile_appbar.dart';
import 'package:rainbow/screens/Profile/widget/testimonials.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/color_res.dart';
import 'package:rainbow/utils/strings.dart';

class ConnectionsProfileScreen extends StatelessWidget {
  ConnectionsProfileScreen({Key? key}) : super(key: key);

  ConnectionsProfileController controller =
      Get.put(ConnectionsProfileController());
  ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ConnectionsProfileController>(
        id: "connections",
        builder: (controller) {
          return Obx(() {
            ProfileData data = controller.profileModel.data ?? ProfileData();
            return Stack(
              children: [
                Container(
                  height: Get.height,
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
                  child: data.id == null
                      ? const SizedBox()
                      : SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: data.isBlock == "block"
                              ? Container(
                                  height: Get.height,
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
                                  child: Center(
                                      child: Text(
                                    "Profile Not Visible",
                                    style: gilroyBoldTextStyle(),
                                  )))
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    profileAppbar(data.fullName.toString(),
                                        false, controller.onTapGetBack),
                                    const SizedBox(height: 20),
                                    profileImage(
                                      data.profileImage,
                                      data.backgroundImage,
                                      data.profilePhoto,
                                    ),
                                    connectAndBlock(
                                      title: data.fullName,
                                      subTitle: data.basicInfo == true
                                          ? data.userStatus
                                          : null,
                                      id: data.id.toString(),
                                      connect: data.isFriends.toString(),
                                      block: data.isBlock,
                                    ),
                                    data.socialMedia == true
                                        ? SocialIcons()
                                        : const SizedBox(),
                                    data.aboutMe == false
                                        ? const SizedBox()
                                        : aboutProfiler(Strings.aboutMe,
                                            data.about.toString()),
                                    data.hobbiesInterest == true
                                        ? HobbiesArea()
                                        : const SizedBox(),
                                    data.testimonials == true
                                        ? testimonial(  data.id.toString())
                                        : const SizedBox(),
                                    data.visitors == true
                                        ? otherVisitorsViewed()
                                        : const SizedBox(),
                                  ],
                                ),
                        ),
                ),
                controller.loader.isTrue
                    ? const FullScreenLoader()
                    : const SizedBox()
              ],
            );
          });
        },
      ),
    );
  }
  Widget testimonial(String id) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: SizedBox(
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
                const Spacer(),
                InkWell(
                  onTap: () {
                    Get.to(() => PostTestimonialScreen(
                      id: id.toString(),
                    ));
                  },
                  child: Text(
                    "Add",
                    style: beVietnamProBoldTextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                Strings.noTestimonials,
                style: beVietnamProBoldTextStyle(
                    color: ColorRes.white.withOpacity(0.70), fontSize: 16),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
           /* ListView.separated(
              padding: const EdgeInsets.only(top: 15),
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return  SizedBox()*//*listOfTestimonials(
                    title: controller.viewProfile.data!
                        .testimonialsList![index].userSender!.fullName.toString(),
                    subtitle: controller.viewProfile.data!
                        .testimonialsList![index].userSender!.userStatus.toString(),descriptions:controller.viewProfile.data!
                    .testimonialsList![index].testimonial.toString(),date:DateFormat("Dd-MM-yyyy").format(controller.viewProfile.data!
                    .testimonialsList![index].userSender!.createdAt!)profile:controller.viewProfile.data!
                    .testimonialsList![index].userSender!.profileImage.toString() )*//*;
              },
              separatorBuilder: (context, index) {
                return Divider(
                  height: 24,
                  color: ColorRes.white.withOpacity(0.7),
                );
              },
              itemCount: controller.viewProfile.data!.testimonialsList!.length,
              shrinkWrap: true,
            ),*/
            Divider(
              height: 25,
              color: ColorRes.white.withOpacity(0.7),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Container(
                  height: 20,
                  width: 30,
                  margin: const EdgeInsets.only(bottom: 10, top: 5),
                  alignment: Alignment.center,
                  child: Text(
                    "1",
                    style: gilroyMediumTextStyle(fontSize: 14),
                  ),
                ),
                iconForSlider(AssetRes.rightIcon),
              ],
            )
          ],
        ),
      ),
    );
  }
}
