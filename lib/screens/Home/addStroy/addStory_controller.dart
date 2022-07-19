import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rainbow/screens/Home/addStroy/widgets/addStoryView.dart';
import 'package:rainbow/screens/dashboard/dashBoard.dart';
import 'package:rainbow/screens/dashboard/dashboard_controller.dart';

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
    Get.to(()=>AddStoryViewScreen());
  }

  void onImageTap(Future<File?> futureFile)async{
    image = await futureFile;
    update(["Edit_profile"]);
    Get.to(() => AddStoryViewScreen());
  }

  void onStoryPost(){
    DashboardController dashboardController = Get.find();
    dashboardController.onBottomBarChange(0);
    Get.offAll(() => const Dashboard());
  }
}