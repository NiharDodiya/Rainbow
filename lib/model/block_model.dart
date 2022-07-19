// To parse this JSON data, do
//
//     final blockModel = blockModelFromJson(jsonString);

import 'dart:convert';

BlockModel blockModelFromJson(String str) =>
    BlockModel.fromJson(json.decode(str));

String blockModelToJson(BlockModel data) => json.encode(data.toJson());

class BlockModel {
  BlockModel({
    this.status,
    this.message,
  });

  bool? status;
  String? message;

  factory BlockModel.fromJson(Map<String, dynamic> json) => BlockModel(
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}
