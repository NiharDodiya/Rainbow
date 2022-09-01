import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:rainbow/screens/Home/home_controller.dart';
import 'package:rainbow/screens/Message/message_controller.dart';
import 'package:rainbow/screens/Profile/profile_controller.dart';
import 'package:rainbow/screens/Search/search_controller.dart';
import 'package:rainbow/service/pref_services.dart';
import 'package:rainbow/utils/pref_keys.dart';

class DashboardController extends GetxController {
  int currentTab = 0;
  final HomeController homeController = Get.put(HomeController());
  final SearchController searchController = Get.put(SearchController());
  final MessageController messageController = Get.put(MessageController());
  final ProfileController profileController = Get.put(ProfileController());

  @override
  void onInit() async {
    homeController.getCurrentLocation();
    update(['bottom_bar']);
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
  Future<void> setUserOnlineStatus(bool status) async {
    if (PrefService.getString(PrefKeys.uid).isEmpty) {
      return;
    }
  try{
    await FirebaseFirestore.instance
        .collection("users")
        .doc(PrefService.getString(PrefKeys.uid))
        .update({"online": status});
  }catch(e){
      print(e.toString());
  }
  }
}
