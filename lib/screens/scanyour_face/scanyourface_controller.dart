import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rainbow/common/popup.dart';
import 'package:rainbow/common/uploadimage_api/uploadimage_api.dart';
import 'package:rainbow/common/uploadimage_api/uploadimage_model.dart';
import 'package:rainbow/screens/auth/verify_phone/verifyphone_screen.dart';
import 'package:rainbow/screens/scanyour_face/scanyourface_api/scanyourface_api.dart';
import 'package:rainbow/screens/scanyour_face/scanyourface_api/scanyourface_json.dart';
import 'package:rainbow/utils/strings.dart';

class ScanYourFaceController extends GetxController {
  File? image1;

  RxBool loader = false.obs;

  @override
  void onInit() async {
    await getCamera();
    controller = CameraController(
      camera,
      ResolutionPreset.medium,
    );
    initializeControllerFuture = controller.initialize();
    update();
    update(["imagePicker"]);
    super.onInit();
  }

  Future getImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) return;
    final imageTemp = File(image.path);
    image1 = imageTemp;
    update(["imagePicker"]);
  }

  void onRegisterTap() {
    if (validation()) {
      Get.to(() => const VerifyPhoneScreen());
    }
  }

  bool validation() {
    if (imageFront == null) {
      errorToast(Strings.selfieError);
      return false;
    }
    return true;
  }

  late CameraDescription camera;
  late CameraController controller;

  Future<void>? initializeControllerFuture;

  String? imageFront;

  bool isComplete = false;
  bool galleryImage = false;

  GlobalKey widgetKey = GlobalKey();

  final String _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  final Random _rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  Future getCamera() async {
    var cameras = await availableCameras();
    camera = cameras[1];
    update(["imagePicker"]);
  }

  void takePicForFront() async {
    uploadImageApi();
    /*if (imageFront != null) {
      return;
    }
    await initializeControllerFuture;

    final pic = await controller.takePicture();
    imageFront = pic.path;

    galleryImage = false;
    isComplete = true;
    update(["imagePicker"]);
    if (validation() && imageFront != null) {
      uploadImageApi();
      await PrefService.setValue(PrefKeys.register, true);


    }*/
  }

  Future<File> getCropImage() async {
    RenderRepaintBoundary boundary =
        widgetKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage();
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes = byteData!.buffer.asUint8List();

    final tempDir = await getTemporaryDirectory();
    File file =
        await File('${tempDir.path}/${getRandomString(10)}.png').create();
    file.writeAsBytesSync(pngBytes);

    return file;
  }

  UploadImage uploadImage = UploadImage();

  Future<void> uploadImageApi() async {
    loader.value = true;
    try {
      await UploadImageApi.postRegister(imageFront.toString()).then(
        (value) => uploadImage = value!,
      );
      loader.value = false;
      selfieVerification();
    } catch (e) {
      errorToast(e.toString());
      loader.value = false;
      debugPrint(e.toString());
    }
  }

  SelfiVerification selfiVerification = Get.put(SelfiVerification());

  Future<void> selfieVerification() async {
    loader.value = true;
    try {
      await ScanYourFaceApi.postRegister(uploadImage.data!.id.toString())
          .then((value) => selfiVerification = value);
      loader.value = false;
    } catch (e) {
      errorToast(e.toString());
      loader.value = false;
      debugPrint(e.toString());
    }
  }
}
