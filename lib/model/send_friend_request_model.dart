// To parse this JSON data, do
//
//     final sendFriendRequest = sendFriendRequestFromJson(jsonString);

import 'dart:convert';

SendFriendRequest sendFriendRequestFromJson(String str) =>
    SendFriendRequest.fromJson(json.decode(str));

String sendFriendRequestToJson(SendFriendRequest data) =>
    json.encode(data.toJson());

class SendFriendRequest {
  SendFriendRequest({
    this.idReceiver,
  });

  int? idReceiver;

  factory SendFriendRequest.fromJson(Map<String, dynamic> json) =>
      SendFriendRequest(
        idReceiver: json["id_receiver"],
      );

  Map<String, dynamic> toJson() => {
        "id_receiver": idReceiver,
      };
}
