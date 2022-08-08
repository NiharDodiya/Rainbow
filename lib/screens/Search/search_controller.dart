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
  List<ListUserData>? data ;
  List advanceSearch = [
    "Surrogate Mom  ",
    "Sperm Donor",
    "Egg Donor",
    "Intended Parents",
    "Retired Surrogate"
  ];

  List<bool> connect = [];

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
  void onInit() {
    init();
    listUserProfile();
/*    serchList();*/
    super.onInit();
  }
  String keyword = '';
  void onSearch(String text) {
    keyword = text;
    update(["Search"]);

  }

  Future<void> init() async {
    connect = List.filled(search.length, false);
    loader.value = true;
  }

  Future<void> listUserProfile() async {
    try {
      loader.value = true;
      listUseProfileModel = await ListUserProfileApi.listUserProfileApi();
      update(['Search']);
      loader.value = false;
    } catch (e) {
      debugPrint(e.toString());
      loader.value = false;
    }
  }
/*  void serchList()
  {
    data = listUseProfileModel.data!.where(((item) {
      if (keyword.isEmpty) {
        return true;
      }
      return item.fullName!.toUpperCase()
          .contains(keyword.toUpperCase());

    })).toList();
    update(['Search']);
  }*/
}
