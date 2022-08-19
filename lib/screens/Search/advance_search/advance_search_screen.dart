import 'dart:async';
import 'dart:typed_data';
import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rainbow/common/Widget/loaders.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/screens/Home/home_controller.dart';
import 'package:rainbow/screens/Home/settings/connections/connections_controller.dart';
import 'package:rainbow/screens/Home/settings/connections/connections_screen.dart';
import 'package:rainbow/screens/Search/search_controller.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/color_res.dart';
import 'package:rainbow/utils/strings.dart';
import 'package:search_map_place_updated/search_map_place_updated.dart';

class AdvanceSearchScreen extends StatefulWidget {
  final String title;

  AdvanceSearchScreen({Key? key, required this.title}) : super(key: key);

  @override
  State<AdvanceSearchScreen> createState() => _AdvanceSearchScreenState();
}

class _AdvanceSearchScreenState extends State<AdvanceSearchScreen> {
  SearchController searchController = Get.put(SearchController());

  HomeController homeController = Get.put(HomeController());
  BitmapDescriptor? mapMakers;
  List<Marker> markers = <Marker>[];
  GoogleMapController? googleMapController;

  double latitude = 0;
  double longitude = 0;
  var addressSomeOne = "";
  String? cityName;
  final kInitialPosition = const LatLng(-33.8567844, 151.213108);

  @override
  void initState() {
    loadData();
    super.initState();
  }

  loadData() async {
    for (int i = 0; i < searchController.listLatLongData.length; i++) {
      Uint8List? image1 = await loadNetWorkImage(
          searchController.listLatLongData[i].profileImage.toString());

      final ui.Codec markerImageCodec = await ui.instantiateImageCodec(
          image1.buffer.asUint8List(),
          targetHeight: 80,
          targetWidth: 80);
      final ui.FrameInfo frameInfo = await markerImageCodec.getNextFrame();
      final ByteData? byteData =
          await frameInfo.image.toByteData(format: ui.ImageByteFormat.png);
      final Uint8List resizedImagePicker = byteData!.buffer.asUint8List();
      markers.add(Marker(
        markerId: MarkerId(
          searchController.listLatLongData[i].fullName.toString(),
        ),
        position: LatLng(searchController.listLatLongData[i].latitude!,
            searchController.listLatLongData[i].longitude!),
        icon: BitmapDescriptor.fromBytes(resizedImagePicker),
      ));
      setState(() {});
    }
  }

  Future<Uint8List> loadNetWorkImage(String path) async {
    final completed = Completer<ImageInfo>();
    var image = NetworkImage(path);
    image.resolve(const ImageConfiguration()).addListener(ImageStreamListener(
        (image, synchronousCall) => completed.complete(image)));

    final imageInfo = await completed.future;
    final byteData =
        await imageInfo.image.toByteData(format: ui.ImageByteFormat.png);
    return byteData!.buffer.asUint8List();
  }

  @override
  Widget build(BuildContext context) {
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
                        appBar(title: widget.title),
                        const SizedBox(
                          height: 20,
                        ),
                        /*    searchUser(),*/
                        userProfile(),
                        listOfUser(controller),
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
      ),
    );
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
          itemCount: controller.listLatLongData == null
              ? 0
              : controller.listLatLongData.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 25, left: 20),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.network(
                      controller.listLatLongData[index].profileImage.toString(),
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
                        controller.listLatLongData[index].fullName.toString(),
                        style: gilroyMediumTextStyle(
                            fontSize: 16, color: ColorRes.color_303030),
                      ),
                      Text(
                          controller.listLatLongData[index].userStatus
                              .toString(),
                          style: gilroyMediumTextStyle(
                              fontSize: 16, color: ColorRes.color_979797)),
                    ],
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      searchController.sendFriendRequestAdvance(
                          controller.listLatLongData[index].id.toString());
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

  Widget userProfile() {
    return GetBuilder<SearchController>(
      id: "googleMap",
      builder: (searchController) {
        return Stack(
          children: [

            Padding(
              padding: EdgeInsets.only(top: Get.height * 0.16),
              child: SizedBox(
                height: 400,
                width: 400,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(200),
                      child: SizedBox(
                        height: 400,
                        width: 400,
                        child: GoogleMap(
                          mapType: MapType.normal,
                          markers: Set<Marker>.of(markers),
                          initialCameraPosition: CameraPosition(
                              target: LatLng(
                                  homeController
                                      .controller.viewProfile.data!.latitude!,
                                  homeController
                                      .controller.viewProfile.data!.longitude!),
                              zoom: 15),
                          onMapCreated: (GoogleMapController controller) {
                            setState(() {
                              googleMapController = controller;
                            });
                            searchController.gMapController.complete();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: Get.height * 0.08,
              child: Row(
                children: [
                  SizedBox(
                    width: Get.width * 0.1,
                  ),
                  SizedBox(
                    width: 248.77,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: SearchMapPlaceWidget(
                        firstIcon: const Padding(
                          padding: EdgeInsets.only(right: 10,left: 10),
                          child: SizedBox(
                            child: Image(height: 18,width: 18,
                              image: AssetImage(AssetRes.search),
                              color: Colors.black,
                            ),
                          ),
                        ),
                        placeholder: 'Enter the location',
                        bgColor: Colors.white,
                        textColor: ColorRes.color_09110E,
                        iconColor: Colors.white,
                        placeType: PlaceType.address,
                        apiKey:
                        "sqdcfhhjdsgvfuydsgbv",
                        onSelected: (Place place) async {
                          Geolocation? geolocation =
                          await place.geolocation;
                          googleMapController!.animateCamera(
                              CameraUpdate.newLatLng(
                                  geolocation!.coordinates));
                          googleMapController!.animateCamera(
                              CameraUpdate.newLatLngBounds(
                                  geolocation.bounds, 0));
                        },
                      ),
                    ),
                  ),

                ],
              ),
            ),
            Positioned(top: 55,left: 285,
              child: Container(
                height: 52,
                width: 50,
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
              ),
            )
          ],
        );
      },
    );
  }
}
