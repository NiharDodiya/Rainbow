import 'package:get/get.dart';
import 'package:rainbow/common/helper.dart';

class CountryNameController extends GetxController{
  bool countryBox = false;



  dropDownBox(){
    if(countryBox == false){
      countryBox = true;
      update(["drop"]);
    }
    else{
      countryBox = false;
      update(["drop"]);
    }
    update();
  }

  List filterList = [];

  void serching(value) {
    filterList = (listNationalities.data?.where(
            (element) {
          return element.name.toString().toLowerCase().contains(value.toString().toLowerCase());
        })
        .toList()) ?? [];
    update(["drop"]);
  }
}