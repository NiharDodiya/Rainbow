import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/loaders.dart';
import 'package:rainbow/screens/Home/view_story/view_story_controller.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/color_res.dart';
import 'package:rainbow/utils/strings.dart';
import 'package:story/story_page_view/story_page_view.dart';

import '../../../common/Widget/text_styles.dart';

class ViewStoryScreen extends StatefulWidget {
  const ViewStoryScreen({Key? key}) : super(key: key);

  @override
  State<ViewStoryScreen> createState() => _ViewStoryScreenState();
}

class _ViewStoryScreenState extends State<ViewStoryScreen> {
  final ViewStoryController controller = Get.put(ViewStoryController());

/*  final sampleUsers = [
    UserModel([
      StoryModel(
          "https://images.unsplash.com/photo-1601758228041-f3b2795255f1?ixid=MXwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxN3x8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
      StoryModel(
          "https://images.unsplash.com/photo-1609418426663-8b5c127691f9?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyNXx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
      StoryModel(
          "https://images.unsplash.com/photo-1609444074870-2860a9a613e3?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw1Nnx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
      StoryModel(
          "https://images.unsplash.com/photo-1609504373567-acda19c93dc4?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw1MHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
    ], "User1",
        "https://images.unsplash.com/photo-1609262772830-0decc49ec18c?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzMDF8fHxlbnwwfHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
    UserModel([
      StoryModel(
          "https://images.unsplash.com/photo-1609439547168-c973842210e1?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw4Nnx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
    ], "User2",
        "https://images.unsplash.com/photo-1601758125946-6ec2ef64daf8?ixid=MXwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwzMjN8fHxlbnwwfHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
    UserModel([
      StoryModel(
          "https://images.unsplash.com/photo-1609421139394-8def18a165df?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxMDl8fHxlbnwwfHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
      StoryModel(
          "https://images.unsplash.com/photo-1609377375732-7abb74e435d9?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxODJ8fHxlbnwwfHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
      StoryModel(
          "https://images.unsplash.com/photo-1560925978-3169a42619b2?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyMjF8fHxlbnwwfHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
    ], "User3",
        "https://images.unsplash.com/photo-1609127102567-8a9a21dc27d8?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzOTh8fHxlbnwwfHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
  ];*/

  @override
  void initState() {
    super.initState();
    controller.indicatorAnimationController =
        ValueNotifier<IndicatorAnimationCommand>(
            IndicatorAnimationCommand.pause);
  }

