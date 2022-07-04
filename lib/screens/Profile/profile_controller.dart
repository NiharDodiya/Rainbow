import 'package:get/get.dart';

class ProfileController extends GetxController
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
}