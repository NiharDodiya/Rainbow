// To parse this JSON data, do
//
//     final postViewModel = postViewModelFromJson(jsonString);

import 'dart:convert';

PostViewModel postViewModelFromJson(String str) =>
    PostViewModel.fromJson(json.decode(str));

String postViewModelToJson(PostViewModel data) => json.encode(data.toJson());

class PostViewModel {
  PostViewModel({
    this.status,
    this.message,
  });

  bool? status;
  String? message;

  factory PostViewModel.fromJson(Map<String, dynamic> json) => PostViewModel(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "message": message == null ? null : message,
      };
}
