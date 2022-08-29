import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/screens/Home/home_controller.dart';
import 'package:rainbow/screens/Home/settings/connections/connections_controller.dart';
import 'package:rainbow/screens/Home/settings/connections/connections_profile/connections_profile_controller.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/color_res.dart';

class PostViewBottomScreen extends StatelessWidget {
  String? postId;
   PostViewBottomScreen({Key? key,this.postId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ConnectionsProfileController connectionsProfileController =Get.put(ConnectionsProfileController());
    return GetBuilder<HomeController>(
      id: "postLikeList",
      builder: (controller) {
        return Container(
          width: Get.width,
          constraints: BoxConstraints(
            maxHeight: Get.height * 0.9,
            minHeight: Get.height * 0.5,
          ),
          decoration: const BoxDecoration(
            color: ColorRes.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: Get.height * 0.02),
              Container(
                height: 2,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: ColorRes.lightGrey,
                ),
              ),
              SizedBox(height: Get.height * 0.03),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    /* CachedNetworkImage(height: 56,
                    width: 56,
                    imageUrl: myStoryController.myStoryModel.data.p,
                    imageBuilder: (context, imageProvider) =>
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                    // placeholder: (context, url) =>const Center(child:CircularProgressIndicator(),),
                    errorWidget: (context, url, error) => Container(
                      height: 56,
                      width: 56,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage(AssetRes.homePro))),
                    ),
                    fit: BoxFit.fill,
                  ),*/
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /*Text(
                        myStoryController.friendStoryModel.data!.first.userDetail!.fullName.toString(),
                        style: sfProTextReguler().copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: ColorRes.black,
                        ),
                      ),*/
                        /*  Text(
                        controller.friendStoryModel.data!.first.userDetail!.userStatus.toString(),
                        style: sfProTextReguler().copyWith(
                          fontWeight: FontWeight.w300,
                          color: ColorRes.black,
                        ),
                      ),*/
                      ],
                    ),
                    /*  const Spacer(),
                  Text(
                    "12:30",
                    style: sfProTextReguler().copyWith(
                      color: ColorRes.black,
                    ),
                  ),*/
                  ],
                ),
              ),
              Text(
                "Views",
                style: gilroyBoldTextStyle(color: Colors.black),
              ),
              SizedBox(height: Get.height * 0.02463),
              Container(
                height: 2,
                width: Get.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: ColorRes.lightGrey,
                ),
              ),

              /*    myStoryController.storyLikeList.isEmpty
                ? Padding(
              padding:  EdgeInsets.only(top: Get.height*0.4),
              child: Text(
                "No Likes",
                style: gilroyBoldTextStyle(color: Colors.black),
              ),
            )
                : */
              controller.postViewUser!.isEmpty
                  ? Center(
                      child: Padding(
                          padding: EdgeInsets.only(top: Get.height * 0.35),
                          child: SizedBox(
                            child: Text(
                              "No Views",
                              style: gilroyBoldTextStyle(color: Colors.black),
                            ),
                          )))
                  : Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        shrinkWrap: true,
                        itemCount: controller.postViewUser!.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: InkWell(onTap: () {
                              connectionsProfileController.callApi(controller.postViewUser![index].id.toString());
                              print(controller.postViewUser![index].id.toString());
                            },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CachedNetworkImage(
                                    height: 56,
                                    width: 56,
                                    imageUrl: controller
                                        .postViewUser![index].profileImage
                                        .toString(),
                                    imageBuilder: (context, imageProvider) =>
                                        Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    // placeholder: (context, url) =>const Center(child:CircularProgressIndicator(),),
                                    errorWidget: (context, url, error) =>
                                        Container(
                                      height: 56,
                                      width: 56,
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image:
                                                  AssetImage(AssetRes.homePro))),
                                    ),
                                    fit: BoxFit.fill,
                                  ),
                                  const SizedBox(width: 16),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        controller.postViewUser![index].fullName
                                            .toString(),
                                        style: sfProTextReguler().copyWith(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w700,
                                          color: ColorRes.black,
                                        ),
                                      ),
                                      Text(
                                        controller.postViewUser![index].userStatus
                                            .toString(),
                                        style: sfProTextReguler().copyWith(
                                          fontWeight: FontWeight.w300,
                                          color: ColorRes.black,
                                          fontSize: 11,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
            ],
          ),
        );
      },
    );
  }
}
