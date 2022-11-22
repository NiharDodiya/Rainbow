// To parse this JSON data, do
//
//     final acceptFriendRequest = acceptFriendRequestFromJson(jsonString);

import 'dart:convert';

AcceptFriendRequest acceptFriendRequestFromJson(String str) =>
    AcceptFriendRequest.fromJson(json.decode(str));

String acceptFriendRequestToJson(AcceptFriendRequest data) =>
    json.encode(data.toJson());

class AcceptFriendRequest {
  AcceptFriendRequest({
    this.idSender,
  });

  int? idSender;

  factory AcceptFriendRequest.fromJson(Map<String, dynamic> json) =>
      AcceptFriendRequest(
        idSender: json["id_sender"],
      );

  Map<String, dynamic> toJson() => {
        "id_sender": idSender,
      };
}
