import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rainbow/common/popup.dart';
import 'package:rainbow/common/uploadimage_api/uploadimage_api.dart';
import 'package:rainbow/common/uploadimage_api/uploadimage_model.dart';
import 'package:rainbow/model/ListSupportTicketModel.dart';
import 'package:rainbow/model/ViewSupportTicketModel.dart';
import 'package:rainbow/model/sendSupportModel.dart';
import 'package:rainbow/screens/Home/settings/support/endUserSupprotCreateScreen.dart';
import 'package:rainbow/screens/Home/settings/support/support_api/support_api.dart';
import 'package:http/http.dart' as http;

import '../../../../utils/strings.dart';

class SupportController extends GetxController {
  List supportList = ["Pending", "Complete", "Complete", "Complete"];
  TextEditingController yourMsgController = TextEditingController();
  TextEditingController yourMsgSendController = TextEditingController();
  File? imagePath;
  RxBool loader =false.obs;
  List<int> imgIdList = [];
  List<File> image = [];
  UploadImage uploadImage =   UploadImage();
  @override
  Future<void> onInit() async {

    super.onInit();
  }
  //call Camera
  /* navigateToCamera() async {
    String? path = await cameraPickImage();

    if (path != null) {
      imagePath = File(path);
    }
    update(["Getpic"]);
  }

  //Open Camera
  Future<String?> cameraPickImage() async {
    XFile? pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      return pickedFile.path;
    }
    update(["Getpic"]);

    return null;
  }*/
// camaera to pick image
  Future<String?> cameraImage() async {
    XFile? pickedFile =
    await ImagePicker().pickImage(source: ImageSource.camera,imageQuality: 100);
    if (pickedFile != null) {
      image.add(File(pickedFile.path));
    }
    update(["createStory"]);
    return null;
  }

  onTap({String? status, String? id,String? code}) async {
    await viewSupportTicketData(id.toString());
    Get.to(()=> SupportCreateEndUserScreen(com: status,code: code,));
    update(["Support"]);
  }

  valid() {
    if (yourMsgController.text.isEmpty) {
      errorToast(Strings.supporterror01);
    }
  }

  ListSupportTicketModel listSupportTicketModel = ListSupportTicketModel();
  Future<void> getListOfUserTicket() async {
    try {
      loader.value = true;
      listSupportTicketModel=await  SupportApi.supportListApi();
      print(listSupportTicketModel);
      update(["Support"]);
      loader.value = false;

    } catch (e) {
      loader.value = false;
      debugPrint(e.toString());
    }
  }
  ViewSupportTicketModel viewSupportTicketModel = ViewSupportTicketModel();


  Future<void> viewSupportTicketData(String id) async {
    try {
      loader.value = true;
      viewSupportTicketModel=await  SupportApi.viewSupportTicket(id:id);
      print(viewSupportTicketModel);
      update(["Support"]);
      loader.value = false;

    } catch (e) {
      loader.value = false;
      debugPrint(e.toString());
    }
  }
  SendSupportModel sendSupportModel =SendSupportModel();
  Future<void> sendSupportApiData(String id) async {
    try {
      loader.value = true;
      sendSupportModel=await  SupportApi.sendSupportApi(id:id ,description:yourMsgSendController.text);
      print(sendSupportModel);
      update(["Support"]);
      loader.value = false;
      yourMsgSendController.clear();

    } catch (e) {
      loader.value = false;
      debugPrint(e.toString());
    }
  }
  save(String url) async {
    loader.value=true;
    var response = await Dio().get(
        url,
        options: Options(responseType: ResponseType.bytes));
    final result = await ImageGallerySaver.saveImage(
        Uint8List.fromList(response.data),
        quality: 60,
        name: "rainBow");
    print(result);
    loader.value=false;
    flutterToast("Image Save successFull");
  }


  Future<void> uploadImageData() async {
    // loader.value = true;
    try {
      imgIdList = [];
      for (var e in image) {
        uploadImage = await UploadImageApi.postRegister(e.path);
        imgIdList.add(uploadImage.data!.id!);
      }

      // loader.value = false;
    } catch (e) {
      // loader.value = false;
      debugPrint(e.toString());
    }
  }
}
