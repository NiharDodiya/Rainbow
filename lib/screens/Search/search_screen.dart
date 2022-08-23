import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/loaders.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/screens/Search/search_controller.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/color_res.dart';
import 'package:rainbow/utils/strings.dart';

class SearchScreen extends StatelessWidget {
  SearchController controller = Get.put(SearchController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchController>(
      id: "Search",
      builder: (controller) {
        return GestureDetector(
          onTap: controller.onScreenTap,
          child: Scaffold(
            backgroundColor: Colors.white,
            body: Obx(() {
              return Stack(
                children: [
                  Column(children: [
                    appBar(),
                    textField(),
                    const SizedBox(
                      height: 15,
                    ),
                    profile(),
                  ]),
                  GetBuilder<SearchController>(
                    id: "Search",
                    builder: (controller) {
                      return controller.advance == true
                          ? Positioned(
                              top: Get.height * 0.105,
                              left: Get.width * 0.58,
                              child: Container(
                                height: 200,
                                width: 142,
                                padding: EdgeInsets.zero,
                                color: ColorRes.color_4F359B,
                                child: ListView.separated(
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        controller
                                            .onTapAdvanceSearchMenu(index);
                                      },
                                      child: Container(
                                        width: 142,
                                        height: 37,
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            left: 10,
                                          ),
                                          child: Text(
                                            controller.advanceSearch[index]
                                                .toString(),
                                            style: gilroyBoldTextStyle(
                                                color: Colors.white,
                                                fontSize: 12),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return const Divider(
                                      thickness: 1,
                                      color: ColorRes.white,
                                      height: 2,
                                    );
                                  },
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: controller.advanceSearch.length,
                                  padding: const EdgeInsets.only(top: 0),
                                ),
                              ),
                            )
                          : const SizedBox();
                    },
                  ),
                  controller.loader.isTrue
                      ? const FullScreenLoader()
                      : const SizedBox()
                ],
              );
            }),
          ),
        );
      },
    );
  }

  Widget appBar() {
    return GetBuilder<SearchController>(
      id: "Search",
      builder: (controller) {
        return AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            Row(
              children: [
                Text(
                  Strings.search,
                  style: gilroyBoldTextStyle(fontSize: 20, color: Colors.black),
                ),
                SizedBox(
                  width: Get.width * 0.47,
                ),
                GestureDetector(
                  onTap: () {
                    controller.advanceSearchOnTap();
                  },
                  child: Text(
                    Strings.advancedSearch,
                    style: gilroyBoldTextStyle(
                            fontSize: 12, color: ColorRes.color_9597A1)
                        .copyWith(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                SizedBox(
                  width: Get.width * 0.05,
                ),
              ],
            )
          ],
        );
      },
    );
  }

  Widget textField() {
    return Container(
      height: 56,
      width: Get.width * 0.9066,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ColorRes.color_9597A1.withOpacity(0.1)),
      child: InkWell(
          onTap: () {},
          child: Row(
            children: [
              SizedBox(
                width: Get.width * 0.04,
              ),
              const Image(
                image: AssetImage(AssetRes.search),
                color: Colors.black,
                height: 16,
                width: 16,
              ),
              SizedBox(
                width: Get.width * 0.03,
              ),
              SizedBox(
                height: 56,
                width: Get.width * 0.7,
                child: TextField(
                  controller: controller.searchBar,
                  obscureText: false,
                  style: textFieldText,
                  minLines: 1,
                  onChanged: (value) => controller.runFilter(value),
                  onSubmitted: (value) => controller.runFilter(value),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(top: 6),
                    border: InputBorder.none,
                    hintStyle: textStyleFont16Grey,
                    hintText: Strings.discoverOtherConnections,
                    /*   filled: true,
                        fillColor: ColorRes.color_9597A1.withOpacity(0.1)*/
                  ),
                ),
              ),
            ],
          )),
    );
  }

  Widget profile() {
    return Expanded(
      child: GetBuilder<SearchController>(
        id: "Search",
        builder: (controller) {
          return SingleChildScrollView(
            controller: controller.scrollController,
            physics: const BouncingScrollPhysics(),
            child: Container(
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
              child: Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(top: 16),
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.listUserData.length,
                    // itemCount: controller.search.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          controller.listConnectBlock[index] = false;
                          controller.onTapViewProfile(
                              controller.listUserData[index].id.toString());
                        },
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                controller.listUserData[index].backgroundImage
                                            .toString() ==
                                        ""
                                    ? ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: SizedBox(
                                          height: 232,
                                          width: Get.width * 0.90133,
                                          child: Image.asset(
                                            AssetRes.placeholderImage,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      )
                                    : ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: Image.network(
                                          controller.listUserData[index]
                                              .backgroundImage
                                              .toString(),
                                          height: 232,
                                          width: Get.width * 0.90133,
                                          fit: BoxFit.cover,
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            return Image.asset(
                                                AssetRes.placeholderImage);
                                          },
                                        ),
                                      ),
                                Positioned(
                                    top: Get.height * 0.03,
                                    left: Get.width * 0.05,
                                    child: controller.listUserData[index]
                                                .profileImage
                                                .toString() !=
                                            ""
                                        ? ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            child: Image.network(
                                              controller.listUserData[index]
                                                  .profileImage
                                                  .toString(),
                                              height: 40,
                                              width: 40,
                                              fit: BoxFit.cover,
                                              errorBuilder:
                                                  (context, error, stackTrace) {
                                                return Image.asset(AssetRes
                                                    .portrait_placeholder);
                                              },
                                            ),
                                          )
                                        : ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            child: SizedBox(
                                              height: 40,
                                              width: 40,
                                              child: Image.asset(AssetRes
                                                  .portrait_placeholder),
                                            ),
                                          )),
                                Container(
                                    height: 232,
                                    width: Get.width * 0.90133,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      gradient: LinearGradient(
                                        colors: [
                                          ColorRes.color_141414
                                              .withOpacity(0.1),
                                          ColorRes.color_141414
                                              .withOpacity(0.1),
                                          ColorRes.color_141414
                                              .withOpacity(0.5),
                                          ColorRes.color_141414
                                              .withOpacity(0.8),
                                          ColorRes.color_141414
                                        ],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                      ),
                                    )),
                                Positioned(
                                    top: Get.height * 0.255,
                                    left: 15,
                                    child: Text(
                                      controller.listUserData[index].fullName
                                          .toString(),
                                      style: textStyleFont14WhiteBold,
                                    )),
                                Positioned(
                                    top: Get.height * 0.28,
                                    left: 15,
                                    child: Text(
                                      controller.listUserData[index].userStatus
                                          .toString(),
                                      style: textStyleFont12White400,
                                    )),
                                Positioned(
                                    top: Get.height * 0.04,
                                    left: Get.width * 0.8,
                                    child: GestureDetector(
                                        onTap: () {
                                          controller.onMoreButtonTap(index);
                                        },
                                        child: const Icon(Icons.more_horiz))),
                                controller.listConnectBlock[index] == true
                                    ? Positioned(
                                        top: Get.height * 0.07,
                                        left: Get.width * 0.58,
                                        child: Container(
                                          height: 69,
                                          width: 105,
                                          color: ColorRes.color_50369C
                                              .withOpacity(0.45),
                                          child: Column(
                                            children: [
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              controller.listUserData[index]
                                                          .isFriends
                                                          .toString() ==
                                                      "no"
                                                  ? GestureDetector(
                                                      onTap: () {
                                                        controller
                                                            .sendFriendRequest(
                                                                controller
                                                                    .listUserData[
                                                                        index]
                                                                    .id
                                                                    .toString());
                                                        controller
                                                                .listConnectBlock[
                                                            index] = false;
                                                        controller
                                                            .update(["Search"]);
                                                      },
                                                      child: Row(
                                                        children: [
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          Image.asset(
                                                            AssetRes.profilep,
                                                            height: 22,
                                                            width: 22,
                                                            color: ColorRes
                                                                .color_FFB2B2,
                                                          ),
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          Text(
                                                            Strings.connect,
                                                            style:
                                                                gilroyBoldTextStyle(
                                                                    fontSize:
                                                                        12),
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  : controller
                                                              .listUserData[
                                                                  index]
                                                              .isFriends
                                                              .toString() ==
                                                          "sent"
                                                      ? GestureDetector(
                                                          onTap: () {
                                                            controller.cancelFriendRequest(
                                                                controller
                                                                    .listUserData[
                                                                        index]
                                                                    .id
                                                                    .toString());
                                                            controller
                                                                    .listConnectBlock[
                                                                index] = false;
                                                            controller.update(
                                                                ["Search"]);
                                                          },
                                                          child: Row(
                                                            children: [
                                                              const SizedBox(
                                                                width: 10,
                                                              ),
                                                              Image.asset(
                                                                AssetRes
                                                                    .profilep,
                                                                height: 22,
                                                                width: 22,
                                                                color: ColorRes
                                                                    .color_FFB2B2,
                                                              ),
                                                              const SizedBox(
                                                                width: 10,
                                                              ),
                                                              SizedBox(
                                                                height: 26,
                                                                width: 54,
                                                                child: Text(
                                                                  Strings
                                                                      .cancelRequest,
                                                                  style: gilroyBoldTextStyle(
                                                                      fontSize:
                                                                          12),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        )
                                                      : controller
                                                                  .listUserData[
                                                                      index]
                                                                  .isFriends
                                                                  .toString() ==
                                                              "yes"
                                                          ? GestureDetector(
                                                              onTap: () {
                                                                controller.unFriendRequest(controller
                                                                    .listUserData[
                                                                        index]
                                                                    .id
                                                                    .toString());
                                                                controller.listConnectBlock[
                                                                        index] =
                                                                    false;
                                                                controller
                                                                    .update([
                                                                  "Search"
                                                                ]);
                                                              },
                                                              child: Row(
                                                                children: [
                                                                  const SizedBox(
                                                                    width: 10,
                                                                  ),
                                                                  Image.asset(
                                                                    AssetRes
                                                                        .profilep,
                                                                    height: 22,
                                                                    width: 22,
                                                                    color: ColorRes
                                                                        .color_FFB2B2,
                                                                  ),
                                                                  const SizedBox(
                                                                    width: 10,
                                                                  ),
                                                                  Text(
                                                                    Strings
                                                                        .unFriend,
                                                                    style: gilroyBoldTextStyle(
                                                                        fontSize:
                                                                            12),
                                                                  )
                                                                ],
                                                              ),
                                                            )
                                                          : controller
                                                                      .listUserData[
                                                                          index]
                                                                      .isFriends
                                                                      .toString() ==
                                                                  "accept"
                                                              ? GestureDetector(
                                                                  onTap: () {
                                                                    controller.acceptFriendRequest(controller
                                                                        .listUserData[
                                                                            index]
                                                                        .id
                                                                        .toString());
                                                                    controller.listConnectBlock[
                                                                            index] =
                                                                        false;
                                                                    controller
                                                                        .update([
                                                                      "Search"
                                                                    ]);
                                                                  },
                                                                  child: Row(
                                                                    children: [
                                                                      const SizedBox(
                                                                        width:
                                                                            10,
                                                                      ),
                                                                      Image
                                                                          .asset(
                                                                        AssetRes
                                                                            .profilep,
                                                                        height:
                                                                            22,
                                                                        width:
                                                                            22,
                                                                        color: ColorRes
                                                                            .color_FFB2B2,
                                                                      ),
                                                                      const SizedBox(
                                                                        width:
                                                                            10,
                                                                      ),
                                                                      Text(
                                                                        Strings
                                                                            .accept,
                                                                        style: gilroyBoldTextStyle(
                                                                            fontSize:
                                                                                12),
                                                                      )
                                                                    ],
                                                                  ),
                                                                )
                                                              : GestureDetector(
                                                                  onTap: () {
                                                                    controller.cancelFriendRequest(controller
                                                                        .listUserData[
                                                                            index]
                                                                        .id
                                                                        .toString());
                                                                    controller.listConnectBlock[
                                                                            index] =
                                                                        false;
                                                                    controller
                                                                        .update([
                                                                      "Search"
                                                                    ]);
                                                                  },
                                                                  child: Row(
                                                                    children: [
                                                                      const SizedBox(
                                                                        width:
                                                                            10,
                                                                      ),
                                                                      Image
                                                                          .asset(
                                                                        AssetRes
                                                                            .profilep,
                                                                        height:
                                                                            22,
                                                                        width:
                                                                            22,
                                                                        color: ColorRes
                                                                            .color_FFB2B2,
                                                                      ),
                                                                      const SizedBox(
                                                                        width:
                                                                            10,
                                                                      ),
                                                                      Text(
                                                                        Strings
                                                                            .cancel,
                                                                        style: gilroyBoldTextStyle(
                                                                            fontSize:
                                                                                12),
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                              const Divider(
                                                thickness: 1.5,
                                                color: Colors.white,
                                              ),
                                              controller.listUserData[index]
                                                          .isBlock
                                                          .toString() ==
                                                      "no"
                                                  ? GestureDetector(
                                                      onTap: () {
                                                        controller.blockOnTap(
                                                            controller
                                                                .listUserData[
                                                                    index]
                                                                .id
                                                                .toString());
                                                        controller
                                                                .listConnectBlock[
                                                            index] = false;
                                                        controller
                                                            .update(["Search"]);
                                                      },
                                                      child: Row(
                                                        children: [
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          Image.asset(
                                                            AssetRes.block,
                                                            height: 22,
                                                            width: 22,
                                                            color: ColorRes
                                                                .color_FFB2B2,
                                                          ),
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          Text(
                                                            Strings.block,
                                                            style:
                                                                gilroyBoldTextStyle(
                                                                    fontSize:
                                                                        12),
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  : GestureDetector(
                                                      onTap: () {
                                                        controller.unblockOnTap(
                                                            controller
                                                                .listUserData[
                                                                    index]
                                                                .id
                                                                .toString());
                                                        controller
                                                                .listConnectBlock[
                                                            index] = false;
                                                        controller
                                                            .update(["Search"]);
                                                      },
                                                      child: Row(
                                                        children: [
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          Image.asset(
                                                            AssetRes.block,
                                                            height: 22,
                                                            width: 22,
                                                            color: ColorRes
                                                                .color_FFB2B2,
                                                          ),
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          Text(
                                                            Strings.unBlock,
                                                            style:
                                                                gilroyBoldTextStyle(
                                                                    fontSize:
                                                                        12),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                            ],
                                          ),
                                        ),
                                      )
                                    : const SizedBox()
                              ],
                            ),
                            SizedBox(
                              height: Get.height * 0.026,
                            ),
                          ],
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
