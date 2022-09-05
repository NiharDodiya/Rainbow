import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_decorated_text/flutter_decorated_text.dart';
import 'package:get/get.dart';
import 'package:image_stack/image_stack.dart';
import 'package:rainbow/common/Widget/loaders.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/model/request_user_model.dart';
import 'package:rainbow/screens/Home/Story/story_screen.dart';
import 'package:rainbow/screens/Home/addStroy/addStory_screen.dart';
import 'package:rainbow/screens/Home/comments/comments_controller.dart';
import 'package:rainbow/screens/Home/comments/comments_screen.dart';
import 'package:rainbow/screens/Home/home_controller.dart';
import 'package:rainbow/screens/Home/settings/connections/connections_profile/connections_profile_controller.dart';
import 'package:rainbow/screens/Home/settings/connections/connections_screen.dart';
import 'package:rainbow/screens/Home/view_story/view_story_controller.dart';
import 'package:rainbow/screens/notification/notification_controller.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/color_res.dart';
import 'package:rainbow/utils/strings.dart';
import 'package:visibility_detector/visibility_detector.dart';

import 'settings/connections/connections_controller.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController controller = Get.put(HomeController());
  ViewStoryController viewStoryController = Get.put(ViewStoryController());
  ConnectionsController connectionsController =
      Get.put(ConnectionsController());
  CommentsController commentsController = Get.put(CommentsController());
  ConnectionsProfileController connectionsProfileController =
      Get.put(ConnectionsProfileController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Stack(
        children: [
          GetBuilder<HomeController>(
            id: "home",
            builder: (controller) {
              return Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  elevation: 0,
                  actions: [
                    Expanded(
                      child: Row(
                        children: [
                          SizedBox(
                            width: Get.width * 0.02,
                          ),
                          const Image(
                            image: AssetImage(AssetRes.locate),
                            height: 19.25,
                            width: 19.25,
                          ),
                          SizedBox(
                            width: Get.width * 0.02,
                          ),
                          controller.addCity == null
                              ? const SizedBox()
                              : Text(
                                  "${controller.addCity ?? ""}, ${controller.addCountry ?? ""}",
                                  style: gilroyBoldTextStyle(
                                      color: Colors.black, fontSize: 16),
                                ),
                          const Spacer(),
                          const SizedBox(width: 10),
                          GestureDetector(
                            onTap: () {
                              controller.onTapSetting();
                            },
                            child: const Image(
                              image: AssetImage(
                                AssetRes.settings,
                              ),
                              height: 19.25,
                              width: 19.25,
                            ),
                          ),
                          SizedBox(
                            width: Get.width * 0.04,
                          ),
                          InkWell(
                            onTap: controller.onNotyIconBtnTap,
                            child: Stack(
                              children: [
                                const SizedBox(
                                  height: 25,
                                  width: 25,
                                ),
                                const Positioned(
                                  bottom: 0,
                                  left: 0,
                                  child: SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: Image(
                                      image: AssetImage(AssetRes.notify),
                                      height: 20,
                                      width: 20,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 0,
                                  right: 0,
                                  child: GetBuilder<NotificationsController>(
                                    id: 'notification_badge',
                                    builder: (notificationController) {
                                      return notificationController
                                                      .notificationModel!
                                                      .pendingCount
                                                      .toString() ==
                                                  "null" ||
                                              notificationController
                                                      .notificationModel!
                                                      .pendingCount
                                                      .toString() ==
                                                  "0"
                                          ? const SizedBox()
                                          : Container(
                                              height: 16,
                                              width: 16,
                                              alignment: Alignment.center,
                                              decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: ColorRes.color_FF6B97),
                                              child: Text(
                                                notificationController
                                                    .notificationModel!
                                                    .pendingCount
                                                    .toString(),
                                                style: const TextStyle(
                                                  color: ColorRes.white,
                                                  fontSize: 8,
                                                  fontWeight: FontWeight.w800,
                                                ),
                                              ),
                                            );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: Get.width * 0.05,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                body: Container(
                  height: Get.height,
                  width: Get.width,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        ColorRes.color_50369C,
                        ColorRes.color_D18EEE,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: RefreshIndicator(
                    onRefresh: () => controller.onRefresh(),
                    child: latestFeed(),
                  ),
                ),
                floatingActionButton: GetBuilder<HomeController>(
                  id: "home",
                  builder: (controller) {
                    return Stack(
                      children: [
                        FloatingActionButton(
                          child: Image.asset(
                            AssetRes.add,
                            height: 24,
                            width: 24,
                          ),
                          onPressed: () async {
                            viewStoryController.resetAllData();
                            // if user have not subcription show pop up
                            subscribePopUp == true
                                ? showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        backgroundColor: Colors.white,
                                        actions: <Widget>[
                                          const SizedBox(
                                            height: 34,
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 30),
                                            child: Center(
                                                child: SizedBox(
                                                    height: 40,
                                                    width: 152,
                                                    child: Text(
                                                      Strings
                                                          .subscriptionPremium,
                                                      style:
                                                          gilroySemiBoldTextStyle(
                                                              fontSize: 16,
                                                              color:
                                                                  Colors.black),
                                                    ))),
                                          ),
                                          const SizedBox(
                                            height: 12,
                                          ),
                                          Center(
                                              child: Text(
                                            "£9.99 / month",
                                            style: gilroySemiBoldTextStyle(
                                                fontSize: 26,
                                                color: Colors.black),
                                          )),
                                          const SizedBox(
                                            height: 16,
                                          ),
                                          Center(
                                            child: Container(
                                              height: 30,
                                              width: 101,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(46.2),
                                                gradient: const LinearGradient(
                                                  colors: [
                                                    ColorRes.color_4F359B,
                                                    ColorRes.color_B279DB,
                                                  ],
                                                  begin: Alignment.topLeft,
                                                  end: Alignment.topRight,
                                                ),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "Subscribe",
                                                  style: gilroyBoldTextStyle(
                                                      fontSize: 9.6),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 21,
                                          ),
                                        ],
                                      );
                                    })
                                : await Get.to(() => StoryScreen(
                                          image: controller.controller
                                              .viewProfile.data!.profileImage
                                              .toString(),
                                        ))!
                                    .then((value) {
                                    if (value == true) {
                                      controller
                                          .friendPostDataWithOutPagination(
                                        pageLength: controller
                                                .friendPostListData.length +
                                            1,
                                      );
                                    }
                                  });
                          },
                        ),
                        /*  subscribePopUp==true?Positioned(bottom: 0,
                            child: Image.asset(AssetRes.lockSub,height: 18,width: 18,)):const SizedBox()*/
                      ],
                    );
                  },
                ),
              );
            },
          ),
          controller.loader.isTrue ? const FullScreenLoader() : const SizedBox()
        ],
      );
    });
  }

  Widget discover() {
    return Container(
      height: Get.width * 0.52,
      // height: 195,
      width: Get.width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            ColorRes.color_6753A3,
            ColorRes.color_B9A2FD,
            ColorRes.color_6753A3,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: Get.height * 0.02,
          ),
          Padding(
            padding: EdgeInsets.only(left: Get.width * 0.05),
            child: Text(
              Strings.discover,
              style: gilroyBoldTextStyle(fontSize: 20),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(
                  width: Get.width * 0.03,
                ),
                //add story
                SizedBox(
                  height: 129,
                  child: Column(
                    children: [
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: InkWell(
                          onTap: () {
                            // if user have not subcription show pop up
                           /* subscribePopUp == true
                                ? showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        backgroundColor: Colors.white,
                                        actions: <Widget>[
                                          const SizedBox(
                                            height: 34,
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 30),
                                            child: Center(
                                                child: SizedBox(
                                                    height: 40,
                                                    width: 152,
                                                    child: Text(
                                                      Strings
                                                          .subscriptionPremium,
                                                      style:
                                                          gilroySemiBoldTextStyle(
                                                              fontSize: 16,
                                                              color:
                                                                  Colors.black),
                                                    ))),
                                          ),
                                          const SizedBox(
                                            height: 12,
                                          ),
                                          Center(
                                              child: Text(
                                            "£9.99 / month",
                                            style: gilroySemiBoldTextStyle(
                                                fontSize: 26,
                                                color: Colors.black),
                                          )),
                                          const SizedBox(
                                            height: 16,
                                          ),
                                          Center(
                                            child: Container(
                                              height: 30,
                                              width: 101,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(46.2),
                                                gradient: const LinearGradient(
                                                  colors: [
                                                    ColorRes.color_4F359B,
                                                    ColorRes.color_B279DB,
                                                  ],
                                                  begin: Alignment.topLeft,
                                                  end: Alignment.topRight,
                                                ),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "Subscribe",
                                                  style: gilroyBoldTextStyle(
                                                      fontSize: 9.6),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 21,
                                          ),
                                        ],
                                      );
                                    })
                                :*/     Get.to(() => AddStoryScreen());
                          },
                          child: SizedBox(
                            width: 80,
                            child: Stack(
                              children: [
                                controller.controller.viewProfile.data ==
                                            null ||
                                        controller.controller.viewProfile.data!
                                                .profileImage
                                                .toString() ==
                                            ""
                                    ? Container(
                                        height: 56,
                                        width: 56,
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                image: AssetImage(AssetRes
                                                    .portrait_placeholder))),
                                      )
                                    : ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
                                        child: Image.network(
                                          controller.controller.viewProfile
                                              .data!.profileImage
                                              .toString(),
                                          height: 56,
                                          width: 56,
                                          fit: BoxFit.cover,
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            return Image.asset(
                                                AssetRes.portrait_placeholder);
                                          },
                                        )),
                                Positioned(
                                    top: Get.height * 0.04,
                                    left: Get.width * 0.1,
                                    child: const Image(
                                      image: AssetImage(AssetRes.plusIcons),
                                      height: 24,
                                      width: 24,
                                    )),
                                Positioned(
                                  top: Get.height * 0.04,
                                  child: Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: ColorRes.color_B9A2FD
                                              .withOpacity(0.3),
                                          spreadRadius: 1,
                                          blurRadius: 10,
                                          offset: const Offset(4, 5),
                                        ),
                                      ],
                                      gradient: LinearGradient(
                                        colors: [
                                          ColorRes.color_B9A2FD
                                              .withOpacity(0.1),
                                          ColorRes.color_B9A2FD
                                              .withOpacity(0.1),
                                          ColorRes.color_B9A2FD
                                              .withOpacity(0.1),
                                          ColorRes.color_B9A2FD
                                              .withOpacity(0.1),
                                        ],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                      ),
                                    ),
                                  ),
                                ), /*subscribePopUp==true?Positioned(top: Get.height*0.058,
                                    child: Image.asset(AssetRes.lockSub,height: 18,width: 18,)):const SizedBox()*/
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        Strings.myStory,
                        style: textStyleFont14WhiteBold,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: Get.width * 0.01,
                ),
                // my story

                controller.myStoryController.viewStoryController.storyModel
                            .myStory ==
                        null
                    ? const SizedBox()
                    : Visibility(
                        visible: controller.myStoryController
                            .viewStoryController.storyModel.myStory!.isNotEmpty,
                        child: SizedBox(
                          height: 129,
                          child: Column(
                            children: [
                              SizedBox(
                                height: Get.height * 0.02,
                              ),
                              InkWell(
                                onTap: controller.onNewStoryTap,
                                child: Stack(
                                  children: [
                                    controller.controller.viewProfile.data ==
                                                null ||
                                            controller.controller.viewProfile
                                                    .data!.profileImage
                                                    .toString() ==
                                                ""
                                        ? Container(
                                            height: 56,
                                            width: 56,
                                            decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                    image: AssetImage(AssetRes
                                                        .portrait_placeholder))),
                                          )
                                        : ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            child: FadeInImage(
                                              height: 56,
                                              width: 56,
                                              placeholder: const AssetImage(
                                                  AssetRes
                                                      .portrait_placeholder),
                                              image: NetworkImage(controller
                                                  .controller
                                                  .viewProfile
                                                  .data!
                                                  .profileImage
                                                  .toString()),
                                              fit: BoxFit.cover,
                                            )),
                                    // Positioned(
                                    //   top: Get.height * 0.04,
                                    //   child: Container(
                                    //     height: 50,
                                    //     width: 50,
                                    //     decoration: BoxDecoration(
                                    //       boxShadow: [
                                    //         BoxShadow(
                                    //           color: ColorRes.color_B9A2FD
                                    //               .withOpacity(0.3),
                                    //           spreadRadius: 2,
                                    //           blurRadius: 10,
                                    //           offset: const Offset(4, 5),
                                    //         ),
                                    //       ],
                                    //       gradient: LinearGradient(
                                    //         colors: [
                                    //           ColorRes.color_B9A2FD
                                    //               .withOpacity(0.1),
                                    //           ColorRes.color_B9A2FD
                                    //               .withOpacity(0.1),
                                    //           ColorRes.color_B9A2FD
                                    //               .withOpacity(0.1),
                                    //           ColorRes.color_B9A2FD
                                    //               .withOpacity(0.1),
                                    //         ],
                                    //         begin: Alignment.topCenter,
                                    //         end: Alignment.bottomCenter,
                                    //       ),
                                    //     ),
                                    //   ),
                                    // )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Text(
                                controller.controller.viewProfile.data == null
                                    ? ""
                                    : controller
                                        .controller.viewProfile.data!.fullName
                                        .toString(),
                                style: textStyleFont14WhiteBold,
                              ),
                            ],
                          ),
                        ),
                      ),
                SizedBox(
                  height: 129,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: viewStoryController.storyModel.friendsStory ==
                            null
                        ? 0
                        : viewStoryController.storyModel.friendsStory!.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 15,
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height: Get.height * 0.02,
                                ),
                                GestureDetector(
                                  onTap: () =>
                                      controller.onFriedStoryTap(index),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child: FadeInImage(
                                        height: 56,
                                        width: 56,
                                        placeholder: const AssetImage(
                                            AssetRes.portrait_placeholder),
                                        image: NetworkImage(viewStoryController
                                            .storyModel
                                            .friendsStory![index]
                                            .userDetail!
                                            .profileImage
                                            .toString()),
                                        fit: BoxFit.cover,
                                      )),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  viewStoryController.storyModel
                                      .friendsStory![index].userDetail!.fullName
                                      .toString(),
                                  style: gilroyMediumTextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget seeAll() {
    return GetBuilder<ConnectionsController>(
      id: "connection",
      builder: (controller) {
        return controller.requestUsers.isEmpty
            ? const SizedBox()
            : Obx(() {
                return Container(
                  width: Get.width,
                  color: Colors.white,
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: InkWell(
                              onTap: () {
                                ConnectionsController connectionController =
                                    Get.put(ConnectionsController());
                                connectionController.init();
                                Get.to(() => ConnectionsScreen());
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 12.0),
                                child: Text(
                                  Strings.seeAll,
                                  style: gilroyBoldTextStyle(
                                      fontSize: 12,
                                      color: ColorRes.color_9597A1),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemCount: controller.requestUsers.length < 2
                                ? controller.requestUsers.length
                                : 2,
                            itemBuilder: (context, index) {
                              RequestUser user = controller.requestUsers[index];
                              return Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10, bottom: 14),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child: Image.network(
                                        user.profileImage.toString(),
                                        fit: BoxFit.cover,
                                        height: 50,
                                        width: 50,
                                        errorBuilder: (context, url, error) =>
                                            ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          child: Image.asset(
                                            AssetRes.portrait_placeholder,
                                            height: 50,
                                            width: 50,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        user.fullName.toString(),
                                        style: montserratRegularTextStyle(
                                            color: Colors.black, fontSize: 16),
                                      ),
                                      SizedBox(
                                        width: Get.width * 0.4,
                                        child: Text(
                                          user.userStatus.toString(),
                                          style: montserratRegularTextStyle(
                                              color: Colors.black,
                                              fontSize: 12),
                                        ),
                                      ),
                                      SizedBox(
                                        height: Get.height * 0.03,
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: Get.width * 0.11,
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 20.0),
                                    child: InkWell(
                                      onTap: () {
                                        controller.onAddBtnTap(
                                            user.id.toString(), false);
                                      },
                                      child: const SizedBox(
                                        height: 40,
                                        width: 40,
                                        child: Image(
                                          image: AssetImage(AssetRes.profilep),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: Get.width * 0.04,
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 20.0),
                                    child: InkWell(
                                      onTap: () {
                                        controller.onDeleteBtnTap(
                                            user.id.toString(), false);
                                      },
                                      child: const SizedBox(
                                          height: 40,
                                          width: 40,
                                          child: Image(
                                              image:
                                                  AssetImage(AssetRes.delete))),
                                    ),
                                  ),
                                ],
                              );
                            },
                          )
                        ],
                      ),
                      controller.loader.isTrue
                          ? const SmallLoader()
                          : const SizedBox()
                    ],
                  ),
                );
              });
      },
    );
  }

  Widget latestFeed() {
    return GetBuilder<HomeController>(
      id: "home",
      builder: (controller) {
        return ListView.builder(
          controller: controller.scrollController,
          // itemCount: controller.isAd.length,
          padding: const EdgeInsets.only(bottom: 60),
          itemCount: controller.friendPostListData.length + 3,
          itemBuilder: (context, index) {
            if (index == 0) {
              return discover();
            } else if (index == 1) {
              Widget emptyWidget = SizedBox(
                width: Get.width,
                height: Get.height / 2.5,
                child: Center(
                  child: Text(
                    "No feed Available",
                    style:
                        gilroyBoldTextStyle(fontSize: 20, color: Colors.black),
                  ),
                ),
              );
              if (controller.friendPostListData.isEmpty) {
                return Column(
                  children: [
                    seeAll(),
                    emptyWidget,
                  ],
                );
              }
              return seeAll();
            } else if (index == 2) {
              if (controller.friendPostListData.isNotEmpty) {
                return latestFeedTitle();
              } else {
                return const SizedBox();
              }
            }
            index = index - 3;
            return /* controller.isAd[index]
                    ?*/
                VisibilityDetector(
              key: Key(index.toString()),
              onVisibilityChanged: (info) {
                if (info.visibleFraction == 1) {
                  controller.postViewData(
                      controller.friendPostListData[index].id.toString());
                  print("++++++++++++++++++$index");
                }
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 22.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        width: Get.width * 0.92266,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.white),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15.0, top: 20),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child: /* FadeInImage(
                                              height: 40,
                                              width: 40,
                                              placeholder: const AssetImage(
                                                  AssetRes
                                                      .portrait_placeholder),
                                              image: NetworkImage(controller
                                                  .friendPostListData[
                                                      index]
                                                  .postUser!
                                                  .profileImage
                                                  .toString()),
                                              fit: BoxFit.cover,
                                            )*/
                                          CachedNetworkImage(
                                        height: 40,
                                        width: 40,
                                        imageUrl: controller
                                            .friendPostListData[index]
                                            .postUser!
                                            .profileImage
                                            .toString(),
                                        fit: BoxFit.cover,
                                        placeholder: (context, url) =>
                                            Image.asset(
                                          AssetRes.placeholderImage,
                                          height: 40,
                                          width: 40,
                                        ),
                                        errorWidget: (context, url, error) =>
                                            Image.asset(
                                          AssetRes.placeholderImage,
                                          height: 40,
                                          width: 40,
                                        ),
                                      )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 20.0, left: 12),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        controller.friendPostListData[index]
                                            .postUser!.fullName
                                            .toString(),
                                        style:
                                            gilroyBoldTextStyle(fontSize: 16),
                                      ),
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        controller.timeAgo(controller
                                            .friendPostListData[index]
                                            .createdAt!),
                                        style: textStyleFont12White400,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: Get.height * 0.02,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8, right: 8),
                              /*child: RichText(
                                text: TextSpan(
                                  children: controller
                                      .friendPostListData[index].postTag!
                                      .map<TextSpan>((e) => TextSpan(
                                          text: " @${e.name.toString()}",
                                          style: sfProTextReguler(
                                              fontSize: 16,
                                              color: ColorRes.color_FED785)))
                                      .toList()
                                    ..add(TextSpan(
                                        text:
                                            " ${controller.friendPostListData[index].description.toString()}",
                                        style: textStyleFont16WhitLight)),
                                ),
                              ),*/
                              child: DecoratedText(
                                text:
                                    '${controller.friendPostListData[index].postTag!.map<String>((e) => "@${e.name}").toList().join(' ')} ${controller.friendPostListData[index].description}',
                                rules: [
                                  DecoratorRule.startsWith(
                                    text: "@",
                                    style: sfProTextReguler(
                                      fontSize: 16,
                                      color: ColorRes.color_FED785,
                                    ),
                                    onTap: (val) => controller.onTagTap(
                                        controller
                                            .friendPostListData[index].postTag
                                            ?.firstWhereOrNull((element) =>
                                                element.name ==
                                                val.replaceAll('@', ''))
                                            ?.idUser
                                            ?.toString()),
                                  ),
                                  DecoratorRule.startsWith(
                                    text: "#",
                                    style: sfProTextReguler(
                                      fontSize: 16,
                                      color: ColorRes.color_FED785,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            /*    Row(
                                      children: [
                                        Expanded(
                                          child: ListView.builder(
                                            shrinkWrap: true,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            itemCount: controller
                                                    .friendPostListData[index]
                                                    .postTag
                                                    ?.length ??
                                                0,
                                            itemBuilder: (context, index1) {
                                              return Text(
                                                " @${controller.friendPostListData[index].postTag?[index1].name.toString()}",
                                                style: sfProTextReguler(
                                                    fontSize: 16,
                                                    color:
                                                        ColorRes.color_FED785),
                                              );
                                            },
                                          ),
                                        ),

                                      ],
                                    ),
                                        controller.friendPostListData[index]
                                            .description ==
                                            null
                                            ? const SizedBox()
                                            : Center(
                                          child: SizedBox(
                                            width: Get.width * 0.85333,
                                            child: Text(
                                              controller
                                                  .friendPostListData[
                                              index]
                                                  .description
                                                  .toString(),
                                              style:
                                              textStyleFont16WhitLight,
                                            ),
                                          ),
                                        ),*/
                            SizedBox(
                              height: Get.height * 0.025,
                            ),
                            controller
                                    .friendPostListData[index].postList!.isEmpty
                                ? const SizedBox()
                                : Container(
                                    margin: const EdgeInsets.only(left: 10),
                                    height: 80,
                                    width: 300,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: controller
                                          .friendPostListData[index]
                                          .postList!
                                          .length,
                                      itemBuilder: (context, index2) {
                                        return Padding(
                                            padding: const EdgeInsets.only(
                                                left: 5, right: 5),
                                            child: controller
                                                        .friendPostListData[
                                                            index]
                                                        .postList![index2] ==
                                                    null
                                                ? const SizedBox()
                                                : CachedNetworkImage(
                                                    height: 80,
                                                    width: 80,
                                                    imageUrl: controller
                                                        .friendPostListData[
                                                            index]
                                                        .postList![index2],
                                                    fit: BoxFit.cover,
                                                    placeholder:
                                                        (context, url) =>
                                                            Image.asset(
                                                      AssetRes.placeholderImage,
                                                      height: 80,
                                                      width: 80,
                                                    ),
                                                    errorWidget:
                                                        (context, url, error) =>
                                                            Image.asset(
                                                      AssetRes.placeholderImage,
                                                      height: 80,
                                                      width: 80,
                                                    ),
                                                  ));
                                      },
                                    ),
                                  ),
                            SizedBox(
                              height: Get.height * 0.01,
                            ),
                            controller.friendPostListData[index].postLikeUser!
                                    .isEmpty
                                ? const SizedBox()
                                : Padding(
                                    padding: const EdgeInsets.only(left: 15.0),
                                    child: SizedBox(
                                      height: 32,
                                      width: 140,
                                      child: Stack(
                                        children: [
                                          ListView.builder(
                                            itemCount: 3,
                                            itemBuilder: (context, index2) {
                                              return Row(
                                                children: [
                                                  controller
                                                          .friendPostListData[
                                                              index]
                                                          .postLikeUser!
                                                          .isEmpty
                                                      ? const SizedBox()
                                                      : ImageStack(
                                                          imageList: controller
                                                              .friendPostListData[
                                                                  index]
                                                              .postLikeUser!
                                                              .map((e) => e
                                                                  .profileImage
                                                                  .toString())
                                                              .toList(),
                                                          totalCount: 3,
                                                          // If larger than images.length, will show extra empty circle
                                                          imageRadius: 32,
                                                          // Radius of each images
                                                          imageCount: 3,
                                                          // Maximum number of images to be shown in stack
                                                          imageBorderWidth: 2,
                                                          imageBorderColor:
                                                              Colors.white,
                                                          showTotalCount: false,
                                                          // Border width around the images
                                                        ),
                                                  const SizedBox(
                                                    width: 8,
                                                  ),
                                                  controller
                                                              .friendPostListData[
                                                                  index]
                                                              .postLikeCount
                                                              .toString() ==
                                                          "0"
                                                      ? const Text("")
                                                      : InkWell(
                                                          onTap: () {
                                                            controller.onLikeBtnTap(
                                                                postId: controller
                                                                    .friendPostListData[
                                                                        index]
                                                                    .id
                                                                    .toString(),
                                                                friendPost:
                                                                    controller
                                                                            .friendPostListData[
                                                                        index]);
                                                          },
                                                          child: Text(
                                                            controller
                                                                        .friendPostListData[
                                                                            index]
                                                                        .postLikeCount
                                                                        .toString() ==
                                                                    "1"
                                                                ? "${controller.friendPostListData[index].postLikeCount.toString()} likes"
                                                                : "+${controller.friendPostListData[index].postLikeCount.toString()} likes",
                                                            style:
                                                                textStyleFont14White,
                                                          ),
                                                        )
                                                ],
                                              );
                                            },
                                          ),

                                          /*Positioned(
                                              left: 24,
                                              child:   controller
                                                  .friendPostViewModel
                                                  .data![index].postLikeUser!.isEmpty?const SizedBox():Container(
                                                height: 32,
                                                width: 32,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.white,
                                                        width: 2),
                                                    shape: BoxShape.circle,
                                                    image: DecorationImage(
                                                            image: NetworkImage(
                                                                controller
                                                                    .friendPostViewModel
                                                                    .data![index].postLikeUser![index].profileImage.toString()))),
                                              ),
                                            ),
                                            Positioned(
                                              left: 48,
                                              child: Container(
                                                height: 32,
                                                width: 32,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.white,
                                                        width: 2),
                                                    shape: BoxShape.circle,
                                                    image:
                                                        const DecorationImage(
                                                            image: AssetImage(
                                                                AssetRes
                                                                    .lt3))),
                                              ),
                                            ),*/

                                          /*   Positioned(
                                                left: Get.width * 0.25,
                                                top: Get.height * 0.01,
                                                child: Text(
                                                  "+${ controller
                                                      .friendPostViewModel
                                                      .data![index]
                                                      .postLikeCount
                                                      .toString()} likes",
                                                  style:
                                                      textStyleFont14White,
                                                ))*/
                                        ],
                                      ),
                                    ),
                                  ),
                            const SizedBox(
                              height: 7,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      controller.onPostViewUser(
                                          postId: controller
                                              .friendPostListData[index].id
                                              .toString(),
                                          friendPost: controller
                                              .friendPostListData[index]);
                                    },
                                    child: const SizedBox(
                                        height: 18,
                                        width: 18,
                                        child: Image(
                                            image: AssetImage(AssetRes.eye))),
                                  ),
                                  Text(
                                    controller
                                        .friendPostListData[index].postViewcount
                                        .toString(),
                                    style: gilroyMediumTextStyle(fontSize: 10),
                                  ),
                                  const Spacer(),
                                  InkWell(
                                    onTap: () async {
                                      controller.share(controller
                                          .friendPostListData[index].id
                                          .toString());
                                      /*    controller.sharePostData(
                                                  controller
                                                      .friendPostViewModel
                                                      .data![index]
                                                      .id
                                                      .toString());*/
                                    },
                                    child: const SizedBox(
                                        height: 18,
                                        width: 18,
                                        child: Image(
                                            image:
                                                AssetImage(AssetRes.vector))),
                                  ),
                                  const SizedBox(
                                    width: 2,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 2.0),
                                    child: Text(
                                      controller.friendPostListData[index]
                                          .postShareCount
                                          .toString(),
                                      style:
                                          gilroyMediumTextStyle(fontSize: 10),
                                    ),
                                  ),
                                  SizedBox(
                                    width: Get.width * 0.05,
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      commentsController.commentPostListData(
                                          idPost: controller
                                              .friendPostListData[index].id
                                              .toString());
                                      Get.to(() => CommentScreen(
                                                idPost: controller
                                                    .friendPostListData[index]
                                                    .id
                                                    .toString(),
                                                fullName: controller
                                                    .friendPostListData[index]
                                                    .postUser!
                                                    .fullName
                                                    .toString(),
                                                profileImage: controller
                                                    .friendPostListData[index]
                                                    .postUser!
                                                    .profileImage
                                                    .toString(),
                                              ))!
                                          .then((value) async {
                                        await controller
                                            .friendPostDataWithOutPagination();
                                      });
                                    },
                                    child: const SizedBox(
                                      height: 18,
                                      width: 18,
                                      child: Image(
                                        image: AssetImage(
                                          AssetRes.comment,
                                        ),
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 2,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 2.0),
                                    child: Text(
                                      controller.friendPostListData[index]
                                          .postCommentCount
                                          .toString(),
                                      style:
                                          gilroyMediumTextStyle(fontSize: 10),
                                    ),
                                  ),
                                  SizedBox(
                                    width: Get.width * 0.05,
                                  ),
                                  controller.friendPostListData[index].isLike ==
                                          "no"
                                      ? InkWell(
                                          onTap: () {
                                            controller.likePostData(controller
                                                .friendPostListData[index].id
                                                .toString());
                                          },
                                          child: const SizedBox(
                                              height: 18,
                                              width: 18,
                                              child: Image(
                                                  image: AssetImage(
                                                      AssetRes.thumbs))),
                                        )
                                      : InkWell(
                                          onTap: () {
                                            controller.unLikePostData(controller
                                                .friendPostListData[index].id
                                                .toString());
                                          },
                                          child: const SizedBox(
                                              height: 18,
                                              width: 18,
                                              child: Image(
                                                  color: Colors.red,
                                                  image: AssetImage(
                                                    AssetRes.thumbs,
                                                  ))),
                                        ),
                                  const SizedBox(
                                    width: 2,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5.0),
                                    child: Text(
                                      controller.friendPostListData[index]
                                          .postLikeCount
                                          .toString(),
                                      style:
                                          gilroyMediumTextStyle(fontSize: 10),
                                    ),
                                  ),
                                  SizedBox(
                                    width: Get.width * 0.05,
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
            // : adInLatestFeed();
          },
        );
      },
    );
  }

  Widget latestFeedTitle() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Text(
        Strings.latestFeed,
        style: gilroyBoldTextStyle(fontSize: 20),
      ),
    );
  }
}
