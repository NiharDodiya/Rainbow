import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:camera/camera.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rainbow/screens/idVerification/idverification_controller.dart';

class IdScannerController extends GetxController {
  late CameraDescription camera;
  late CameraController controller;

  Future<void>? initializeControllerFuture;

  String? imageFront;
  String? imageBack;
  bool isComplete = false;
  bool galleryImage = false;

  GlobalKey widgetKey = GlobalKey();

  @override
  void onInit() async {
    await getCamera();
    controller = CameraController(
      camera,
      ResolutionPreset.medium,
    );
    initializeControllerFuture = controller.initialize();
    update();
    super.onInit();
  }

  final String _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  final Random _rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  Future getCamera() async {
    var cameras = await availableCameras();
    camera = cameras.first;
    update();
  }

  void takePicForFront() async {
    if (imageFront != null) {
      return;
    }
    await initializeControllerFuture;

    final pic = await controller.takePicture();
    imageFront = pic.path;

    galleryImage = false;
    isComplete = true;
    update();
  }
  void takePicForBack() async {
    if (imageBack != null) {
      return;
    }
    await initializeControllerFuture;

    final pic = await controller.takePicture();
    imageBack = pic.path;
    galleryImage = false;
    isComplete = true;
    update();
  }

  void retakePic() {
    imageBack = null;
    imageFront = null;
    isComplete = false;
    update();
  }
  IdVerificationController idVerificationController = Get.put(IdVerificationController());
  Future<void> onImageSubmitFront() async {
    IdVerificationController idController = Get.find();
    File image2 = await getCropImage();
    idController.imageFront = image2.path;
    idController.update(['IdVerification_screen']);
    idVerificationController.uploadImageApi();
    Get.back();
  }
  Future<void> onImageSubmitBack() async {
    IdVerificationController idController = Get.find();
    File image2 = await getCropImage();
    idController.imageBack = image2.path;
    idController.update(['IdVerification_screen']);
    idVerificationController.uploadImageBackApi();
    Get.back();
  }

/*
  void upload() async {
    var pickedFile = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png', 'jpeg'],
    );

    if (pickedFile != null) {
      var file = pickedFile.files.first;
      imageBack = file.path!;
      galleryImage = true;
      isComplete = true;
      update();
    }
  }
*/

/*  Future<void> onFlashTap() async {
    if (controller.value.flashMode == FlashMode.off) {
      await controller.setFlashMode(FlashMode.always);
    } else {
      await controller.setFlashMode(FlashMode.off);
    }
    update(['flash']);
  }*/

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
}
