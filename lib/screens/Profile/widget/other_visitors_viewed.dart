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
        const SizedBox(
          height: 10,
        ),
        Text(
          "Other Visitors Viewed",
          style: beVietnamProBoldTextStyle(fontSize: 18),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 130,
          child: ListView.builder(
            itemCount: controller.viewProfile.data!.userView.length,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return  Column(
                children: [
                  InkWell(
                    onTap: () {
                      connectionsProfileController.callApi(controller.viewProfile.data!.userView[index]["id"]
                          .toString());
                      // Get.to(() => ConnectionsProfileScreen());
                    },
                    child: Container(
                      height: 60,
                      width: 60,
                      margin:
                      const EdgeInsets.only(right: 10, left: 10, top: 10, bottom: 7),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(
                            controller.image[index] ?? AssetRes.selfiePicture,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 60,
                    child: Text(
                      controller.viewProfile.data!.userView[index]
                      ["full_name"] ?? "Amber Davis",
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: gilroyRegularTextStyle(fontSize: 16),
                    ),
                  )
                ],
              );


                visitors(
                  title: controller.viewProfile.data!.userView[index]
                      ["full_name"],
                  image: controller.image[index],
                  userId: controller.viewProfile.data!.userView[index]["id"]
                      .toString());
            },
          ),
        )
      ],
    ),
  );
}

Widget visitors(
    {String? image,
    String? title,
    String? userId,
    ConnectionsProfileController? connectionsProfileController}) {
  return Column(
    children: [
      InkWell(
        onTap: () {
          connectionsProfileController!.callApi(userId);
          // Get.to(() => ConnectionsProfileScreen());
        },
        child: Container(
          height: 60,
          width: 60,
          margin:
              const EdgeInsets.only(right: 10, left: 10, top: 10, bottom: 7),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(
                image ?? AssetRes.selfiePicture,
              ),
            ),
          ),
        ),
      ),
      SizedBox(
        width: 60,
        child: Text(
          title ?? "Amber Davis",
          maxLines: 2,
          textAlign: TextAlign.center,
          style: gilroyRegularTextStyle(fontSize: 16),
        ),
      )
    ],
  );
}
