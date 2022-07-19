import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class AdSupportController extends GetxController {
  List supportList = ["Pending", "Complete", "Complete", "Complete"];
  RxBool loader = false.obs;

  @override
  void onInit() {
    init();
    super.onInit();
  }

  Future<void> init() async {
    loader.value = true;
  }
}
