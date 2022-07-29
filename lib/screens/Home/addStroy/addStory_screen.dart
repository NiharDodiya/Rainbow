import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:rainbow/common/Widget/loaders.dart';
import 'package:rainbow/screens/Home/addStroy/addStory_controller.dart';
import 'package:rainbow/screens/Home/addStroy/widgets/addStoryAppbar.dart';
import 'package:rainbow/screens/Home/addStroy/widgets/addStoryCamera.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/color_res.dart';

class AddStoryScreen extends StatefulWidget {
  AddStoryScreen({Key? key}) : super(key: key);

  @override
  State<AddStoryScreen> createState() => _AddStoryScreenState();
}

class _AddStoryScreenState extends State<AddStoryScreen> {
  AddStoryController controller = Get.put(AddStoryController());

  ScrollController scrollController = ScrollController();
  List<Widget> _mediaList = [];
  int currentPage = 0;
  int? lastPage;
  int totalVideos = 0;
  List<AssetEntity> videoList = [];

  @override
  void initState() {
    super.initState();
    fetchNewVideos();
    scrollController.addListener(() async {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        double position = scrollController.position.pixels;
        if (videoList.length < totalVideos) {
          await fetchNewVideos().then((value) {
            Future.delayed(const Duration(milliseconds: 100), () {
              scrollController.jumpTo(position + 200);
            });
          });
        }
      }
    });
  }

  Future<void> fetchNewVideos() async {
    lastPage = currentPage;
    controller.loader.value = true;
    List<AssetPathEntity> albums = await PhotoManager.getAssetPathList(
        onlyAll: true, type: RequestType.image);

    totalVideos = albums[0].assetCount;
    List<AssetEntity> media =
        await albums[0].getAssetListPaged(page: currentPage, size: 60);

    media.forEach((element) {
      if (element.size > Offset.zero) {
        videoList.add(
          AssetEntity(
              id: element.id,
              typeInt: element.typeInt,
              width: element.width,
              height: element.height),
        );
      }
    });
    currentPage++;
    controller.loader.value = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() {
        if (controller.loader.isTrue) {
          return const FullScreenLoader();
        } else {
          return SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                addStoryAppBar(controller),
                SizedBox(
                  height: Get.height * 0.04,
                ),
                Expanded(
                  child: GridView.builder(
                    controller: scrollController,
                    itemCount: videoList.length + 1,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1.1 / 2,
                      mainAxisSpacing: 2,
                      crossAxisSpacing: 2,
                    ),
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return addStoryCamera(controller);
                      }
                      return FutureBuilder<Uint8List?>(
                        future: videoList[index - 1].thumbnailDataWithSize(
                            const ThumbnailSize(200, 200)),
                        builder: (context, snapshot) {
                          return snapshot.hasData
                              ? InkWell(
                                  onTap: () => controller
                                      .onImageTap(videoList[index - 1].file),
                                  child: Image.memory(
                                    //model.videoAvatar[index],
                                    snapshot.data!,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : Image.asset(
                                  AssetRes.home,
                                  color: ColorRes.red.withOpacity(0.5),
                                );
                        },
                      );
                    },
                  ),
                )
                // gallaryImage()
              ],
            ),
          );
        }
      }),
    );
  }

  Widget gallaryImage() {
    return SizedBox(
      height: Get.height * 0.85,
      width: Get.width,
      child: GridView.builder(
          itemCount: _mediaList.length,
          controller: scrollController,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1.1 / 2,
            mainAxisSpacing: 2,
            crossAxisSpacing: 2,
          ),
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return addStoryCamera(controller);
            }
            return _mediaList[index + 1];
          }),
    );
  }
}
