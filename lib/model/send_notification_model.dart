class SendNotificationModel {
  String? id;
  String? chatId;
  String? title;
  String? body;
  List<String>? fcmTokens;

  SendNotificationModel({
    this.chatId,
    this.title,
    this.body,
    this.id,
    this.fcmTokens,
  });

  Map<String, dynamic> toMap() => {
        "registration_ids": fcmTokens,
        "data": {
          "id": id,
          "chatId": chatId,
          "click_action": "FLUTTER_NOTIFICATION_CLICK",
          "sound": "default",
        },
        "priority": "high",
        "notification": {
          "title": title,
          "body": body,
        }
      };
}
