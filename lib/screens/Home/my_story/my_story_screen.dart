import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/loaders.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/model/friend_stroy_model.dart';
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

  @override
  void initState() {
    super.initState();

    controller.indicatorAnimationController =
        ValueNotifier<IndicatorAnimationCommand>(
            IndicatorAnimationCommand.resume);
    controller.indicatorAnimationController!.value =
        IndicatorAnimationCommand.pause;
    controller.indicatorAnimationController!.value =
        IndicatorAnimationCommand.resume;

    KeyboardVisibilityController().onChange.listen((bool visible) {
      if (Get.currentRoute != "/MyStoryScreen") {
        return;
      }
      if (visible) {
        controller.indicatorAnimationController!.value =
            IndicatorAnimationCommand.pause;
      } else {
        controller.indicatorAnimationController!.value =
            IndicatorAnimationCommand.resume;
      }
    });
  }

  @override
  void dispose() {
    controller.indicatorAnimationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.onInitStateCall();
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            GetBuilder<MyStoryController>(
              id: "my_story",
              builder: (controller) {
                if (controller.viewStoryController.storyModel.myStory == null) {
                  return Container(color: ColorRes.black);
                }
                return StoryPageView(
                  itemBuilder: (context, pageIndex, storyIndex) {
                    final MyStory story = controller
                        .viewStoryController.storyModel.myStory![storyIndex];
                    return Stack(
                      children: [
                        Container(color: Colors.black),
                        Image.network(
                          story.storyItem.toString(),
                          height: Get.height,
                          width: Get.width,
                          fit: BoxFit.cover,
                          errorBuilder: (context, url, error) => Container(
                            height: Get.height * 0.2857,
                            width: Get.width,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage(AssetRes.portraitPlaceholder),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                  indicatorDuration: const Duration(seconds: 20),
                  indicatorPadding: EdgeInsets.only(
                      top: Get.height * 0.02, right: 50, left: 50),
                  gestureItemBuilder: (context, pageInde, storyIndex) {
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
                                  top: 25, left: 5, right: 5),
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: controller.onBackTap,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: Get.width * 0.03),
                                      child: Image.asset(
                                        AssetRes.backIcon,
                                        height: 16,
                                        width: 35,
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                  /*  IconButton(
                                    padding: EdgeInsets.zero,
                                    color: Colors.white,
                                    icon: const Icon(Icons.arrow_back_ios,
                                        size: 20),
                                    onPressed: controller.onBackTap,
                                  ),*/
                                  ,
                                  const Spacer(),
                                  IconButton(
                                      onPressed: () {
                                        controller.getStoryViewList(controller
                                            .viewStoryController
                                            .storyModel
                                            .myStory![storyIndex]
                                            .id
                                            .toString());
                                      },
                                      icon: const Icon(
                                        Icons.remove_red_eye,
                                        color: Colors.white,
                                      )),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  /*  SizedBox(
                                        height: 30,
                                        child: TextButton(
                                          onPressed: () {

                                          },
                                          style: TextButton.styleFrom(
                                            backgroundColor: ColorRes.color_50369C
                                                .withOpacity(0.5),
                                          ),
                                          child: Text(
                                            "Comments",
                                            // style: sfProTextReguler(),
                                          ),
                                        ),
                                      ),
                                      IconButton(
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
                          bottom: 15,
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
                                                .viewStoryController
                                                .storyModel
                                                .myStory![storyIndex]
                                                .description
                                                .toString(),
                                            style: sfProTextReguler().copyWith(
                                              color: ColorRes.color_2F80ED,
                                              fontSize: 27,
                                            ),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = controller.onHashTagTap,
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
                                      profileController.viewProfile.data!
                                                  .profileImage
                                                  .toString() ==
                                              ""
                                          ? Container(
                                              height: 56,
                                              width: 56,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                    AssetRes
                                                        .portraitPlaceholder,
                                                  ),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            )
                                          : Container(
                                              height: 56,
                                              width: 56,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                  image: NetworkImage(
                                                    profileController
                                                        .viewProfile
                                                        .data!
                                                        .profileImage
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
                                            style: sfProTextReguler().copyWith(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          Text(
                                            profileController
                                                .viewProfile.data!.userStatus
                                                .toString(),
                                            style: sfProTextReguler().copyWith(
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Spacer(),
                                      Text(
                                        "${controller.viewStoryController.storyModel.myStory![storyIndex].createdAt!.toLocal().hour.toString()}:${controller.viewStoryController.storyModel.myStory![storyIndex].createdAt!.toLocal().minute.toString()}",
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
                                              onTap: () {
                                                controller.onLikeBtnTap(
                                                    myStory: controller
                                                        .viewStoryController
                                                        .storyModel
                                                        .myStory![storyIndex],
                                                    storyindex: storyIndex);
                                              },
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  controller
                                                              .viewStoryController
                                                              .storyModel
                                                              .myStory![
                                                                  storyIndex]
                                                              .isLike
                                                              .toString() ==
                                                          "no"
                                                      ? InkWell(
                                                          onTap: () {
                                                            controller.onLikeBtn(
                                                                controller
                                                                    .viewStoryController
                                                                    .storyModel
                                                                    .myStory![
                                                                        storyIndex]
                                                                    .id
                                                                    .toString());
                                                          },
                                                          child: const Icon(
                                                            Icons.favorite,
                                                            color:
                                                                ColorRes.white,
                                                          ),
                                                        )
                                                      : InkWell(
                                                          onTap: () {
                                                            controller.onUnLikeBtn(
                                                                controller
                                                                    .viewStoryController
                                                                    .storyModel
                                                                    .myStory![
                                                                        storyIndex]
                                                                    .id
                                                                    .toString());
                                                          },
                                                          child: const Icon(
                                                            Icons.favorite,
                                                            color: ColorRes.red,
                                                          ),
                                                        ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        Strings.likes,
                                                        style: sfProTextReguler(
                                                            fontSize: 15),
                                                      ),
                                                      Text(
                                                        controller
                                                                    .viewStoryController
                                                                    .storyModel
                                                                    .myStory![
                                                                        storyIndex]
                                                                    .storyLikeCount
                                                                    .toString() ==
                                                                "0"
                                                            ? ""
                                                            : controller
                                                                .viewStoryController
                                                                .storyModel
                                                                .myStory![
                                                                    storyIndex]
                                                                .storyLikeCount
                                                                .toString(),
                                                        style: sfProTextReguler(
                                                            fontSize: 15),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                controller.onCommentButtonTap(
                                                    myStory: controller
                                                        .viewStoryController
                                                        .storyModel
                                                        .myStory![storyIndex],
                                                    storyindex: storyIndex);
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
                                                        width: 2,
                                                      ),
                                                      Text(
                                                          controller
                                                                      .viewStoryController
                                                                      .storyModel
                                                                      .myStory![
                                                                          storyIndex]
                                                                      .storyCommentCount
                                                                      .toString() ==
                                                                  "0"
                                                              ? ""
                                                              : controller
                                                                  .viewStoryController
                                                                  .storyModel
                                                                  .myStory![
                                                                      storyIndex]
                                                                  .storyCommentCount
                                                                  .toString(),
                                                          style:
                                                              sfProTextReguler()),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () => controller
                                                  .onDeleteTap(storyIndex),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
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
                        /*Positioned(
                          bottom: MediaQuery.of(context).viewInsets.bottom + 10,
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 15,
                              ),
                              SizedBox(
                                height: 40,
                                width: 280,
                                child: TextFormField(
                                  controller: controller.writeSomething,
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
                                      controller.viewStoryController.storyModel
                                          .myStory![storyIndex].id
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
                        ),*/
                      ],
                    );
                  },
                  indicatorAnimationController:
                      controller.indicatorAnimationController,
                  initialStoryIndex: (pageIndex) {
                    return 0;
                  },
                  pageLength: 1,
                  storyLength: (int pageIndex) {
                    if (controller.viewStoryController.storyModel.myStory ==
                        null) {
                      return 0;
                    }
                    return controller
                        .viewStoryController.storyModel.myStory!.length;
                  },
                  onPageLimitReached: () {
                    Navigator.pop(context);
                  },
                  color: ColorRes.white,
                  bgColor: ColorRes.color_464646,
                  onStoryChange: (int storyIndex) =>
                      controller.onStoryChange(storyIndex),
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
