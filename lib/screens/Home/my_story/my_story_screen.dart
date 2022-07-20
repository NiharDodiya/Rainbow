import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/loaders.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/model/myStory_model.dart';
import 'package:rainbow/screens/Home/my_story/my_story_controller.dart';
import 'package:rainbow/screens/Profile/profile_controller.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/color_res.dart';
import 'package:rainbow/utils/strings.dart';
import 'package:story/story_page_view/story_page_view.dart';

class MyStoryScreen extends StatefulWidget {
  const MyStoryScreen({Key? key}) : super(key: key);

  @override
  State<MyStoryScreen> createState() => _MyStoryScreenState();
}

class _MyStoryScreenState extends State<MyStoryScreen> {
  final MyStoryController controller = Get.put(MyStoryController());
  final ProfileController profileController = Get.find();

  late ValueNotifier<IndicatorAnimationCommand> indicatorAnimationController;

  @override
  void initState() {
    super.initState();

    indicatorAnimationController =
        ValueNotifier<IndicatorAnimationCommand>(
            IndicatorAnimationCommand.resume);
  }

  @override
  void dispose() {
    indicatorAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () {
          return Stack(
            children: [
              GetBuilder<MyStoryController>(
                id: "my_story",
                builder: (controller) {
                  if (controller.myStoryModel.data == null) {
                    return Container(color: ColorRes.black);
                  }
                  return StoryPageView(
                    itemBuilder: (context, pageIndex, storyIndex) {

                      final MyStory story =
                          controller.myStoryModel.data![storyIndex];
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
                                    image: AssetImage(AssetRes.homePro),
                                  ),
                                ),
                              ),
                              progressIndicatorBuilder: (con, str, progress) {
                                if (progress.progress != 100) {
                                  indicatorAnimationController
                                      .value = IndicatorAnimationCommand.pause;
                                } else {
                                  indicatorAnimationController
                                      .value = IndicatorAnimationCommand.resume;
                                }
                                return SmallLoader(progress: progress.progress);
                              },
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
                                        onPressed: () {
                                          controller.onCommentButtonTap();
                                        },
                                        style: TextButton.styleFrom(
                                          backgroundColor: ColorRes.color_50369C
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
                                              text: controller.myStoryModel
                                                  .data![pageIndex].description
                                                  .toString(),
                                              style:
                                                  sfProTextReguler().copyWith(
                                                color: ColorRes.color_2F80ED,
                                                fontSize: 27,
                                              ),
                                              recognizer: TapGestureRecognizer()
                                                ..onTap =
                                                    controller.onHashTagTap,
                                            ),
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
                                                profileController.viewProfile
                                                    .data!.profileImage
                                                    .toString(),
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 16),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              profileController
                                                  .viewProfile.data!.fullName
                                                  .toString(),
                                              style:
                                                  sfProTextReguler().copyWith(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            Text(
                                              profileController
                                                  .viewProfile.data!.userStatus
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
                                          "${controller.myStoryModel.data![storyIndex].createdAt!.hour.toString()}:${controller.myStoryModel.data![storyIndex].createdAt!.minute.toString()}",
                                          style: sfProTextReguler().copyWith(
                                              decoration:
                                                  TextDecoration.underline),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    GetBuilder<MyStoryController>(
                                      id: "my_story",
                                      builder: (controller) {
                                        return SizedBox(
                                          width: Get.width,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              InkWell(
                                                onTap: controller.onLikeBtnTap,
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    const Icon(
                                                      Icons.favorite,
                                                      color: ColorRes.red,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          Strings.likes,
                                                          style:
                                                              sfProTextReguler(
                                                                  fontSize: 15),
                                                        ),
                                                        Text(
                                                          controller
                                                              .myStoryModel
                                                              .data![storyIndex]
                                                              .storyLikeCount
                                                              .toString(),
                                                          style:
                                                              sfProTextReguler(
                                                                  fontSize: 15),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  controller
                                                      .onCommentButtonTap();
                                                },
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    const Icon(Icons.comment,
                                                        color: ColorRes.white),
                                                    Text(Strings.comments,
                                                        style:
                                                            sfProTextReguler()),
                                                  ],
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () => controller
                                                    .onDeleteTap(storyIndex,pauseAnimation,playAnimation),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    const Icon(Icons.delete,
                                                        color: ColorRes.red),
                                                    Text(
                                                      Strings.delete,
                                                      style: sfProTextReguler(),
                                                    ),
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
                        indicatorAnimationController,
                    initialStoryIndex: (pageIndex) {
                      return 0;
                    },
                    pageLength: 1,
                    storyLength: (int pageIndex) {
                      if (controller.myStoryModel.data == null) {
                        return 0;
                      }
                      return controller.myStoryModel.data!.length;
                    },
                    onPageLimitReached: () {
                      Navigator.pop(context);
                    },
                  );
                },
              ),
              controller.loader.isTrue ? const SmallLoader() : const SizedBox()
            ],
          );
        },
      ),
    );
  }

  void pauseAnimation(){
    indicatorAnimationController.value = IndicatorAnimationCommand.pause;
  }

  void playAnimation(){
    indicatorAnimationController.value = IndicatorAnimationCommand.resume;
  }
}
