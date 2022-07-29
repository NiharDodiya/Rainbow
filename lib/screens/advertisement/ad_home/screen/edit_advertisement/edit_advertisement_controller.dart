import 'package:get/get.dart';

import '../create_advertisement/create_advertisement_controller.dart';

class EditAdvertiesementController extends GetxController {
  CreateAdvertisementController createAdvertisementController =
      Get.find<CreateAdvertisementController>();
  List imageList = [];
  String imageName = '';

  getImagePath() {
    imageName = createAdvertisementController.imagePath!.path;
    imageList = imageName.split("/");
    imageName = imageList.last;
  }
}
