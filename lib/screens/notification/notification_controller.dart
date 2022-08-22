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
    getNotifications();
  }
  NotificationModel?  notificationModel = NotificationModel();
  Future<void> getNotifications() async {
    loader.value = true;
    notificationModel = await NotificationApi.getNotificationList();
    if (notificationModel!.data != null) {
      notificationList = notificationModel!.data ?? [];
    }
    update(['notification_badge']);
    loader.value = false;
  }


  Future<void> notificationReadApi() async {
    try{
       await NotificationApi.notificationRead();
       await getNotifications();
    }catch(e){
      print(e.toString());
    }
  }

}
