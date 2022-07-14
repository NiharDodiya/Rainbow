import 'package:get/get.dart';
import 'package:rainbow/model/request_user_model.dart';
import 'package:rainbow/model/suggestion_model.dart';
import 'package:rainbow/screens/Home/settings/connections/api/connections_api.dart';
import 'package:rainbow/screens/Home/settings/connections/connections_profile/connections_profile_controller.dart';
import 'package:rainbow/screens/Home/settings/connections/connections_profile/connections_profile_screen.dart';
import 'package:rainbow/screens/Profile/profile_controller.dart';

class ConnectionsController extends GetxController {
  List<SuggestionUser> suggestionConnection = [];
  List<RequestUser> requestUsers = [];
  RxBool loader = false.obs;

  Future<void> init() async {
    await callSuggestionApi();
    await callRequestApi();
  }

  void onTapViewProfile(int index) {
    ProfileController profileController = Get.put(ProfileController());
    ConnectionsProfileController controller =
        Get.put(ConnectionsProfileController());
    controller.callApi(
        profileController.viewProfile.data!.userView![index].id.toString());

    // controller.init();
    Get.to(() => ConnectionsProfileScreen());
  }

  void onDeleteBtnTap(int index){

  }

  Future<void> callSuggestionApi() async {
    loader.value = true;
    SuggestionModel? model = await ConnectionApi.getSuggestionList();
    if (model != null) {
      suggestionConnection = model.data ?? [];
      update(['connection']);
    }
    loader.value = false;
  }

  Future<void> callRequestApi() async {
    loader.value = true;
    RequestUserModel? model = await ConnectionApi.getRequestList();
    if (model != null) {
      requestUsers = model.data ?? [];
      update(['connection']);
    }
    loader.value = false;
  }
}
