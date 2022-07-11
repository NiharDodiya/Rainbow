import 'package:get/get.dart';
import 'package:rainbow/screens/Home/settings/connections/connections_profile/connections_profile_controller.dart';
import 'package:rainbow/screens/Home/settings/connections/connections_profile/connections_profile_screen.dart';

class ConnectionsController extends GetxController {
  List connectionsRequest = ["1", "2", "3"];
  List suggestionConnection = ["1", "2", "3", "4", "5"];

  onTapViewProfile(int index) {
    ConnectionsProfileController controller =
        Get.put(ConnectionsProfileController());

    controller.init();
    Get.to(() => ConnectionsProfileScreen());
  }
}
