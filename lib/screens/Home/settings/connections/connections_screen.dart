import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/loaders.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/model/request_user_model.dart';
import 'package:rainbow/model/suggestion_model.dart';
import 'package:rainbow/screens/Home/settings/connections/connections_controller.dart';
import 'package:rainbow/screens/Profile/profile_controller.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/color_res.dart';
import 'package:rainbow/utils/strings.dart';

class ConnectionsScreen extends StatelessWidget {
  ConnectionsScreen({Key? key}) : super(key: key);
  ConnectionsController controller = Get.put(ConnectionsController());
  ProfileController profileController = Get.put(ProfileController());

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
          child: Column(
            children: [
              appBar(),
              Expanded(
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          listOfRequest(),
                          listOfSuggestions(),
                        ],
                      ),
                    ),
                    Obx(() {
                      if (controller.loader.isTrue) {
                        return const FullScreenLoader();
                      } else {
                        return const SizedBox();
                      }
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget appBar() {
    return SizedBox(
      width: Get.width,
      child: Column(
        children: [
          SizedBox(
            height: Get.height * 0.03,
          ),
          Row(
            children: [
              SizedBox(
                width: Get.width * 0.05,
              ),
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Image.asset(
                  AssetRes.backIcon,
                  height: 16,
                  width: 16,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: Get.width * 0.2,
              ),
              GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Text(
                    Strings.connectionRequest,
                    style: gilroyBoldTextStyle(),
                  )),
              SizedBox(
                width: Get.width * 0.05,
              ),
            ],
          ),
          SizedBox(
            height: Get.height * 0.04,
          ),
        ],
      ),
    );
  }

  Widget listOfRequest() {
    return GetBuilder<ConnectionsController>(
      id: "connection",
      builder: (control) => Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.requestUsers.length,
            itemBuilder: (context, index) {
              RequestUser user = controller.requestUsers[index];
              return infoRow(
                name: user.fullName,
                image: user.profileImage,
                label: user.email,
                onPlusTap: () => control.onAddBtnTap(user.id.toString(), false),
                onDeleteTap: () =>
                    controller.onDeleteBtnTap(user.id.toString(), false),
                onProfileTap: () =>
                    controller.onTapViewProfile(user.id.toString()),
              );
            },
          )
        ],
      ),
    );
  }

  Widget listOfSuggestions() {
    return GetBuilder<ConnectionsController>(
      id: "connection",
      builder: (control) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: Get.height * 0.055, left: 20, bottom: Get.height * 0.02),
            child: Text(
              Strings.suggestedConnection,
              style: textStyleFont20W700,
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.suggestionConnection.length,
            itemBuilder: (context, index) {
              SuggestionUser user = controller.suggestionConnection[index];
              return infoRow(
                name: user.fullName,
                image: user.profileImage,
                label: user.email,
                onPlusTap: () => control.onAddBtnTap(user.id.toString(), true),
                onDeleteTap: () =>
                    controller.onDeleteBtnTap(user.id.toString(), true),
                onProfileTap: () =>
                    controller.onTapViewProfile(user.id.toString()),
              );
            },
          )
        ],
      ),
    );
  }

  Widget infoRow({
    String? name,
    String? label,
    String? image,
    VoidCallback? onPlusTap,
    VoidCallback? onDeleteTap,
    VoidCallback? onProfileTap,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 10),
      child: InkWell(
        onTap: onProfileTap,
        child: SizedBox(
          width: Get.width,
          child: Row(
            children: [
              SizedBox(width: Get.width * 0.043),
              SizedBox(
                height: Get.width * 0.1467,
                width: Get.width * 0.1467,
                child: CachedNetworkImage(
                  imageUrl: image.toString(),
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
              SizedBox(width: Get.width * 0.04),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name.toString(),
                      style: montserratRegularTextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      label.toString(),
                      style: montserratRegularTextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
              SizedBox(width: Get.width * 0.07),
              InkWell(
                onTap: onPlusTap,
                child: const SizedBox(
                  height: 40,
                  width: 40,
                  child: Image(
                    image: AssetImage(AssetRes.profilep),
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(width: Get.width * 0.04),
              InkWell(
                onTap: onDeleteTap,
                child: const SizedBox(
                  height: 40,
                  width: 40,
                  child: Image(image: AssetImage(AssetRes.delete)),
                ),
              ),
              SizedBox(width: Get.width * 0.02667),
            ],
          ),
        ),
      ),
    );
  }
}
