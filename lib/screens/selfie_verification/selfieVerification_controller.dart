import 'package:get/get.dart';
import 'package:rainbow/screens/scanyour_face/scanyourface_screen.dart';

class SelfieController extends  GetxController
{

  void onTap()
  {
    Get.to(() =>  ScanYourFaceScreen());
  }
}