import 'package:get/get.dart';
import 'package:rainbow/screens/Home/home_controller.dart';
import 'package:rainbow/screens/Message/message_controller.dart';
import 'package:rainbow/screens/Profile/profile_controller.dart';
import 'package:rainbow/screens/Search/search_controller.dart';

class DashboardController extends GetxController {
  int currentTab = 0;
  final HomeController homeController = Get.put(HomeController());
  final SearchController searchController = Get.put(SearchController());
  final MessageContorller messageController = Get.put(MessageContorller());
  final ProfileController profileController = Get.put(ProfileController());

  @override
  void onInit() {
    super.onInit();
  }

  void onBottomBarChange(int index) {
    currentTab = index;
    if (index == 0) {
      homeController.init();
    } else if (index == 1) {
      searchController.init();
    } else if (index == 2) {
      messageController.init();
    } else {
      profileController.init();
    }
    update(['bottom_bar']);
  }
}
