import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/loaders.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/screens/Home/comments/comments_controller.dart';
import 'package:rainbow/screens/Home/comments/widget/user_comment.dart';
import 'package:rainbow/screens/Home/home_controller.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/color_res.dart';
import 'package:rainbow/utils/strings.dart';

class CommentScreen extends StatelessWidget {
  String? idPost;
  String? profileImage;
  String? fullName;

  CommentScreen({this.idPost, this.profileImage, this.fullName, Key? key})
      : super(key: key);
  CommentsController controller = Get.put(CommentsController());
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: InkWell(
            onTap: () => Get.back(),
            child: const Icon(
              Icons.chevron_left,
              color: ColorRes.black,
              size: 25,
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
        body: SafeArea(
          child: GetBuilder<CommentsController>(
            id: "commentPost",
            builder: (controller) {
              return Obx(() {
                return Stack(
                  children: [
                    Column(
                      children: [
                        Expanded(
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
                                return userComment(
                                    image: homeController.postCommentListModel
                                        .data![index].postCommentItem
                                        .toString(),
                                    description: homeController
                                        .postCommentListModel
                                        .data![index]
                                        .description
                                        .toString(),
                                    fullName: homeController
                                        .postCommentListModel
                                        .data![index]
                                        .postCommentUser!
                                        .fullName
                                        .toString(),
                                    profileImage: profileImage,
                                    reply: homeController.postCommentListModel
                                        .data![index].postCommentReply,
                                    commentId: homeController
                                        .postCommentListModel.data![index].id
                                        .toString(),date: homeController
                                    .postCommentListModel.data![index].createdAt);
                              },
                              separatorBuilder: (context, index) {
                                return Divider(
                                  color: ColorRes.black.withOpacity(0.6),
                                  height: 40,
                                );
                              },
                              itemCount:
                                  homeController.postCommentListModel.data ==
                                          null
                                      ? 0
                                      : homeController
                                          .postCommentListModel.data!.length,
                            ),
                          ),
                        ),
                        controller.imageForCamera == null
                            ? const SizedBox()
                            : Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: FileImage(
                                            controller.imageForCamera!))),
                              ),
                        Container(
                          width: Get.width,
                          decoration:
                              BoxDecoration(color: ColorRes.white, boxShadow: [
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
                              RichText(
                                text: TextSpan(
                                  text:
                                      'Replying to ${controller.nameComment == null ? "" : controller.nameComment.toString()}...',
                                  style: beVietnamProRegularTextStyle(
                                    fontSize: 14,
                                    color: ColorRes.black,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: "",
                                      style: beVietnamProMediumTextStyle(
                                        color: ColorRes.themeColor,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      controller.navigateToCamera();
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          right: 5, top: 15),
                                      child: Image.asset(
                                        AssetRes.commentCamera,
                                        height: 22,
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      controller.navigateToGallery();
                                    },
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
                                      margin: const EdgeInsets.only(
                                          left: 5, top: 7),
                                      padding: const EdgeInsets.only(
                                          left: 7, top: 7, bottom: 7, right: 7),
                                      decoration: BoxDecoration(
                                        color: ColorRes.color_959595
                                            .withOpacity(0.5),
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(15),
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: TextField(
                                              controller:
                                                  controller.msgController,
                                              decoration: InputDecoration(
                                                contentPadding:
                                                    const EdgeInsets.only(
                                                        top: 0, bottom: 12),
                                                border: InputBorder.none,
                                                hintText: Strings.typeYourReply,
                                                hintStyle: sfProTextReguler(
                                                  fontSize: 17,
                                                  color: ColorRes.black
                                                      .withOpacity(0.40),
                                                ),
                                              ),
                                              style: sfProTextReguler(
                                                fontSize: 17,
                                                color: ColorRes.black,
                                              ),
                                              textInputAction:
                                                  TextInputAction.newline,
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () async {
                                               controller.onTapSendMsg(
                                                  context, idPost.toString());
                                              FocusScope.of(context).unfocus();
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5,
                                                  right: 5,
                                                  top: 5,
                                                  bottom: 5),
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
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    controller.loader.isTrue
                        ? const FullScreenLoader()
                        : const SizedBox()
                  ],
                );
              });
            },
          ),
        ));
  }
}
