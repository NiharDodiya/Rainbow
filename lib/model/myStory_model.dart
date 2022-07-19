// To parse this JSON data, do
//
//     final myStoryModel = myStoryModelFromJson(jsonString);

import 'dart:convert';

MyStoryModel myStoryModelFromJson(String? str) =>
    MyStoryModel.fromJson(json.decode(str!));

String? myStoryModelToJson(MyStoryModel data) => json.encode(data.toJson());

class MyStoryModel {
  MyStoryModel({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  List<Datum>? data;

  factory MyStoryModel.fromJson(Map<String, dynamic> json) => MyStoryModel(
        status: json["status"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.idUser,
    this.storyItem,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.storyTag,
    this.storyLikeCount,
    this.storyCommentCount,
    this.storyComment,
    this.storyViewCount,
    this.storyView,
  });

  int? id;
  int? idUser;
  String? storyItem;
  String? description;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<StoryTag>? storyTag;
  int? storyLikeCount;
  int? storyCommentCount;
  List<dynamic>? storyComment;
  int? storyViewCount;
  List<dynamic>? storyView;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        idUser: json["id_user"],
        storyItem: json["story_item"],
        description: json["description"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        storyTag: List<StoryTag>.from(
            json["storyTag"].map((x) => StoryTag.fromJson(x))),
        storyLikeCount: json["storyLikeCount"],
        storyCommentCount: json["storyCommentCount"],
        storyComment: List<dynamic>.from(json["storyComment"].map((x) => x)),
        storyViewCount: json["storyViewCount"],
        storyView: List<dynamic>.from(json["storyView"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_user": idUser,
        "story_item": storyItem,
        "description": description,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "storyTag": List<dynamic>.from(storyTag!.map((x) => x.toJson())),
        "storyLikeCount": storyLikeCount,
        "storyCommentCount": storyCommentCount,
        "storyComment": List<dynamic>.from(storyComment!.map((x) => x)),
        "storyViewCount": storyViewCount,
        "storyView": List<dynamic>.from(storyView!.map((x) => x)),
      };
}

class StoryTag {
  StoryTag({
    this.id,
    this.idTag,
    this.name,
  });

  int? id;
  int? idTag;
  String? name;

  factory StoryTag.fromJson(Map<String, dynamic> json) => StoryTag(
        id: json["id"],
        idTag: json["id_tag"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_tag": idTag,
        "name": name,
      };
}
