import 'dart:io';

import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rainbow/common/Widget/circle_image_cropper.dart';
import 'package:rainbow/screens/scanyour_face/scanyourface_controller.dart';
import 'package:rainbow/screens/scanyour_face/scanyourface_screen.dart';
import 'package:rainbow/screens/selfie_verification/widgets/selfie_picker.dart';

class SelfieController extends GetxController {
  // final File

  Future<void> onNextTap() async {
    File? tempFile;
    await Permission.camera.request();
    await Permission.storage.request();
    await Get.to(() => SelfiePicker(onCapture: (file) => tempFile = file));
    if (tempFile != null) {
      await Get.to(() => CircleImageCropper(
          image: tempFile!,
          onCropped: (File file) {
            ScanYourFaceController controller =
                Get.put(ScanYourFaceController());
            controller.imageFront = file.path;
            Get.off(() => ScanYourFaceScreen());
          }));
    }
    // Get.to(() =>  ScanYourFaceScreen());
  }
}
