import 'dart:async';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rainbow/model/ListUserProfileModel.dart';
import 'package:rainbow/screens/Home/settings/connections/connections_profile/api/OtherProfileApi.dart';
import 'package:rainbow/screens/Home/settings/connections/connections_profile/connections_profile_controller.dart';
import 'package:rainbow/screens/Home/settings/connections/connections_profile/connections_profile_screen.dart';
import 'package:rainbow/screens/Profile/acceptFriendRequest_api/accaeptFriedRequest_api.dart';
import 'package:rainbow/screens/Profile/sendFriendRequest_api/sendFriendRequest_api.dart';
import 'package:rainbow/screens/Profile/unFriendRequest_api/unFriendRequest_api.dart';
import 'package:rainbow/screens/Profile/widget/block_unblock%20_Api/block_api.dart';
import 'package:rainbow/screens/Profile/widget/block_unblock%20_Api/unblock_api.dart';
import 'package:rainbow/screens/Search/ListUserProfile_api/listUserProfile_api.dart';
import 'package:rainbow/screens/Search/advance_search/advance_search_screen.dart';
import 'package:rainbow/utils/asset_res.dart';

import 'package:http/http.dart' as http;

import 'package:google_maps_webservice/src/places.dart';

class SearchController extends GetxController {
  RxBool loader = false.obs;
  bool advance = false;
  int count = 2;
  ListUseProfileModel listUseProfileModel = ListUseProfileModel();

  // RxBool connect = false.obs;
  TextEditingController searchBar = TextEditingController();
  List<ListUserData> data = [];
  int page = 1;
  int limit = 3;
  ScrollController scrollController = ScrollController();

  int length = 5;
  double innerSpacingDivider = 10;
  double radiusOfItemDivider = 6;
  double centerWidgetRadiusDivider = 3;

  double startAngleDeg = -90;
  double totalArchDeg = 360;
  bool isClockwise = true;
  Completer<GoogleMapController> gMapController = Completer();

  Placemark placeMark = Placemark();

  Placemark get pickPlaceMark => placeMark;
  List<Prediction> _predictionList = [];
  List advanceSearch = [
    "Surrogate Mom",
    "Sperm Donor",
    "Egg Donor",
    "Intended Parents",
    "Retired Surrogate"
  ];

  Marker markersMap() {
    /*   markers.add(
        const Marker(
            markerId: MarkerId('SomeId'),
            position: LatLng(38.123,35.123),
            infoWindow: InfoWindow(
                title: 'The title of the marker'
            )
        )
    );*/
    update(["googleMap"]);
    return const Marker(
        markerId: MarkerId('SomeId'),
        position: LatLng(38.123, 35.123),
        infoWindow: InfoWindow(title: 'The title of the marker'));
  }

  String keyword = '';

  void onScreenTap() {
    advance = false;
    /* listConnectBlock = List.filled(listUserData.length, false);*/
    update(["Search"]);
  }

  Future<List<Prediction>> searchLocation(
      BuildContext context, String text) async {
    if (text != null && text.isNotEmpty) {
      http.Response response = await getLocationData(text);
      var data = jsonDecode(response.body.toString());
      print("my status is " + data["status"]);
      if (data['status'] == 'OK') {
        _predictionList = [];
        data['predictions'].forEach((prediction) =>
            _predictionList.add(Prediction.fromJson(prediction)));
      } else {
        // ApiChecker.checkApi(response);
      }
    }
    return _predictionList;
  }

