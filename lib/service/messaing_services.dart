import 'package:firebase_messaging/firebase_messaging.dart';




class MessagingService {
  FirebaseMessaging message = FirebaseMessaging.instance;


///android
  static const String serverToken =
      'AAAAO8fJfiE:APA91bHCn_2_9WnpIiocxMcUKdJgGv9PIpnBGyf15-qS7C5tYxJa8Yvpp8mxGUqzzCw36RoqMP_QzimqRYWrK81Cpn30r2RQhOK441vuj6teLwGB1U9KoroLj0YYnBRi7Kymgy54T2vr';




  /*static  String serverToken = Platform.isIOS?
      'AAAAc6lnkNg:APA91bGJCZtvmiP1htYJQZmZ4ucRub545c2kY33HeCoRhIgOP8rsrQkPYvvsIVoMXtZMGjxN7yE9T-fce50PySVxdaGViQsieTkn662Po4ZUl5TNWlNX491wJJ3bM_OPqxI6ViWcXR1S'
      : Platform.isAndroid?'AAAAO8fJfiE:APA91bHCn_2_9WnpIiocxMcUKdJgGv9PIpnBGyf15-qS7C5tYxJa8Yvpp8mxGUqzzCw36RoqMP_QzimqRYWrK81Cpn30r2RQhOK441vuj6teLwGB1U9KoroLj0YYnBRi7Kymgy54T2vr':"";*/




  Future<String?> getFcmToken() async {
    return await message.getToken();

  }

//
// void sendNotification(SendNotificationModel notification) async {
//   print("token = ${notification.fcmTokens}");
//   Response response = await http.post(
//     Uri.parse('https://fcm.googleapis.com/fcm/send'),
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//       'Authorization': 'key=$serverToken',
//     },
//     body: jsonEncode(notification.toMap()),
//   );
//
//   print(response.statusCode);
//   print(response.body);
// }
}
