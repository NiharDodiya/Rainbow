import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rainbow/screens/scanyour_face/scanyourface_screen.dart';

class SelfieController extends GetxController {

  void onNextTap() {
    // ImagePicker().pickImage(
      // source: ImageSource.camera, preferredCameraDevice: CameraDevice.front,);
    Get.to(() =>  ScanYourFaceScreen());
  }
}