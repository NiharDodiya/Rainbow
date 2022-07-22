import 'package:get/get.dart';
import 'package:rainbow/screens/notification/api/notification_api.dart';

import '../../model/notification_model.dart';

class NotificationsController extends GetxController {
  RxBool loader = false.obs;
  List<NotificationData> notificationList = [];

  @override
  void onInit() {
    init();
    super.onInit();
  }

  Future<void> init() async {
    loader.value = true;
  }


  Future<void> getNotifications() async {
    loader.value = true;
    NotificationModel? model = await NotificationApi.getNotificationList();
    if(model != null){
      notificationList = model.data ?? [];
    }
  }
}
