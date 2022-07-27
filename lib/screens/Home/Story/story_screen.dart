import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/loaders.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/screens/Home/view_story/view_story_controller.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/color_res.dart';
import 'package:rainbow/utils/strings.dart';

// ignore: must_be_immutable
class StoryScreen extends StatelessWidget {
  String? id;

  StoryScreen({this.id});

  ViewStoryController controller = Get.put(ViewStoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        actions: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Image.asset(
                  AssetRes.backIcon,
                  height: 16,
                  width: 16,
                  color: ColorRes.color_252525,
                ),
              ),
              SizedBox(
                width: Get.width * 0.8,
              ),
              GestureDetector(
                  onTap: () {
                    controller.createPostData(context);
                    /*    controller.commentSendTap(id!);
                        Get.back();*/
                    /*    controller.writeSomethings.clear();*/
                  },
                  child: Text(
                    Strings.post,
                    style:
                        gilroyBoldTextStyle(fontSize: 13, color: Colors.black),
                  )),
              SizedBox(
                width: Get.width * 0.05,
              ),
            ],
          )
        ],
      ),
      body: GetBuilder<ViewStoryController>(
        id: "createStory",
        builder: (controller) {
          return Obx(() {
            return Stack(
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: Get.height * 0.02,
                    ),
                    Container(margin: const EdgeInsets.only(left: 40),
                      height: Get.height * 0.28,
                      width: Get.width * 0.8,
                      decoration: BoxDecoration(
                        color: ColorRes.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextField(
                        controller: controller.writeSomethings,
                        maxLines: 7,
                        style: textFieldText,
                        decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.only(left: 20, top: 15),
                            border: InputBorder.none,
                            hintStyle: textStyleFont18Grey,
                            hintText: Strings.writeSomethings,
                            counterStyle: textStyleFont18Grey),
                      ),
                    ),
                    SizedBox(height: Get.height*0.2,),
                    controller.imageCamera!= null?Container(height: Get.height * 0.3,
                      margin: const EdgeInsets.only(left: 15),
                      child: Image.file(
                        controller.imageCamera!,
                        height: Get.height * 0.05,
                        width: Get.width * 0.28,
                        fit: BoxFit.contain,
                      ),
                    ): GetBuilder<ViewStoryController>(
                      id: "createStory",
                      builder: (controller) {
                        return controller.image == null
                            ? const SizedBox()
                            : SizedBox(
                          height: Get.height * 0.3,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.image.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.file(
                                  controller.image[index],
                                  height: Get.height * 0.05,
                                  width: Get.width * 0.28,
                                  fit: BoxFit.contain,
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),

                  ],
                ),
                Positioned(top: Get.height*0.025,left: 15,
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(AssetRes.se_profile))),
                  ),
                ),

                Positioned(
                  bottom: 0,
                  child: Container(
                    width: Get.width,
                    decoration: const BoxDecoration(
                        color: ColorRes.white, boxShadow: []),
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
                        /*        RichText(
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
                        ),*/
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                controller.navigateToCamera();
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(right: 5, top: 15),
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
                            /*  Expanded(
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
                                        controller: controller.writeSomethings,
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
                                      onTap:() {

                                      },
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
                            ),*/
                            const SizedBox(width: 5),
                          ],
                        ),
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
}
