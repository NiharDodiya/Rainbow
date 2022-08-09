import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/model/ListUserProfileModel.dart';
import 'package:rainbow/screens/Search/ListUserProfile_api/listUserProfile_api.dart';
import 'package:rainbow/screens/Search/advance_search/advance_search_screen.dart';

class SearchController extends GetxController {
  RxBool loader = false.obs;
  bool advance = false;
  ListUseProfileModel listUseProfileModel=ListUseProfileModel();


  // RxBool connect = false.obs;
  TextEditingController searchBar = TextEditingController();
  List<int> search = [0, 1, 2, 3, 4];
  List<ListUserData> data = [];

  ScrollController scrollController = ScrollController();
  List advanceSearch = [
    "Surrogate Mom  ",
    "Sperm Donor",
    "Egg Donor",
    "Intended Parents",
    "Retired Surrogate"
  ];

  List<bool> connect = [];
  String keyword = '';

  void onScreenTap() {
    advance = false;
    connect = List.filled(search.length, false);
    update(["Search"]);
  }

  void onMoreButtonTap(int index) {
    connect[index] = true;
    update(["Search"]);
  }

  void advanceSearchOnTap() {
    if (advance == false) {
      advance = true;
    } else {
      advance = false;
    }
    update(["Search"]);
  }

  void onTapAdvanceSearchMenu(int index) {
    Get.to(
      AdvanceSearchScreen(
        title: advanceSearch[index],
      ),
    );
  }

  @override
  Future<void> onInit() async {
    init();
    runFilter('');

    scrollController.addListener(pagination);

    super.onInit();
  }

  void onSearch(String text) {
    keyword = text;
    update(["Search"]);
  }
  void pagination() async {
    print("Hello");
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      await listUserProfile();
    }
    update(['Search']);
  }

  Future<void> init() async {
    connect = List.filled(search.length, false);
    await listUserProfile();
/*    loader.value = true;*/
  }
  List<ListUserData> listUserData = [];
  int page = 1;
  int limit = 5;
  Future<void> listUserProfile() async {
    try {
      loader.value = true;
      listUseProfileModel = await ListUserProfileApi.listUserProfileApi(page,limit,"");
      listUserData.addAll(listUseProfileModel.data!);
      page++;
      update(['Search']);
      loader.value = false;
    } catch (e) {
      debugPrint(e.toString());
      loader.value = false;
    }
  }


  Future<void> runFilter(String enteredKeyword) async {
    List<ListUserData> dataStore = [];
    loader.value=true;
    page=0;
    listUseProfileModel = await ListUserProfileApi.listUserProfileApi(page,limit,enteredKeyword);
    data.addAll(listUseProfileModel.data!);
    loader.value=false;

    if (enteredKeyword.isEmpty) {
      dataStore = listUseProfileModel.data!;
    } else {
       dataStore = listUseProfileModel.data!
          .where((user) =>
          user.userStatus!.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    } // Refresh the UI
    data.addAll(dataStore);
    update(['Search']);
  }
}
