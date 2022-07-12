import 'package:get/get.dart';
import 'package:rainbow/model/profile_model.dart';
import 'package:rainbow/screens/Home/settings/connections/connections_profile/api/OtherProfileApi.dart';

class ConnectionsProfileController extends GetxController {
  Future<void> init() async {
    await callApi();
  }

  ProfileModel profileModel = ProfileModel();
  RxBool loader = false.obs;

  Future<void> callApi() async {
    loader.value = true;
    profileModel =
        (await OtherProfileApi.getOtherUerData("123")) ?? ProfileModel();
    loader.value = true;
  }
}
