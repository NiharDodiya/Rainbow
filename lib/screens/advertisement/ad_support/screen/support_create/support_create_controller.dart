import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rainbow/common/uploadimage_api/uploadimage_api.dart';
import 'package:rainbow/common/uploadimage_api/uploadimage_model.dart';
import 'package:rainbow/screens/Home/settings/support/api/creat_support_api.dart';
import 'package:rainbow/screens/Home/settings/support/support_controller.dart';
import 'package:rainbow/utils/strings.dart';

import '../../../../../common/popup.dart';

class SupportCreateController extends GetxController {
  File? imagePath;
  TextEditingController yourMsgController = TextEditingController();
  TextEditingController subjectController = TextEditingController();

  RxBool loader = false.obs;

  List<File> image = [];

  //FocusNode focusNode = FocusNode();

  Future<String?> navigateToCamera() async {
    XFile? pickedFile = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 100);
    if (pickedFile != null) {
      image.add(File(pickedFile.path));
    }
    Get.back();
    update(["img"]);
    update();
    return null;
  }

  Future<String?> navigateToGallery() async {
    XFile? pickedFile = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 100);
    if (pickedFile != null) {
      image.add(File(pickedFile.path));
    }
    Get.back();
    update(["img"]);
    update();
    return null;
  }

  UploadImage uploadImage = UploadImage();
  List<int> imgIdList = [];

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

  Future<void> supportApi(context) async {
    loader.value = true;
    await uploadImageData();
    await SupportAPI.supportAPI.postSupportAPI(data: {
      'title': subjectController.text,
      'description': yourMsgController.text,
      'id_item': imgIdList,
    },
      context: context,
    );

    loader.value = false;
  }

  bool valid() {
    if (subjectController.text.isEmpty) {
      errorToast(Strings.supportError02);
      return false;
    } else if (yourMsgController.text.isEmpty) {
      errorToast("please enter your message");
      return false;
    }
    return true;
  }

  SupportController supportController = Get.put(SupportController());

  void onSendMsgTap({context}) async {
    FocusScopeNode currentfocus = FocusScope.of(context);
    if (!currentfocus.hasPrimaryFocus) {
      currentfocus.unfocus();
    }
    if (valid()) {
      await supportApi(context);
      supportController.getListOfUserTicket();
      update(["Support"]);
    }
    update(["Support"]);
  }
}
