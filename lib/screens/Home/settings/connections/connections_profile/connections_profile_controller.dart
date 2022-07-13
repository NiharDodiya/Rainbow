import 'package:get/get.dart';
import 'package:rainbow/model/block_model.dart';
import 'package:rainbow/model/profile_model.dart';
import 'package:rainbow/model/unblock_model.dart';
import 'package:rainbow/screens/Home/home_controller.dart';
import 'package:rainbow/screens/Home/settings/connections/connections_profile/api/OtherProfileApi.dart';
import 'package:rainbow/screens/Home/settings/connections/connections_profile/connections_profile_screen.dart';
import 'package:rainbow/screens/Profile/widget/block_unblock%20_Api/block_api.dart';
import 'package:rainbow/screens/Profile/widget/block_unblock%20_Api/unblock_api.dart';
import 'package:rainbow/service/pref_services.dart';
import 'package:rainbow/utils/pref_keys.dart';

class ConnectionsProfileController extends GetxController {
/*
  Future<void> init(userId) async {
    await callApi(userId);
  }
*/
  ProfileModel profileModel = ProfileModel();
HomeController homeController = Get.put(HomeController());
void checkStatusForBlockUser()
{
  for(int i=0; i<homeController.blockListModel.data!.length;i++)
    {
      homeController.blockListModel.data![i].id == profileModel.data!.id;

    }
}


  RxBool loader = false.obs;

  Future<void> callApi(String? userId) async {
    loader.value = true;
    // int userId= PrefService.getInt(PrefKeys.userId);
    profileModel =
        await OtherProfileApi.getOtherUerData(userId.toString()).then((value) => profileModel=value!);
    loader.value = false;
    Get.to(()=>ConnectionsProfileScreen());
  }


  BlockModel blockModel = BlockModel();

  Future<void> blockUserDetails(String? id) async {
    try {
      loader.value = true;
      await BlockApi.postRegister(id.toString()).then((value) => blockModel = value);
      loader.value = false;
    } catch (e) {
      loader.value = false;
    }
  }

  UnblockModel unblockModel = UnblockModel();
  Future<void> unBlockUserDetails(String id) async {
    try {
      loader.value = true;
      await UnBlockApi.postRegister(id).then((value) => unblockModel = value);
      loader.value = false;
    } catch (e) {
      loader.value = false;
    }
  }
}
