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
import 'package:rainbow/screens/Profile/widget/profileImage.dart';
import 'package:rainbow/screens/Profile/widget/profile_appbar.dart';
import 'package:rainbow/screens/Profile/widget/testimonials.dart';
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
                                    profileAppbar(
                                        data.fullName.toString(), false),
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
                                    data.hobbiesInterest == true
                                        ? testimonials()
                                        : const SizedBox(),
                                    data.visitors == true
                                        ? otherVisitorsViewed()
                                        : const SizedBox(),
                                  ],
                                ),
                        ),
                ),
                controller.loader.isTrue
                    ? const SmallLoader()
                    : const SizedBox()
              ],
            );
          });
        },
      ),
    );
  }
}
