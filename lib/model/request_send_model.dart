// To parse this JSON data, do
//
//     final requestSend = requestSendFromJson(jsonString);

import 'dart:convert';

RequestSend requestSendFromJson(String str) =>
    RequestSend.fromJson(json.decode(str));

String requestSendToJson(RequestSend data) => json.encode(data.toJson());

class RequestSend {
  RequestSend({
    this.status,
    this.message,
  });

  bool? status;
  String? message;

  factory RequestSend.fromJson(Map<String, dynamic> json) => RequestSend(
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}
