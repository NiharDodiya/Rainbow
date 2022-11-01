// To parse this JSON data, do
//
//     final storyViewModel = storyViewModelFromJson(jsonString);

import 'dart:convert';

StoryViewModel storyViewModelFromJson(String str) =>
    StoryViewModel.fromJson(json.decode(str));

String storyViewModelToJson(StoryViewModel data) => json.encode(data.toJson());

class StoryViewModel {
  StoryViewModel({
    this.status,
    this.message,
  });

  bool? status;
  String? message;

  factory StoryViewModel.fromJson(Map<String, dynamic> json) => StoryViewModel(
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}
