import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/screens/Home/settings/connections/connections_profile/connections_profile_controller.dart';
import 'package:rainbow/screens/Profile/profile_controller.dart';
import 'package:rainbow/utils/asset_res.dart';

Widget otherVisitorsViewed() {
  ProfileController controller = Get.put(ProfileController());
  ConnectionsProfileController connectionsProfileController =
      Get.put(ConnectionsProfileController());
  return Padding(
    padding: const EdgeInsets.only(left: 30, right: 30),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          controller.viewProfile.data == null ? "" : "Other Visitors Viewed",
          style: beVietnamProBoldTextStyle(fontSize: 18),
        ),
        SizedBox(
          height: 130,
          child: ListView.builder(
            padding: const EdgeInsets.only(top: 5),
            itemCount: controller.viewProfile.data == null
                ? 0
                : controller.viewProfile.data!.userView!.length,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  InkWell(
                    onTap: () {
                      connectionsProfileController.callApi(controller
                          .viewProfile.data!.userView![index].id
                          .toString());
                    },
                    child: Container(
                      height: 60,
                      width: 60,
                      margin: const EdgeInsets.only(
                          right: 10, left: 10, top: 10, bottom: 7),
                      child: CachedNetworkImage(
                        imageUrl: controller
                            .viewProfile.data!.userView![index].profileImage
                            .toString(),
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
                  SizedBox(
                    width: 60,
                    child: Text(
                      controller.viewProfile.data!.userView![index].fullName
                          .toString(),
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: gilroyRegularTextStyle(fontSize: 16),
                    ),
                  )
                ],
              );
            },
          ),
        )
      ],
    ),
  );
}
