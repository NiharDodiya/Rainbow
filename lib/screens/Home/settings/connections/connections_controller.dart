import 'package:get/get.dart';
import 'package:rainbow/screens/Home/settings/connections/connections_profile/connections_profile_controller.dart';
import 'package:rainbow/screens/Home/settings/connections/connections_profile/connections_profile_screen.dart';
import 'package:rainbow/screens/Profile/profile_controller.dart';
import 'package:rainbow/screens/Profile/widget/edit_profile/editProfile_contoller.dart';

class ConnectionsController extends GetxController {
  List connectionsRequest = ["1", "2", "3"];
  List suggestionConnection = ["1", "2", "3", "4", "5"];

  onTapViewProfile(int index) {
    ProfileController profileController =Get.put(ProfileController());
    ConnectionsProfileController controller =
        Get.put(ConnectionsProfileController());
    controller.callApi(profileController.viewProfile.data!.userView![index].id
        .toString());

    // controller.init();
    Get.to(() => ConnectionsProfileScreen());
  }
}
