import 'package:get/get.dart';
import 'package:rainbow/screens/Home/addStroy/addStory_screen.dart';

class HomeController extends GetxController
{

  RxBool loader = false.obs;

  @override
  void onInit()
  {
    init();
    super.onInit();
  }
  Future<void> init() async {
    loader.value = true;

  }
  void myStoryOnTap()
  {
    Get.to(()=> AddStoryScreen());
  }
}