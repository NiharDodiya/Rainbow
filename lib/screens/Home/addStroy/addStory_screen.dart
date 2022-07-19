import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:rainbow/screens/Home/addStroy/addStory_controller.dart';
import 'package:rainbow/screens/Home/addStroy/widgets/addStoryAppbar.dart';
import 'package:rainbow/screens/Home/addStroy/widgets/addStoryCamera.dart';

class AddStoryScreen extends StatefulWidget {
  AddStoryScreen({Key? key}) : super(key: key);

  @override
  State<AddStoryScreen> createState() => _AddStoryScreenState();
}

class _AddStoryScreenState extends State<AddStoryScreen> {
  AddStoryController controller = Get.put(AddStoryController());

  ScrollController? scrollController;
  List<Widget> _mediaList = [];
  int currentPage = 0;
  int? lastPage;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController()
      ..addListener(() {
        _handleScrollEvent();
      });
    _fetchNewMedia();
  }

  _handleScrollEvent() {
    if (scrollController!.position.pixels /
            scrollController!.position.maxScrollExtent >
        0.33) {
      if (currentPage != lastPage) {
        _fetchNewMedia();
      }
    }
  }

  _fetchNewMedia() async {
    lastPage = currentPage;
    var result = await PhotoManager.requestPermissionExtend();
    if (result != null) {
      // success
//load the album list
      List<AssetPathEntity> albums =
          await PhotoManager.getAssetPathList(onlyAll: true);
      print(albums);
      List<AssetEntity> media =
          await albums[0].getAssetListPaged(page: 1, size: 100);
      print(media);
      List<Widget> temp = [];
      for (var asset in media) {
        temp.add(
          FutureBuilder<Uint8List?>(
            future: asset.thumbnailData,
            builder: (BuildContext context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return InkWell(
                  onTap: () => controller.onImageTap(asset.file),
                  child: Stack(
                    children: <Widget>[
                      Positioned.fill(
                        child: Image.memory(
                          snapshot.data!,
                          fit: BoxFit.cover,
                        ),
                      ),
                      // if (asset.type == AssetType.video)
                      //   const Align(
                      //     alignment: Alignment.bottomRight,
                      //     child: Padding(
                      //       padding: EdgeInsets.only(right: 5, bottom: 5),
                      //       child: Icon(
                      //         Icons.videocam,
                      //         color: Colors.white,
                      //       ),
                      //     ),
                      //   ),
                    ],
                  ),
                );
              }
              return const SizedBox();
            },
          ),
        );
      }
      setState(() {
        _mediaList.addAll(temp);
        currentPage++;
      });
    } else {
      // fail
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            addStoryAppBar(controller),
            SizedBox(
              height: Get.height * 0.04,
            ),

            // addStoryCamera(controller),
            /*  InkWell(onTap: () {
            Get.to(MyApp());
          },
              child: const Text("submit",style:TextStyle(color: Colors.black),)),*/
            gallaryImage()
          ],
        ),
      ),
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

/*
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  File? editedFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Story Creator Example'),
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            editedFile != null
                ? Image.file(
                    editedFile!,
                    fit: BoxFit.cover,
                  )
                : const SizedBox.shrink(),
            TextButton(
              onPressed: () async {
                final picker = ImagePicker();
                await picker
                    .pickImage(source: ImageSource.gallery)
                    .then((file) async {
                  editedFile = await Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => StoryCreator(
                        filePath: file!.path,
                      ),
                    ),
                  );
                  if (editedFile != null) {
                    print('editedFile: ' + editedFile!.path);
                    setState(() {});
                  }
                });
              },
              child: const Text('Pick Image'),
            ),
          ],
        ),
      ),
    );
  }
}
*/
