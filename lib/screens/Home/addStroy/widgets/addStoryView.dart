import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/loaders.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/screens/Home/addStroy/addStory_controller.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/color_res.dart';
import 'package:rainbow/utils/strings.dart';

class AddStoryViewScreen extends StatelessWidget {
  AddStoryViewScreen({Key? key}) : super(key: key);
  final AddStoryController controller = Get.put(AddStoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<AddStoryController>(
        id: "adStory",
        builder: (controller) {
          return SafeArea(
            child: Obx(
              () {
                return Stack(
                  children: [
                    Image.file(
                      controller.image!,
                      height: Get.height,
                      width: Get.width,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      height: Get.height,
                      width: Get.width,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            ColorRes.color_141414.withOpacity(0.9),
                            Colors.transparent,
                            Colors.transparent
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          stops: const [0, 0.8, 1],
                        ),
                      ),
                    ),
                    Positioned(
                      top: Get.height * 0.032,
                      left: 15,
                      child: InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: ColorRes.color_606060),
                          child: Center(
                            child: Image.asset(
                              AssetRes.backIcon,
                              height: 16,
                              width: 10,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: Get.height * 0.032,
                      left: Get.width * 0.8,
                      child: InkWell(
                        onTap: () {
                          controller.onTextTap();
                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: ColorRes.color_606060),
                          child: Center(
                            child: Text(
                              Strings.aA,
                              style: gilroyMediumTextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: InkWell(
                          onTap: () {
                            controller.onStoryPost();
                            FocusScope.of(context).unfocus();
                          },
                          child: Container(
                            height: Get.height * 0.07389,
                            width: Get.width * 0.8,
                            decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [
                                    ColorRes.color_FFEC5C,
                                    ColorRes.color_DFC60B
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                              child: Text(
                                Strings.postToStories,
                                style: gilroyMediumTextStyle(
                                    fontSize: 15, color: ColorRes.black),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: Get.height / 6,
                      left: 0,
                      right: 0,
                      child: SizedBox(
                        height: 250,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GetBuilder<AddStoryController>(
                                id: 'mention_popUp',
                                builder: (controller) {
                                  if (controller.filterList.isEmpty) {
                                    return const SizedBox();
                                  } else if (controller.filterList.length ==
                                          1 &&
                                      controller.tagUserList
                                          .where((element) =>
                                              element.id ==
                                              controller.filterList.first.id)
                                          .toList()
                                          .isNotEmpty) {
                                    return const SizedBox();
                                  } else {
                                    return Container(
                                      constraints: const BoxConstraints(
                                          maxHeight: 200 - 20 - 50,
                                          minHeight: 30),
                                      // height: 200,
                                      width: Get.width,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                              color:
                                                  Colors.black.withOpacity(0.2),
                                              blurRadius: 5),
                                        ],
                                      ),
                                      child: ListView.builder(
                                        itemCount: controller.filterList.length,
                                        shrinkWrap: true,
                                        itemBuilder: (con, index) {
                                          if (controller.tagUserList
                                              .where((element) =>
                                                  element.id ==
                                                  controller
                                                      .filterList[index].id)
                                              .toList()
                                              .isNotEmpty) {
                                            return const SizedBox();
                                          }
                                          return InkWell(
                                            onTap: () => controller.onTagTap(
                                                controller.filterList[index]),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10.0,
                                                      horizontal: 10),
                                              child: Row(
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50),
                                                    child: CachedNetworkImage(
                                                      imageUrl: controller
                                                          .filterList[index]
                                                          .profileImage
                                                          .toString(),
                                                      height: 30,
                                                      width: 30,
                                                      fit: BoxFit.cover,
                                                      errorWidget:
                                                          (con, str, dy) {
                                                        return Container(
                                                          height: 30,
                                                          width: 30,
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                ColorRes.white,
                                                            shape:
                                                                BoxShape.circle,
                                                            border: Border.all(
                                                                color: ColorRes
                                                                    .black,
                                                                width: 0.7),
                                                          ),
                                                          child: const Center(
                                                            child: Icon(
                                                              Icons
                                                                  .account_circle_outlined,
                                                              color: ColorRes
                                                                  .black,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                  const SizedBox(width: 10),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        controller
                                                            .filterList[index]
                                                            .fullName
                                                            .toString(),
                                                        style: const TextStyle(
                                                          color: ColorRes.black,
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                      Text(
                                                        controller
                                                            .filterList[index]
                                                            .email
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
                              const SizedBox(height: 20),
                              controller.textShow == true
                                  ? Center(
                                      child: SizedBox(
                                        height: 50,
                                        width: Get.width,
                                        child: TextField(
                                          controller: controller.msgController,
                                          style: const TextStyle(fontSize: 20),
                                          onChanged: controller.onChange,
                                          decoration: const InputDecoration(
                                            hintText: Strings.writeSomethings,
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    )
                                  : const SizedBox(),
                            ],
                          ),
                        ),
                      ),
                    ),
                    controller.loader.isTrue
                        ? const FullScreenLoader()
                        : const SizedBox()
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
