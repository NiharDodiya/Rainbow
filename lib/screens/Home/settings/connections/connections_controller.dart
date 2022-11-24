import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:rainbow/model/request_user_model.dart';
import 'package:rainbow/model/suggestion_model.dart';
import 'package:rainbow/screens/Home/settings/connections/api/connections_api.dart';
import 'package:rainbow/screens/Home/settings/connections/connections_profile/connections_profile_controller.dart';
import 'package:rainbow/screens/Home/settings/connections/connections_profile/connections_profile_screen.dart';
import 'package:rainbow/screens/Profile/acceptFriendRequest_api/accaept_fried_request_api.dart';
import 'package:rainbow/screens/Profile/sendFriendRequest_api/send_friend_request_api.dart';

import '../../../Profile/cancleFriendRequest_api/cancel_friend_request_api.dart';

class ConnectionsController extends GetxController {
  List<SuggestionUser> suggestionConnection = [];
  List<RequestUser> requestUsers = [];
  RxBool loader = false.obs;

  // HomeController  homeController = Get.find();
  Future<void> init() async {
    await callRequestApi();
    await callSuggestionApi();
  }

  void onTapViewProfile(String userId) {
    ConnectionsProfileController controller =
        Get.put(ConnectionsProfileController());
    controller.callApi(userId);

    Get.to(() => ConnectionsProfileScreen(show: false,))?.then((value) {
      if (kDebugMode) {
        print("PROFILE SCREEN BACK 3");
      }
    });
  }

  Future<void> onAddBtnTap(String userId, bool suggestionUser) async {
    loader.value = true;
    await AcceptFriendRequestApi.postRegister(userId);
    if (suggestionUser) {
      await callSuggestionApi();
    } else {
      await callRequestApi();
    }
  }

  Future<void> onAddBtnTapConnection(String userId, bool suggestionUser) async {
    loader.value = true;
    await SendFriendRequestApi.postRegister(userId);
    if (suggestionUser) {
      await callSuggestionApi();
    } else {
      await callRequestApi();
    }
  }

  Future<void> onDeleteBtnTap(String userId, bool suggestionUser) async {
    loader.value = true;
    await CancelFriendRequestApi.postRegister(userId);
    if (suggestionUser) {
      await callSuggestionApi();
    } else {
      await callRequestApi();
    }
  }

  Future<void> callSuggestionApi() async {
    loader.value = true;
    SuggestionModel? model = await ConnectionApi.getSuggestionList();
    if (model != null) {
      suggestionConnection = model.data ?? [];
      update(['connection']);
      // homeController.update(["home"]);

    }
    loader.value = false;
  }

  Future<void> callRequestApi() async {
    loader.value = true;
    RequestUserModel? model = await ConnectionApi.getRequestList();
    if (model != null) {
      requestUsers = model.data ?? [];
      update(['connection']);
      // homeController.update(["home"]);
    }
    loader.value = false;
  }
}
