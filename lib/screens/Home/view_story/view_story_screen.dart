import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/loaders.dart';
import 'package:rainbow/screens/Home/view_story/view_story_controller.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/color_res.dart';
import 'package:story/story_page_view/story_page_view.dart';

import '../../../common/Widget/text_styles.dart';

class ViewStoryScreen extends StatefulWidget {
  const ViewStoryScreen({Key? key}) : super(key: key);

  @override
  State<ViewStoryScreen> createState() => _ViewStoryScreenState();
}

class _ViewStoryScreenState extends State<ViewStoryScreen> {
  final ViewStoryController controller = Get.put(ViewStoryController());

  @override
  void initState() {
    super.initState();
    controller.indicatorAnimationController =
        ValueNotifier<IndicatorAnimationCommand>(
            IndicatorAnimationCommand.pause);
    // controller.pauseAnimation();
    // controller.playAnimation();
    // controller.init();

    /*KeyboardVisibilityController().onChange.listen((bool visible) {
      if (Get.currentRoute != "/ViewStoryScreen") {
        return;
      }
      if (visible) {
        controller.pauseAnimation();
      } else {
        controller.playAnimation();
      }
    });*/
  }

  @override
  void dispose() {
    controller.indicatorAnimationController!.dispose();
    controller.indicatorAnimationController = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            GetBuilder<ViewStoryController>(
              id: "friendStory",
              builder: (controller) {
                return StoryPageView(
                  itemBuilder: (context, pageIndex, storyIndex) {
                    final user = controller.storyModel.friendsStory![pageIndex];
                    // final user = sampleUsers[pageIndex];
                    final story = user.storyList![storyIndex];
                    return Stack(
                      children: [
                        Positioned.fill(
                          child: Container(color: Colors.black),
                        ),
                        /*CachedNetworkImage(
                          height: Get.height * 0.9,
                          imageUrl: story.storyItem.toString(),
                          imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          // placeholder: (context, url) =>const Center(child:CircularProgressIndicator(),),
                          errorWidget: (context, url, error) => Container(
                            height: Get.height * 0.2857,
                            width: Get.width,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage(AssetRes.homePro))),
                          ),
                          fit: BoxFit.fill,
                        ),*/
                        Image.network(
                          story.storyItem.toString(),
                          height: Get.height * 0.84,
                          width: Get.width,
                          fit: BoxFit.cover,
                          errorBuilder: (context, url, error) => Container(
                            height: Get.height * 0.2857,
                            width: Get.width,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage(AssetRes.homePro))),
                          ),
                        ),
                      ],
                    );
                  },
                  indicatorDuration: const Duration(seconds: 20),
                  indicatorPadding: EdgeInsets.only(
                      top: Get.height * 0.02, right: 50, left: 50),
                  gestureItemBuilder: (context, pageIndex, storyIndex) {
                    return Stack(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: SizedBox(
                            width: Get.width,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 32, left: 5, right: 5),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: SizedBox(
                                          height: 16,
                                          width: 30,
                                          child: Image.asset(
                                            AssetRes.backIcon,
                                            color: Colors.white,
                                          )),
                                    ),
                                  ),
                                  /*    IconButton(
                                    padding: EdgeInsets.zero,
                                    color: Colors.white,
                                    icon: const Icon(Icons.arrow_back_ios,
                                        size: 20),
                                    onPressed: controller.onBackTap,
                                  ),*/
                                  const Spacer(),
                                  /*    SizedBox(
                                      height: 30,
                                      child: TextButton(
                                        onPressed: () {
                                      */ /*    controller.onCommentButtonTap(
                                              id: controller
                                                  .friendStoryModel
                                                  .data![pageIndex]
                                                  .storyList![storyIndex]
                                                  .id
                                                  .toString());*/ /*
                                        },
                                        style: TextButton.styleFrom(
                                          backgroundColor: ColorRes
                                              .color_50369C
                                              .withOpacity(0.5),
                                        ),
                                        child: Text(
                                          "Comments",
                                          style: sfProTextReguler(),
                                        ),
                                      ),
                                    ),*/
                                  /*     IconButton(
                                      padding: EdgeInsets.zero,
                                      color: Colors.white,
                                      icon: const Icon(Icons.more_horiz,
                                          size: 24),
                                      onPressed: controller.onMoreBtnTap,
                                    ),*/
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 60,
                          child: SizedBox(
                            width: Get.width,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: Get.width * 0.072),
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: Get.width,
                                    child: RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: controller
                                                .storyModel
                                                .friendsStory![pageIndex]
                                                .storyList![storyIndex]
                                                .description
                                                .toString(),
                                            style: sfProTextReguler().copyWith(
                                              color: ColorRes.color_2F80ED,
                                              fontSize: 27,
                                            ),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = controller.onHashTagTap,
                                          ),
                                          /*    TextSpan(
                                                  text:
                                                      "congrats on your new baby 👍🏼",
                                                  style:
                                                      sfProTextReguler().copyWith(
                                                    fontSize: 27,
                                                  ),
                                                ),*/
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: Get.height * 0.039),
                                  Container(
                                    height: 2,
                                    width: Get.width,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2),
                                      color: ColorRes.color_9597A1
                                          .withOpacity(0.2),
                                    ),
                                  ),
                                  SizedBox(height: Get.height * 0.04926),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        height: 56,
                                        width: 56,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                  controller
                                                      .storyModel
                                                      .friendsStory![pageIndex]
                                                      .userDetail!
                                                      .profileImage
                                                      .toString(),
                                                ),
                                                fit: BoxFit.cover)),
                                      ),
                                      const SizedBox(width: 16),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            controller
                                                .storyModel
                                                .friendsStory![pageIndex]
                                                .userDetail!
                                                .fullName
                                                .toString(),
                                            style: sfProTextReguler().copyWith(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          Text(
                                            controller
                                                .storyModel
                                                .friendsStory![pageIndex]
                                                .userDetail!
                                                .userStatus
                                                .toString(),
                                            style: sfProTextReguler().copyWith(
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Spacer(),
                                      Text(
                                        "${controller.storyModel.friendsStory![pageIndex].storyList![storyIndex].createdAt!.hour.toString()}:${controller.storyModel.friendsStory![pageIndex].storyList![storyIndex].createdAt!.minute.toString()}",
                                        style: sfProTextReguler().copyWith(
                                            decoration:
                                                TextDecoration.underline),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  GetBuilder<ViewStoryController>(
                                    id: "friendStory",
                                    builder: (controller) {
                                      return SizedBox(
                                        width: Get.width,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: const [
                                                /*       InkWell(
                                                  onTap: () {
                                                    controller.onLikeViewTap(
                                                        friendStory: controller
                                                            .friendStoryModel
                                                            .data![pageIndex],
                                                        storyIndex: storyIndex);
                                                  },
                                                  child: Row(
                                                    children: [
                                                     */ /* Text(
                                                        Strings.likes,
                                                        style: sfProTextReguler(
                                                            fontSize: 15),
                                                      ),
                                                      const SizedBox(
                                                        width: 5,
                                                      ),*/ /*
                                                      Text(
                                                        controller
                                                            .friendStoryModel
                                                            .data![pageIndex]
                                                            .storyList![
                                                                storyIndex]
                                                            .storyLikeCount
                                                            .toString(),
                                                        style: sfProTextReguler(
                                                            fontSize: 15),
                                                      ),
                                                    ],
                                                  ),
                                                ),*/
                                              ],
                                            ),
                                            /*InkWell(
                                              onTap: () {
                                                controller.onCommentButtonTap(
                                                    storyIndex: storyIndex,
                                                    friendStory: controller
                                                        .friendStoryModel
                                                        .data![pageIndex]);
                                              },
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  const Icon(Icons.comment,
                                                      color: ColorRes.white),
                                                  Row(
                                                    children: [
                                                      Text(Strings.comments,
                                                          style:
                                                              sfProTextReguler()),
                                                      const SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text(
                                                          controller
                                                              .friendStoryModel
                                                              .data![pageIndex]
                                                              .storyList![
                                                                  storyIndex]
                                                              .storyCommentCount
                                                              .toString(),
                                                          style:
                                                              sfProTextReguler()),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),*/
                                          ],
                                        ),
                                      );
                                    },
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 20,
                          left: 15,
                          child: Row(
                            children: [
                              controller.storyModel.friendsStory![pageIndex]
                                          .storyList![storyIndex].isLike
                                          .toString() ==
                                      "no"
                                  ? InkWell(
                                      onTap: () {
                                        controller.onLikeBtnTap(controller
                                            .storyModel
                                            .friendsStory![pageIndex]
                                            .storyList![storyIndex]
                                            .id
                                            .toString());
                                      },
                                      child: const Icon(
                                        Icons.favorite,
                                        color: ColorRes.white,
                                      ),
                                    )
                                  : InkWell(
                                      onTap: () {
                                        controller.onUnLikeBtnTap(controller
                                            .storyModel
                                            .friendsStory![pageIndex]
                                            .storyList![storyIndex]
                                            .id
                                            .toString());
                                      },
                                      child: const Icon(
                                        Icons.favorite,
                                        color: ColorRes.red,
                                      ),
                                    ),
                              const SizedBox(
                                width: 15,
                              ),
                              SizedBox(
                                height: 40,
                                width: 250,
                                child: TextFormField(
                                  controller: controller.writeSomethings,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(35),
                                    ),
                                    filled: true,
                                    fillColor: Colors.black,
                                    hintStyle:
                                        const TextStyle(color: Colors.white),
                                    hintText: "send message",
                                    contentPadding:
                                        const EdgeInsets.only(top: 2, left: 15),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(35),
                                    ),
                                  ),
                                  onChanged: (_) => controller.pauseAnimation(),
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              InkWell(
                                onTap: () {
                                  controller.commentSendTap(
                                      controller
                                          .storyModel
                                          .friendsStory![pageIndex]
                                          .storyList![storyIndex]
                                          .id
                                          .toString(),
                                      context);
                                },
                                child: Image.asset(
                                  AssetRes.send,
                                  height: 20,
                                  width: 20,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                  indicatorAnimationController:
                      controller.indicatorAnimationController,
                  initialStoryIndex: (pageIndex) {
                    /* if (pageIndex == 0) {
                    return 1;
                  }*/
                    return 0;
                  },
                  pageLength: controller.storyModel.friendsStory!.length,
                  storyLength: (int pageIndex) {
                    return controller
                        .storyModel.friendsStory![pageIndex].storyList!.length;
                  },
                  onPageChanged: controller.onPageChange,
                  onPageLimitReached: () {
                    Get.back();
                  },
                  color: ColorRes.white,
                  bgColor: ColorRes.color_464646,
                  onStoryChange: (int storyIndex) => controller.onStoryChange(
                      controller.currentPage, storyIndex),
                  initialPage: controller.currentPage,
                  loadImage: () => controller.downloadImage(context),
                );
              },
            ),
            Obx(() {
              return controller.loader.isTrue
                  ? const FullScreenLoader()
                  : const SizedBox();
            }),
          ],
        ),
      ),
    );
  }
}
