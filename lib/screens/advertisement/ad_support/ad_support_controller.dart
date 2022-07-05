import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class AdSupportController extends GetxController
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