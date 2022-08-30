import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/loaders.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/screens/Home/my_story/my_story_controller.dart';
import 'package:rainbow/screens/Home/settings/connections/connections_profile/connections_profile_controller.dart';
import 'package:rainbow/screens/Home/story_commets/widget/story_comment.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/color_res.dart';

class MyStoryCommentsScreen extends StatelessWidget {
   MyStoryCommentsScreen({Key? key}) : super(key: key);
ConnectionsProfileController connectionsProfileController = Get.put(ConnectionsProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Image.asset(
              AssetRes.backIcon,
              height: 16,
              width: 16,
              color: Colors.black,
            ),
          ),
        ),
        title: Text(
          "Comments",
          style: beVietnamProBoldTextStyle(
            fontSize: 16,
            color: ColorRes.black,
          ),
        ),
        backgroundColor: ColorRes.white,
        elevation: 1,
      ),
      backgroundColor: ColorRes.white,
      body: GetBuilder<MyStoryController>(
        id: "myStoryComments",
        builder: (controller) {
          return Stack(
            children: [
              SafeArea(
                  child:Column(
                    children: [
                      controller.comments.isEmpty
                          ? Expanded(
                            child: Center(
                        child: Text(
                            "No comments",
                            style: gilroyBoldTextStyle(color: Colors.black),
                        ),
                      ),
                          )
                          : Expanded(
                        child: Container(
                          height: Get.height,
                          width: Get.width,
                          padding: const EdgeInsets.only(
                            left: 19,
                            right: 19,
                          ),
                          child: ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            padding: const EdgeInsets.only(top: 10),
                            itemBuilder: (context, index) {
                              return storyComment(comments:   controller.comments[index].description
                                  .toString()
                              ,
                             profileImage:    controller.comments[index].storyUserComment!
                                 .profileImage
                                 .toString(),
                             name:    controller
                                 .comments[index].storyUserComment!.fullName
                                 .toString(),
                                id:    controller
                                    .comments[index].storyUserComment!.id
                                    .toString(),connectionsProfileController: connectionsProfileController
                              );
                            },
                            separatorBuilder: (context, index) {
                              return Divider(
                                color: ColorRes.black.withOpacity(0.6),
                                height: 40,
                              );
                            },
                            itemCount: controller.comments.length,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(bottom: 10.0, top: 10),
                        width: Get.width,
                        decoration: BoxDecoration(
                          color: ColorRes.white,
                          boxShadow: [
                            BoxShadow(
                              color: ColorRes.black.withOpacity(0.05),
                              offset: const Offset(0, 0),
                              blurRadius: 20,
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            const SizedBox(width: 15),
                            Expanded(
                              child: SizedBox(
                                height: 40,
                                child: TextFormField(
                                  controller: controller.writeSomething,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(35),
                                    ),
                                    filled: true,
                                    fillColor: Colors.black.withOpacity(0.05),
                                    hintStyle:
                                    const TextStyle(color: ColorRes.color_999999),
                                    hintText: "send message",
                                    contentPadding:
                                    const EdgeInsets.only(top: 2, left: 15),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(35),
                                    ),
                                  ),
                                  style: const TextStyle(color: ColorRes.color_252525),
                                  onChanged: (_) => controller.pauseAnimation(),
                                ),
                              ),
                            ),
                            const SizedBox(width: 15),
                            InkWell(
                              onTap: () {
                                controller.commentSendTap(
                                    controller.currentStoryId.toString(), context);
                              },
                              child: Image.asset(
                                AssetRes.send,
                                height: 20,
                                width: 20,
                                color: ColorRes.color_50369C,
                              ),
                            ),
                            const SizedBox(width: 20),
                          ],
                        ),
                      ),
                      /*  Container(
                    width: Get.width,
                    decoration: BoxDecoration(color: ColorRes.white, boxShadow: [
                      BoxShadow(
                        color: ColorRes.black.withOpacity(0.5),
                        blurRadius: 15.0,
                        offset: const Offset(-10, 10),
                      )
                    ]),
                    padding: const EdgeInsets.only(
                      left: 19,
                      right: 12,
                      top: 10,
                      bottom: 15,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                       */ /* RichText(
                          text: TextSpan(
                            text: 'Replying to ',
                            style: beVietnamProRegularTextStyle(
                              fontSize: 14,
                              color: ColorRes.black,
                            ),
                            children: [
                              TextSpan(
                                text: "Maria Rosales",
                                style: beVietnamProMediumTextStyle(
                                  color: ColorRes.themeColor,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),*/ /*
                       */ /* Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.only(right: 5, top: 15),
                                child: Image.asset(
                                  AssetRes.commentCamera,
                                  height: 22,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 15.0, right: 5, top: 15),
                                child: Image.asset(
                                  AssetRes.commentGallery,
                                  height: 22,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: 40,
                                margin: const EdgeInsets.only(left: 5, top: 7),
                                padding: const EdgeInsets.only(
                                    left: 7, top: 7, bottom: 7, right: 7),
                                decoration: BoxDecoration(
                                  color: ColorRes.color_959595.withOpacity(0.5),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: TextField(
                                        controller: controller.commentController,
                                        decoration: InputDecoration(
                                          contentPadding: const EdgeInsets.only(
                                              top: 0, bottom: 12),
                                          border: InputBorder.none,
                                          hintText: Strings.typeYourReply,
                                          hintStyle: sfProTextReguler(
                                            fontSize: 17,
                                            color: ColorRes.black.withOpacity(0.40),
                                          ),
                                        ),
                                        style: sfProTextReguler(
                                          fontSize: 17,
                                          color: ColorRes.black,
                                        ),
                                        textInputAction: TextInputAction.newline,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: controller.onCommentSend,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 5, right: 5, top: 5, bottom: 5),
                                        child: Image.asset(
                                          AssetRes.commentSend,
                                          height: 17,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 5),
                          ],
                        ),*/ /*
                      ],
                    ),
                  ),*/
                    ],
                  )
              ),
              Obx(() {
                return controller.loader.isTrue?const FullScreenLoader():const SizedBox();
              })
            ],
          );
        },
      )
    );
  }
}
