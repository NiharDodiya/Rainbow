import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'dart:ui' as ui;

import 'package:path_provider/path_provider.dart';


class IdScannerController extends GetxController {
  late CameraDescription camera;
  late CameraController controller;
   Future<void>? initializeControllerFuture;
   String? image;
  bool isComplete = false;
  bool galleryImage = false;

  GlobalKey widgetKey = GlobalKey();

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

  String _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  Future getCamera() async {
    var cameras = await availableCameras();
    camera = cameras.first;
    update();
  }

  void takePic() async {
    if (image != null) {
      return;
    }
    await initializeControllerFuture;

    final pic = await controller.takePicture();
    image = pic.path;
    galleryImage = false;
    isComplete = true;
    update();
  }

  void retakePic() {
    image = null;
    isComplete = false;
    update();
  }

  void upload() async {
    var pickedFile = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png', 'jpeg'],
    );

    if (pickedFile != null) {
      var file = pickedFile.files.first;
      image = file.path!;
      galleryImage = true;
      isComplete = true;
      update();
    }
  }

  Future<void> onFlashTap() async {
    if (controller.value.flashMode == FlashMode.off) {
      await controller.setFlashMode(FlashMode.always);
    } else {
      await controller.setFlashMode(FlashMode.off);
    }
    update(['flash']);
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
}
