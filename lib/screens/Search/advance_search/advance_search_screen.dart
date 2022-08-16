import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/loaders.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/screens/Home/home_controller.dart';
import 'package:rainbow/screens/Home/settings/connections/connections_controller.dart';
import 'package:rainbow/screens/Home/settings/connections/connections_screen.dart';
import 'package:rainbow/screens/Home/view_story/view_story_controller.dart';
import 'package:rainbow/screens/Search/advance_search/advance_search_controller.dart';
import 'package:rainbow/screens/Search/search_controller.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/color_res.dart';
import 'package:rainbow/utils/strings.dart';

class AdvanceSearchScreen extends StatelessWidget {
  final String title;

  AdvanceSearchScreen({Key? key, required this.title}) : super(key: key);
  SearchController searchController = Get.put(SearchController());
  HomeController homeController = Get.put(HomeController());


  @override
  Widget build(BuildContext context) {
    searchController.findUserDistance();
    return Scaffold(
        body: GetBuilder<SearchController>(
      id: "Search",
      builder: (controller) {
        return Obx(() {
          return Stack(
            children: [
              SafeArea(
                child: Container(
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
                  child: Stack(
                    children: [
                      appBar(title: title),
                      const SizedBox(
                        height: 20,
                      ),
                      searchUser(),
                      userProfile(controller),
                      listOfUser(controller)
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
    ));
  }

  Widget appBar({String? title}) {
    return SizedBox(
      width: Get.width,
      child: Column(
        children: [
          SizedBox(
            height: Get.height * 0.03,
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Image.asset(
                    AssetRes.backIcon,
                    height: 16,
                    width: 16,
                    color: Colors.white,
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      title ?? "Advance Search",
                      style: gilroyBoldTextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  ConnectionsController connectionController =
                      Get.put(ConnectionsController());
                  connectionController.init();
                  Get.to(() => ConnectionsScreen());
                },
                child: Stack(
                  children: [
                    const SizedBox(
                      height: 30,
                      width: 30,
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      child: SizedBox(
                        height: 24,
                        width: 24,
                        child: Image.asset(AssetRes.notificationIcon),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                        height: 16,
                        width: 16,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: ColorRes.color_FF6B97),
                        child: const Text(
                          "0",
                          style: TextStyle(
                            color: ColorRes.white,
                            fontSize: 8,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 10,
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget searchUser() {
    return Positioned(
      top: Get.height * 0.1,
      child: Container(
        height: 45,
        width: Get.width,
        padding: const EdgeInsets.only(
          left: 36,
          right: 36,
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 45,
                decoration: const BoxDecoration(
                  color: ColorRes.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
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
                    Expanded(
                      child: SizedBox(
                        height: 56,
                        child: TextField(
                          obscureText: false,
                          style: textFieldText,
                          minLines: 1,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(),
                            border: InputBorder.none,
                            hintStyle: textStyleFont16Grey,
                            hintText: Strings.enterLocation,
                            /*   filled: true,
                                  fillColor: ColorRes.color_9597A1.withOpacity(0.1)*/
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 45,
              width: 45,
              margin: const EdgeInsets.only(left: 9),
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                color: ColorRes.black,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: Image.asset(
                AssetRes.filterIcon,
                height: 15,
                width: 15,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget listOfUser(SearchController controller) {
    return Positioned(
      top: Get.height * 0.6155,
      child: Container(
        width: Get.width,
        height: 250,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12), topRight: Radius.circular(12))),
        child: ListView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.only(top: 5, bottom: 20),
          itemCount: controller.listUseProfileModel.data == null
              ? 0
              : controller.listUseProfileModel.data!.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 25, left: 20),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.network(
                      controller.listUseProfileModel.data![index].profileImage
                          .toString(),
                      height: 50,
                      width: 50,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          AssetRes.portrait_placeholder,
                          height: 50,
                          width: 50,
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.listUseProfileModel.data![index].fullName
                            .toString(),
                        style: gilroyMediumTextStyle(
                            fontSize: 16, color: ColorRes.color_303030),
                      ),
                      Text(
                          controller.listUseProfileModel.data![index].userStatus
                              .toString(),
                          style: gilroyMediumTextStyle(
                              fontSize: 16, color: ColorRes.color_979797)),
                    ],
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      searchController.sendFriendRequestAdvance(controller
                          .listUseProfileModel.data![index].id
                          .toString());
                    },
                    child: Image.asset(
                      AssetRes.addPeople,
                      height: 40,
                      width: 40,
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget userProfile(SearchController controller) {
    return Padding(
      padding: EdgeInsets.only(top: Get.height * 0.16),
      child: SizedBox(
        height: 400,
        width: 400,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(
                AssetRes.searchBackground,
                height: 400,
                width: 400,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: CachedNetworkImage(
                  height: 100,
                  width: 100,
                  imageUrl: homeController
                      .controller.viewProfile.data!.profileImage
                      .toString(),
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Image.asset(
                    AssetRes.portrait_placeholder,
                    height: 100,
                    width: 100,
                  ),
                  errorWidget: (context, url, error) => Image.asset(
                    AssetRes.portrait_placeholder,
                    height: 100,
                    width: 100,
                  ),
                ),
                /* Image.network( ,
                                      height: 100,
                                      width: 100,
                                      fit: BoxFit.cover,
                                      errorBuilder: (context, error, stackTrace) {
                                        return Image.asset(
                                          AssetRes.portrait_placeholder,
                                          height: 100,
                                          width: 100,
                                        );
                                      },
                                    ),*/
              ),
            ),
            /*       Padding(
                                  padding: const EdgeInsets.only(top: 5.0),
                                  child: ListTile(
                                    title: const Text('Responsive Item Radius'),
                                    subtitle: Slider(
                                      min: 1,
                                      max: 20,
                                      // divisions: 18,
                                      label: controller.radiusOfItemDivider.toStringAsFixed(2),
                                      value: controller.radiusOfItemDivider,
                                      onChanged: (newVal) {
                                        homeController.radiusOfItemDivider = newVal;
                                        homeController.update(["Search"]);
                                      },
                                    ),
                                  ),
                                ),*/
          ],
        ),
      ),
    );
  }
}
