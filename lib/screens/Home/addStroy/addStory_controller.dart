import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:rainbow/screens/Home/addStroy/widgets/addStoryView.dart';

class AddStoryController extends GetxController
{
  List<Widget> _mediaList = [];
  int currentPage = 0;
  int? lastPage;
  File? image;
  Future camera() async {
    final getImage = await ImagePicker().pickImage(source: ImageSource.camera);

    if (getImage == null) return;
    final imageTemp = File(getImage.path);
    image = imageTemp;
    update(["Edit_profile"]);
    Get.to((AddStoryViewScreen()));
  }

}