  Future<http.Response> getLocationData(String text) async {
    http.Response response;

    response = await http.get(
      Uri.parse(
          "http://mvs.bslmeiyu.com/api/v1/config/place-api-autocomplete?search_text=$text"),
      headers: {"Content-Type": "application/json"},
    );

    print(jsonDecode(response.body));
    return response;
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

  double? latitude;
  double? longitude;
  Position? position;

  List<bool> listConnectBlock = [];
  List<ListUserData> listUserData = [];

  void onMoreButtonTap(int index) {
    if (listConnectBlock[index] == false) {
      listConnectBlock[index] = true;
    } else {
      listConnectBlock[index] = false;
    }
    update(["Search"]);
  }

  Future<Position> getCurrentPosition() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
    }
    var _currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    return _currentPosition;
  }

  void advanceSearchOnTap() {
    if (advance == false) {
      advance = true;
    } else {
      advance = false;
    }
    update(["Search"]);
  }

  Future<void> onTapAdvanceSearchMenu(int index) async {
    advance = false;
    await listUserProfileAdvanceSearch(advanceSearch[index]);

    Get.to(AdvanceSearchScreen(
      title: advanceSearch[index],
    ))!
        .then((value) async {
      await listUserProfile();
    });
/*    await loadData();*/
    findUserDistance(index: index);
  }

  Future<void> listUserProfileAdvanceSearch(String keyWords) async {
    try {
      latitude = position!.latitude;
      longitude = position!.longitude;
      print(latitude);
      print(latitude);
      loader.value = true;
      listUseProfileModel =
          await ListUserProfileApi.listUserProfileAdvanceSearchApi(
              keyWords: keyWords,
              latitude: latitude,
              longitude: longitude,
              fullName: "");

      print("pagggggggggggggggggggggggg===${page}");
      update(['Search']);
      loader.value = false;
    } catch (e) {
      debugPrint(e.toString());
      loader.value = false;
    }
  }

  List imageList = [
    AssetRes.i1,
    AssetRes.i2,
    AssetRes.i3,
  ];

  void init() async {
    position = await getCurrentPosition();
    await listUserProfile();
    searchBar.clear();
  }

  Uint8List? customMarker;

  @override
  void onInit() async {
    init();
    /*runFilter('');*/
    scrollController.addListener(pagination);
/*    await findUserDistance();*/

    update(['Search']);
    super.onInit();
  }

  void onSearch(String text) {
    keyword = text;
    update(["Search"]);
  }

  getBytesFromAsset({String? path, int? width}) async {
    ByteData data = await rootBundle.load(path!);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  void pagination() async {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      await listUserProfile();
    }
    update(['Search']);
  }

  Future<void> listUserProfile() async {
    try {
      latitude = position!.latitude;
      longitude = position!.longitude;
      print(latitude);
      print(latitude);
      loader.value = true;
      listUseProfileModel = await ListUserProfileApi.listUserProfileApi(
          page: page,
          limit: limit,
          keyWords: "",
          latitude: latitude,
          longitude: longitude,
          fullName: "");
      page++;
      listUserData.addAll(listUseProfileModel.data!);
      listConnectBlock = List.filled(listUserData.length, false);

      print("pagggggggggggggggggggggggg===${page}");
      update(['Search']);
      loader.value = false;
    } catch (e) {
      debugPrint(e.toString());
      loader.value = false;
    }
  }

  List<ListUserData> listLatLongData = [];
  double? newLat;
  double? newLong;

  findUserDistance({index}) async {
    await listUserProfileAdvanceSearch(advanceSearch[index]);
    position = await getCurrentPosition();
    newLat = position!.latitude;
    newLong = position!.longitude;
    print(newLat);
    print(newLong);

    for (var e in listUseProfileModel.data!) {
      final double distance = Geolocator.distanceBetween(
          e.latitude!, e.longitude!, newLat!, newLong!);
      print(distance);
      if (distance <= 100) {
        listLatLongData.add(e);
      }
    }
    print(listLatLongData);
    update(['Search']);
  }

  double calculateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  Future<void> listUserProfileWithOutPagination() async {
    try {
      latitude = position!.latitude;
      longitude = position!.longitude;
      loader.value = true;
      listUseProfileModel = await ListUserProfileApi.listUserProfileApi(
          page: 1,
          limit: listUserData.length,
          keyWords: "",
          latitude: latitude,
          longitude: longitude,
          fullName: "");
      listUserData = listUseProfileModel.data!;
      update(['Search']);
      loader.value = false;
    } catch (e) {
      debugPrint(e.toString());
      loader.value = false;
    }
  }

  Future<void> runFilter(String enteredKeyword) async {
    List<ListUserData> dataStore = [];
    loader.value = true;
    page = 1;
    listUseProfileModel = await ListUserProfileApi.listUserProfileApi(
        page: page,
        limit: limit,
        keyWords: "",
        longitude: longitude,
        latitude: latitude,
        fullName: enteredKeyword);
    loader.value = false;
    dataStore = listUseProfileModel.data ?? [];
    listUserData = dataStore;
    update(['Search']);
  }

  ConnectionsProfileController connectionsProfileController =
      Get.put(ConnectionsProfileController());

  onTapViewProfile(String userId) async {
    connectionsProfileController.callApi(userId);
    loader.value = true;

    connectionsProfileController.profileModel =
        (await OtherProfileApi.getOtherUerData(userId.toString()))!;
    loader.value = false;
    Get.to(() => ConnectionsProfileScreen());
  }

  void sendFriendRequest(String id) async {
    loader.value = true;
    await SendFriendRequestApi.postRegister(id);
    await listUserProfileWithOutPagination();
    /*   connectionsProfileController.sendFriendRequestDetails(id);*/
    loader.value = false;

    update(['Search']);
  }

  void sendFriendRequestAdvance(String id) async {
    loader.value = true;
    await SendFriendRequestApi.postRegister(id);
    /*   connectionsProfileController.sendFriendRequestDetails(id);*/
    loader.value = false;

    update(['Search']);
  }

  void acceptFriendRequest(String id) async {
    loader.value = true;
    await AcceptFriendRequestApi.postRegister(id);
    await listUserProfileWithOutPagination();
/*    connectionsProfileController.acceptFriendRequestDetails(id);*/
    loader.value = false;

    update(['Search']);
  }

  void cancelFriendRequest(String id) async {
    loader.value = true;
    await OtherProfileApi.cancelRequest(id);
    await listUserProfileWithOutPagination();
/*    connectionsProfileController.cancelFriendRequestDetails(id);*/
    loader.value = false;

    update(['Search']);
  }

  void unFriendRequest(String id) async {
    loader.value = true;
    await UnFriendRequestApi.postRegister(id);
/*    connectionsProfileController.unFriendRequestDetails(id);*/
    await listUserProfileWithOutPagination();
    loader.value = false;

    update(['Search']);
  }

  void blockOnTap(String id) async {
    loader.value = true;
    await BlockApi.postRegister(id.toString());
    /*   connectionsProfileController.blockUserDetails(id);*/
    await listUserProfileWithOutPagination();

    loader.value = false;

    update(['Search']);
  }

  void unblockOnTap(String id) async {
    loader.value = true;
    await UnBlockApi.postRegister(id);
    /*   connectionsProfileController.unBlockUserDetails(id);*/
    await listUserProfileWithOutPagination();
    loader.value = false;

    update(['Search']);
  }
}
