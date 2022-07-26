// import 'dart:convert';
//
// MyStoryModel myStoryModelFromJson(String? str) =>
//     MyStoryModel.fromJson(json.decode(str!));
//
// String? myStoryModelToJson(MyStoryModel data) => json.encode(data.toJson());
//
// class MyStoryModel {
//   MyStoryModel({
//     this.status,
//     this.message,
//     this.data,
//   });
//
//   bool? status;
//   String? message;
//   List<MyStory>? data;
//
//   factory MyStoryModel.fromJson(Map<String, dynamic> json) => MyStoryModel(
//         status: json["status"],
//         message: json["message"],
//         data: List<MyStory>.from(json["data"].map((x) => MyStory.fromJson(x))),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "status": status,
//         "message": message,
//         "data": List<dynamic>.from(data!.map((x) => x.toJson())),
//       };
// }
//
// class MyStory {
//   MyStory({
//     this.id,
//     this.idUser,
//     this.storyItem,
//     this.description,
//     this.createdAt,
//     this.updatedAt,
//     this.storyTag,
//     this.storyLikeCount,
//     this.storyLikeList,
//     this.storyCommentCount,
//     this.storycommentList,
//     this.storyViewCount,
//     this.storyView,
//   });
//
//   int? id;
//   int? idUser;
//   String? storyItem;
//   String? description;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   List<dynamic>? storyTag;
//   int? storyLikeCount;
//   List<Story>? storyLikeList;
//   int? storyCommentCount;
//   List<StorycommentList>? storycommentList;
//   int? storyViewCount;
//   List<dynamic>? storyView;
//
//   factory MyStory.fromJson(Map<String, dynamic> json) => MyStory(
//         id: json["id"],
//         idUser: json["id_user"],
//         storyItem: json["story_item"],
//         description: json["description"],
//         createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
//         updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
//         storyTag: json["storyTag"] == null ? null : List<dynamic>.from(json["storyTag"].map((x) => x)),
//         storyLikeCount: json["storyLikeCount"],
//         storyLikeList: json["storyLikeList"] == null ? null : List<Story>.from(
//             json["storyLikeList"].map((x) => Story.fromJson(x))),
//         storyCommentCount: json["storyCommentCount"],
//         storycommentList: json["storycommentList"] == null ? null : List<StorycommentList>.from(
//             json["storycommentList"].map((x) => StorycommentList.fromJson(x))),
//         storyViewCount: json["storyViewCount"],
//         storyView: json["storyView"] == null ? null : List<dynamic>.from(json["storyView"].map((x) => x)),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "id_user": idUser,
//         "story_item": storyItem,
//         "description": description,
//         "createdAt": createdAt!.toIso8601String(),
//         "updatedAt": updatedAt!.toIso8601String(),
//         "storyTag": List<dynamic>.from(storyTag!.map((x) => x)),
//         "storyLikeCount": storyLikeCount,
//         "storyLikeList":
//             List<dynamic>.from(storyLikeList!.map((x) => x.toJson())),
//         "storyCommentCount": storyCommentCount,
//         "storycommentList":
//             List<dynamic>.from(storycommentList!.map((x) => x.toJson())),
//         "storyViewCount": storyViewCount,
//         "storyView": List<dynamic>.from(storyView!.map((x) => x)),
//       };
// }
//
// class Story {
//   Story({
//     this.id,
//     this.idSocial,
//     this.fullName,
//     this.email,
//     this.address1,
//     this.address2,
//     this.phoneNumber,
//     this.maritalStatus,
//     this.idEthnicity,
//     this.birthDate,
//     this.noKids,
//     this.mobileStatus,
//     this.role,
//     this.idStatus,
//     this.selfiStatus,
//     this.userStatus,
//     this.age,
//     this.city,
//     this.height,
//     this.weight,
//     this.instagram,
//     this.youtube,
//     this.facebook,
//     this.twitter,
//     this.about,
//     this.hobbiesAndInterest,
//     this.backgroundImage,
//     this.profileImage,
//     this.status,
//   });
//
//   int? id;
//   String? idSocial;
//   String? fullName;
//   String? email;
//   String? address1;
//   String? address2;
//   String? phoneNumber;
//   String? maritalStatus;
//   String? idEthnicity;
//   DateTime? birthDate;
//   int? noKids;
//   String? mobileStatus;
//   String? role;
//   String? idStatus;
//   String? selfiStatus;
//   String? userStatus;
//   int? age;
//   String? city;
//   String? height;
//   String? weight;
//   String? instagram;
//   String? youtube;
//   String? facebook;
//   String? twitter;
//   String? about;
//   String? hobbiesAndInterest;
//   String? backgroundImage;
//   String? profileImage;
//   String? status;
//
//   factory Story.fromJson(Map<String, dynamic> json) => Story(
//         id: json["id"],
//         idSocial: json["id_social"],
//         fullName: json["full_name"],
//         email: json["email"],
//         address1: json["address1"],
//         address2: json["address2"],
//         phoneNumber: json["phone_number"],
//         maritalStatus: json["marital_status"],
//         idEthnicity: json["id_ethnicity"],
//         birthDate: json["birth_date"] == null ? null : DateTime.parse(json["birth_date"]),
//         noKids: json["no_kids"],
//         mobileStatus: json["mobile_status"],
//         role: json["role"],
//         idStatus: json["id_status"],
//         selfiStatus: json["selfi_status"],
//         userStatus: json["user_status"],
//         age: json["age"],
//         city: json["city"],
//         height: json["height"],
//         weight: json["weight"],
//         instagram: json["instagram"],
//         youtube: json["youtube"],
//         facebook: json["facebook"],
//         twitter: json["twitter"],
//         about: json["about"],
//         hobbiesAndInterest: json["hobbies_and_Interest"],
//         backgroundImage: json["background_image"],
//         profileImage: json["profile_image"],
//         status: json["status"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "id_social": idSocial,
//         "full_name": fullName,
//         "email": email,
//         "address1": address1,
//         "address2": address2,
//         "phone_number": phoneNumber,
//         "marital_status": maritalStatus,
//         "id_ethnicity": idEthnicity,
//         "birth_date":
//             "${birthDate!.year.toString().padLeft(4, '0')}-${birthDate!.month.toString().padLeft(2, '0')}-${birthDate!.day.toString().padLeft(2, '0')}",
//         "no_kids": noKids,
//         "mobile_status": mobileStatus,
//         "role": role,
//         "id_status": idStatus,
//         "selfi_status": selfiStatus,
//         "user_status": userStatus,
//         "age": age,
//         "city": city,
//         "height": height,
//         "weight": weight,
//         "instagram": instagram,
//         "youtube": youtube,
//         "facebook": facebook,
//         "twitter": twitter,
//         "about": about,
//         "hobbies_and_Interest": hobbiesAndInterest,
//         "background_image": backgroundImage,
//         "profile_image": profileImage,
//         "status": status,
//       };
// }
//
// class StorycommentList {
//   StorycommentList({
//     this.id,
//     this.description,
//     this.storyUserComment,
//   });
//
//   int? id;
//   String? description;
//   Story? storyUserComment;
//
//   factory StorycommentList.fromJson(Map<String, dynamic> json) =>
//       StorycommentList(
//         id: json["id"],
//         description: json["description"],
//         storyUserComment: Story.fromJson(json["storyUserComment"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "description": description,
//         "storyUserComment": storyUserComment!.toJson(),
//       };
// }
