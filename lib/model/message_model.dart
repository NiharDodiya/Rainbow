// To parse this JSON data, do
//
//     final messageModel = messageModelFromJson(jsonString);

import 'dart:convert';

MessageModel messageModelFromJson(String str) => MessageModel.fromJson(json.decode(str));

String messageModelToJson(MessageModel data) => json.encode(data.toJson());

class MessageModel {
  MessageModel({
    this.agentId,
    this.content,
    this.id,
    this.images,
    this.propCity,
    this.propId,
    this.propSubCity,
    this.propTitle,
    this.timestamp,
    this.user,
    this.key,
  });

  String? agentId;
  String? content;
  String? id;
  List<Images>? images;
  String? propCity;
  String? propId;
  String? propSubCity;
  String? propTitle;
  String? timestamp;
  String? user;
  String? key;

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
    agentId: json["agentId"],
    content: json["content"],
    id: json["id"],
    images: json["images"] is List ? List<Images>.from(json["images"].map((x) => Images.fromJson(x))) : null,
    propCity: json["propCity"],
    propId: json["propId"],
    propSubCity: json["propSubCity"],
    propTitle: json["propTitle"],
    timestamp: json["timestamp"],
    user: json["user"],
    key: json["key"],
  );

  Map<String, dynamic> toJson() => {
  "agentId": agentId,
  "content": content,
  "id": id,
  "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x.toJson())),
  "propCity": propCity,
  "propId": propId,
  "propSubCity": propSubCity,
  "propTitle": propTitle,
  "timestamp": timestamp,
  "user": user,
  "key": key,
};

Map<String, dynamic> textJson() => {
  "content": content,
  "id": id,
  "timestamp": timestamp,
  "user": user,
};
}

class Images {
  Images({
    this.link,
    this.tag,
  });

  String? link;
  String? tag;

  factory Images.fromJson(Map<String, dynamic> json) => Images(
    link: json["link"],
    tag: json["tag"],
  );

  Map<String, dynamic> toJson() => {
    "link": link,
    "tag": tag,
  };
}
