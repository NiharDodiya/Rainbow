import 'package:get/get.dart';
import 'package:rainbow/model/edit_advertise_model.dart';
import 'package:rainbow/screens/advertisement/ad_home/myAdvertiser_api/myAdvertiser_api.dart';
import 'package:rainbow/service/pref_services.dart';
import 'package:rainbow/utils/pref_keys.dart';

import '../create_advertisement/create_advertisement_controller.dart';

class EditAdvertiesementController extends GetxController {
  // CreateAdvertisementController createAdvertisementController =
  //     Get.find<CreateAdvertisementController>();
  // List imageList = [];
  // String imageName = '';
  //
  // getImagePath() {
  //   imageName = createAdvertisementController.imagePath.first.path;
  //   imageList = imageName.split("/");
  //   imageName = imageList.last;
  //   update(['edit']);
  // }
  RxBool loader = false.obs;
  EditAdvertisementModel editAdvertisementModel = EditAdvertisementModel();

  Future<void> myEditAdvertiserListData({required int id}) async {
    try{
      loader.value = true;
      editAdvertisementModel = await MyAdvertiserApi.editAdvertiserList(
          data: {
            "id_advertisement": id
          }
      );
      update(['more']);
      loader.value =false;

    }catch(e){

      loader.value =false;

      print(e.toString());
    }
  }
}
