import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/loaders.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/screens/Home/view_story/view_story_controller.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/color_res.dart';
import 'package:rainbow/utils/strings.dart';

import '../../../common/popup.dart';

class StoryScreen extends StatelessWidget {
  String? id;
  String? image;

  StoryScreen({Key? key, this.id, this.image}) : super(key: key);

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
                  controller.tagController.clear();
                  controller.writeSomethings.clear();
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
                width: Get.width * 0.655,
              ),
              InkWell(
                onTap: () {
                  controller.onTextTap();
                },
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: ColorRes.color_606060),
                  child: Center(
                    child: Text(
                      Strings.aA,
                      style: gilroyMediumTextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: Get.width * 0.05,
              ),
              GestureDetector(
                  onTap: () {
                    controller.onTapPostStory(context);
                    /*    controller.commentSendTap(id!);
                        Get.back();*/
                    /*    controller.writeSomethings.clear();*/
                  },
                  child: Text(
                    Strings.post,
                    style:
                        gilroyBoldTextStyle(fontSize: 16, color: Colors.black),
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: Get.height * 0.02,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 40),
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
                    SizedBox(
                      height: Get.height * 0.2,
                    ),
                    GetBuilder<ViewStoryController>(
                      id: "createStory",
                      builder: (controller) {
                        return controller.image == null
                            ? const SizedBox()
                            : SizedBox(
                                height: Get.height * 0.35,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: controller.image.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(3),
                                      child: SizedBox(
                                        height: Get.height * 0.34,
                                        width: Get.width * 0.32,
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              top: 10,
                                              child: Image.file(
                                                height: Get.height * 0.27,
                                                width: Get.width * 0.28,
                                                controller.image[index],
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                            Positioned(
                                              left: 85,
                                              child: InkWell(
                                                onTap: () {
                                                  controller.image
                                                      .removeAt(index);
                                                  controller
                                                      .update(["createStory"]);
                                                },
                                                child: Container(
                                                    decoration:
                                                        const BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            color:
                                                                Colors.black),
                                                    child: const Icon(
                                                      Icons.clear,
                                                      color: Colors.white,
                                                    )),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              );
                      },
                    ),
                  ],
                ),
                Positioned(
                  top: Get.height * 0.025,
                  left: 15,
                  child: image.toString() == ""
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: SizedBox(
                            height: 40,
                            width: 40,
                            child: Image.asset(AssetRes.portrait_placeholder),
                          ),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: FadeInImage(
                            height: 40,
                            width: 40,
                            placeholder:
                                const AssetImage(AssetRes.portrait_placeholder),
                            image: NetworkImage(image.toString()),
                            fit: BoxFit.cover,
                          )),
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
                                if (controller.image.length == 3) {
                                  errorToast("you can take only 3 images");
                                } else {
                                  controller.cameraImage();
                                  controller.update(["createStory"]);
                                }
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
                                if (controller.image.length == 3) {
                                  errorToast("you can take only 3 images");
                                } else {
                                  controller.galleryImage();
                                  controller.update(["createStory"]);
                                }

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
                GetBuilder<ViewStoryController>(
                  id: 'createStory',
                  builder: (controller) {
                    if (controller.filterList.isEmpty) {
                      return const SizedBox();
                    } else {
                      return Container(
                        constraints: const BoxConstraints(
                            maxHeight: 200 - 20 - 50, minHeight: 30),
                        // height: 200,
                        width: Get.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 5),
                          ],
                        ),
                        child: ListView.builder(
                          itemCount: controller.filterList.length,
                          shrinkWrap: true,
                          itemBuilder: (con, index) {
                            return InkWell(
                              onTap: () => controller
                                  .onTagTap(controller.filterList[index]),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 10),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child: Image.network(
                                        controller
                                            .filterList[index].profileImage
                                            .toString(),
                                        height: 30,
                                        width: 30,
                                        fit: BoxFit.cover,
                                        errorBuilder: (con, str, dy) {
                                          return Container(
                                            height: 30,
                                            width: 30,
                                            decoration: BoxDecoration(
                                              color: ColorRes.white,
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  color: ColorRes.black,
                                                  width: 0.7),
                                            ),
                                            child: const Center(
                                              child: Icon(
                                                Icons.account_circle_outlined,
                                                color: ColorRes.black,
                                              ),
                                            ),
                                          );
                                        },
                                      )
                                      /*CachedNetworkImage(
                                        imageUrl: controller
                                            .filterList[index]
                                            .profileImage
                                            .toString(),
                                        height: 30,
                                        width: 30,
                                        fit: BoxFit.cover,
                                        errorWidget: (con,str,dy){
                                          return Container(
                                            height: 30,
                                            width: 30,
                                            decoration: BoxDecoration(
                                              color: ColorRes.white,
                                              shape: BoxShape.circle,
                                              border: Border.all(color: ColorRes.black,width: 0.7),
                                            ),
                                            child: const Center(
                                              child: Icon(Icons.account_circle_outlined,color: ColorRes.black,),
                                            ),
                                          );
                                        },
                                      )*/
                                      ,
                                    ),
                                    const SizedBox(width: 10),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          controller.filterList[index].fullName
                                              .toString(),
                                          style: const TextStyle(
                                            color: ColorRes.black,
                                            fontSize: 12,
                                          ),
                                        ),
                                        Text(
                                          controller.filterList[index].email
                                              .toString(),
                                          style: const TextStyle(
                                            color: ColorRes.black,
                                            fontSize: 10,
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
                      );
                    }
                  },
                ),
                controller.textShow == true
                    ? Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Center(
                          child: SizedBox(
                            height: 50,
                            width: Get.width,
                            child: TextField(
                              controller: controller.tagController,
                              style: const TextStyle(
                                  fontSize: 20, color: Colors.blueAccent),
                              onChanged: controller.onChange,
                              decoration: InputDecoration(
                                hintText: Strings.tagsUsers,
                                hintStyle: textStyleFont18Grey,
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      )
                    : const SizedBox(),
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
