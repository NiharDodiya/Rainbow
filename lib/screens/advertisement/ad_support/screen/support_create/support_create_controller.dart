import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rainbow/common/uploadimage_api/uploadimage_api.dart';
import 'package:rainbow/common/uploadimage_api/uploadimage_model.dart';
import 'package:rainbow/screens/Home/settings/support/api/creat_support_api.dart';
import 'package:rainbow/utils/strings.dart';
import '../../../../../common/popup.dart';

class SupportCreateController extends GetxController {
  File? imagePath;
  TextEditingController yourMsgController = TextEditingController();
  TextEditingController subjectController = TextEditingController();

  RxBool loader = false.obs;

  List<File> image = [];

  Future<String?> navigateToCamera() async {
    XFile? pickedFile = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 100);
    if (pickedFile != null) {
      image.add(File(pickedFile.path));
    }
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

  Future<void> supportApi() async {

    loader.value = true;
    await uploadImageData();


    int res = await SupportAPI.supportAPI.postSupportAPI(data: {
      'title': subjectController.text,
      'description': yourMsgController.text,
      'id_item': imgIdList,
    });

    loader.value = false;
  }

  valid() {
    if (subjectController.text.isEmpty) {
      errorToast(Strings.supportError02);
    } else if (subjectController.text.isEmpty) {
      errorToast(Strings.supporterror01);
    }
  }

void onSendMsgTap()async{
  valid();
  await supportApi();
}
}