  @override
  void dispose() {
    controller.indicatorAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ViewStoryController>(
        id: "friendStory",
        builder: (controller) {
          return Obx(() {
            return Stack(
              children: [
                GetBuilder<ViewStoryController>(
                  id: "friendStory",
                  builder: (controller) {
                    return StoryPageView(
                      itemBuilder: (context, pageIndex, storyIndex) {
                        final user =
                            controller.friendStoryModel.data![pageIndex];
                        // final user = sampleUsers[pageIndex];
                        final story = user.storyList![storyIndex];
                        return Stack(
                          children: [
                            Positioned.fill(
                              child: Container(color: Colors.black),
                            ),
                            Positioned.fill(
                              child: CachedNetworkImage(
                                imageUrl: story.storyItem.toString(),
                                imageBuilder: (context, imageProvider) =>
                                    Container(
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
                              ),
                            ),
                          ],
                        );
                      },
                      indicatorPadding: EdgeInsets.only(
                          top: Get.height - 20, right: 50, left: 50),
                      gestureItemBuilder: (context, pageIndex, storyIndex) {
                        return Stack(
                          children: [
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                width: Get.width,
                                height: Get.height * 0.3,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      ColorRes.color_141414.withOpacity(0.9),
                                      Colors.transparent,
                                      Colors.transparent
                                    ],
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    stops: const [0, 0.99, 1],
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: SizedBox(
                                width: Get.width,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 32, left: 5, right: 5),
                                  child: Row(
                                    children: [
                                      IconButton(
                                        padding: EdgeInsets.zero,
                                        color: Colors.white,
                                        icon: const Icon(Icons.arrow_back_ios,
                                            size: 20),
                                        onPressed: controller.onBackTap,
                                      ),
                                      const Spacer(),
                                      SizedBox(
                                        height: 30,
                                        child: TextButton(
                                          onPressed:
                                             () {
                                               controller.onCommentButtonTap(id: controller
                                                   .friendStoryModel
                                                   .data![pageIndex]
                                                   .storyList![storyIndex]
                                                   .id
                                                   .toString());
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
                                      ),
                                      IconButton(
                                        padding: EdgeInsets.zero,
                                        color: Colors.white,
                                        icon: const Icon(Icons.more_horiz,
                                            size: 24),
                                        onPressed: controller.onMoreBtnTap,
                                      ),
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
                                                    .friendStoryModel
                                                    .data![pageIndex]
                                                    .storyList![storyIndex]
                                                    .description
                                                    .toString(),
                                                style:
                                                    sfProTextReguler().copyWith(
                                                  color: ColorRes.color_2F80ED,
                                                  fontSize: 27,
                                                ),
                                                recognizer:
                                                    TapGestureRecognizer()
                                                      ..onTap = controller
                                                          .onHashTagTap,
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
                                          borderRadius:
                                              BorderRadius.circular(2),
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
                                                          .friendStoryModel
                                                          .data![pageIndex]
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
                                                    .friendStoryModel
                                                    .data![pageIndex]
                                                    .userDetail!
                                                    .fullName
                                                    .toString(),
                                                style:
                                                    sfProTextReguler().copyWith(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              Text(
                                                controller
                                                    .friendStoryModel
                                                    .data![pageIndex]
                                                    .userDetail!
                                                    .userStatus
                                                    .toString(),
                                                style:
                                                    sfProTextReguler().copyWith(
                                                  fontWeight: FontWeight.w300,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const Spacer(),
                                          Text(
                                            "${controller.friendStoryModel.data![pageIndex].storyList![storyIndex].createdAt!.hour.toString()}:${controller.friendStoryModel.data![pageIndex].storyList![storyIndex].createdAt!.minute.toString()}",
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
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    controller
                                                                .friendStoryModel
                                                                .data![
                                                                    pageIndex]
                                                                .storyList![
                                                                    storyIndex]
                                                                .isLike
                                                                .toString() ==
                                                            "no"
                                                        ? InkWell(
                                                            onTap: () {
                                                              controller.onLikeBtnTap(controller
                                                                  .friendStoryModel
                                                                  .data![
                                                                      pageIndex]
                                                                  .storyList![
                                                                      storyIndex]
                                                                  .id
                                                                  .toString());
                                                              },
                                                            child: const Icon(
                                                              Icons.favorite,
                                                              color: ColorRes
                                                                  .white,
                                                            ),
                                                          )
                                                        : InkWell(
                                                            onTap: () {
                                                              controller.onUnLikeBtnTap(controller
                                                                  .friendStoryModel
                                                                  .data![
                                                                      pageIndex]
                                                                  .storyList![
                                                                      storyIndex]
                                                                  .id
                                                                  .toString());

                                                            },
                                                            child: const Icon(
                                                              Icons.favorite,
                                                              color:
                                                                  ColorRes.red,
                                                            ),
                                                          ),
                                                    InkWell(
                                                      onTap: controller
                                                          .onLikeViewTap,
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            Strings.likes,
                                                            style:
                                                                sfProTextReguler(
                                                                    fontSize:
                                                                        15),
                                                          ),
                                                          Text(
                                                            controller
                                                                .friendStoryModel
                                                                .data![
                                                                    pageIndex]
                                                                .storyList![
                                                                    storyIndex]
                                                                .storyLikeCount
                                                                .toString(),
                                                            style:
                                                                sfProTextReguler(
                                                                    fontSize:
                                                                        15),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                InkWell(
                                                  onTap:() {
                                                    controller
                                                        .onCommentButtonTap();
                                                  },
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      const Icon(Icons.comment,
                                                          color:
                                                              ColorRes.white),
                                                      Text(Strings.comments,
                                                          style:
                                                              sfProTextReguler()),
                                                    ],
                                                  ),
                                                ),
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
                      pageLength: controller.friendStoryModel.data!.length,
                      storyLength: (int pageIndex) {
                        return controller.friendStoryModel.data![pageIndex]
                            .storyList!.length;
                      },
                      onPageLimitReached: () {
                        Navigator.pop(context);
                      },
                    );
                  },
                ),
                controller.loader.isTrue ? SmallLoader() : SizedBox()
              ],
            );
          });
        },
      ),
    );
  }
}

class UserModel {
  UserModel(this.stories, this.userName, this.imageUrl);

  final List<StoryModel> stories;
  final String userName;
  final String imageUrl;
}

class StoryModel {
  StoryModel(this.imageUrl);

  final String imageUrl;
}
