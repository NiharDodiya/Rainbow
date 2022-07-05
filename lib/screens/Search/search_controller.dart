import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  RxBool loader = false.obs;
  bool advance = false;

  // RxBool connect = false.obs;
  TextEditingController searchBar = TextEditingController();
  List<int> search = [0, 1, 2, 3, 4];
  List advanceSearch = ["Surrogate Mom  " , "Sperm Donor", "Egg Donor", "Intended Parents", "Retired Surrogate"];

  List<bool> connect = [];

  void onScreenTap() {

    connect = List.filled(search.length, false);
update(["Search"]);

  }
  void onMoreButtonTap(int index)
  {
    connect[index]=true;
    update(["Search"]);


  }
  void advanceSearchOnTap()
  {
    if(advance==false)
      {
        advance=true;
      }
    else
      {
        advance=false;
      }
    update(["Search"]);
  }

  @override
  void onInit() {
    init();

    super.onInit();
  }

  Future<void> init() async {
    connect = List.filled(search.length, false);
    loader.value = true;
  }


}
