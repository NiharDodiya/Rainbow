import 'package:get/get.dart';
import 'package:rainbow/model/profile_model.dart';
import 'package:rainbow/screens/Home/settings/connections/connections_profile/api/OtherProfileApi.dart';
import 'package:rainbow/screens/Home/settings/connections/connections_profile/connections_profile_screen.dart';
import 'package:rainbow/service/pref_services.dart';
import 'package:rainbow/utils/pref_keys.dart';

class ConnectionsProfileController extends GetxController {
/*
  Future<void> init(userId) async {
    await callApi(userId);
  }
*/

  ProfileModel profileModel = ProfileModel();
  RxBool loader = false.obs;

  Future<void> callApi(String? userId) async {
    loader.value = true;
    // int userId= PrefService.getInt(PrefKeys.userId);
    profileModel =
        await OtherProfileApi.getOtherUerData(userId.toString()).then((value) => profileModel=value!);
    loader.value = false;
    Get.to(()=>ConnectionsProfileScreen());
  }
}
