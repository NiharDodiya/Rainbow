import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/screens/Home/view_story/view_story_controller.dart';
import 'package:rainbow/utils/color_res.dart';

import '../../../../common/Widget/text_styles.dart';
import '../../../../utils/asset_res.dart';

class LikesBottomShit extends StatelessWidget {
  LikesBottomShit({Key? key}) : super(key: key);

  final ViewStoryController controller = Get.find();

  @override
  Widget build(BuildContext context) {
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
                CachedNetworkImage(
                  height: 56,
                  width: 56,
                  imageUrl: controller
                      .friendStoryModel.data!.first.userDetail!.profileImage
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
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller
                          .friendStoryModel.data!.first.userDetail!.fullName
                          .toString(),
                      style: sfProTextReguler().copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: ColorRes.black,
                      ),
                    ),
                    Text(
                      controller
                          .friendStoryModel.data!.first.userDetail!.userStatus
                          .toString(),
                      style: sfProTextReguler().copyWith(
                        fontWeight: FontWeight.w300,
                        color: ColorRes.black,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Text(
                  "12:30",
                  style: sfProTextReguler().copyWith(
                    color: ColorRes.black,
                  ),
                ),
              ],
            ),
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
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              shrinkWrap: true,
              itemCount: controller.storyLikesList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      /*   ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                        ,
                          height: Get.width * 0.11,
                          width: Get.width * 0.11,
                          fit: BoxFit.cover,
                        ),
                      ),*/
                      CachedNetworkImage(
                        height: 56,
                        width: 56,
                        imageUrl: controller.storyLikesList[index].profileImage
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
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.storyLikesList[index].fullName
                                .toString(),
                            style: sfProTextReguler().copyWith(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: ColorRes.black,
                            ),
                          ),
                          Text(
                            controller.storyLikesList[index].userStatus
                                .toString(),
                            style: sfProTextReguler().copyWith(
                              fontWeight: FontWeight.w300,
                              color: ColorRes.black,
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      const Icon(Icons.favorite, color: ColorRes.red),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
