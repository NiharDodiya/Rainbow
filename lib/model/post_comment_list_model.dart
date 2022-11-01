// To parse this JSON data, do
//
//     final postCommentListModel = postCommentListModelFromJson(jsonString);

/*
import 'dart:convert';

PostCommentListModel postCommentListModelFromJson(String? str) =>
    PostCommentListModel.fromJson(json.decode(str!));

String? postCommentListModelToJson(PostCommentListModel data) =>
    json.encode(data.toJson());

class PostCommentListModel {
  PostCommentListModel({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  List<PostCommentReply>? data;

  factory PostCommentListModel.fromJson(Map<String, dynamic> json) =>
      PostCommentListModel(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null
            ? null
            : List<PostCommentReply>.from(
                json["data"].map((x) => PostCommentReply.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "message": message == null ? null : message,
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class PostCommentReply {
  PostCommentReply({
    this.id,
    this.description,
    this.postCommentUser,
    this.postCommentItem,
    this.postCommentReply,
    this.postCommentTag,
  });

  int? id;
  String? description;
  PostCommentUser? postCommentUser;
  String? postCommentItem;
  List<PostCommentReply>? postCommentReply;
  List<dynamic>? postCommentTag;

  factory PostCommentReply.fromJson(Map<String, dynamic> json) =>
      PostCommentReply(
        id: json["id"] == null ? null : json["id"],
        description: json["description"] == null ? null : json["description"],
        postCommentUser: json["postCommentUser"] == null
            ? null
            : PostCommentUser.fromJson(json["postCommentUser"]),
        postCommentItem:
            json["postCommentItem"] == null ? null : json["postCommentItem"],
        postCommentReply: json["postCommentReply"] == null
            ? null
            : List<PostCommentReply>.from(json["postCommentReply"]
                .map((x) => PostCommentReply.fromJson(x))),
        postCommentTag: json["postCommentTag"] == null
            ? null
            : List<dynamic>.from(json["postCommentTag"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "description": description == null ? null : description,
        "postCommentUser":
            postCommentUser == null ? null : postCommentUser!.toJson(),
        "postCommentItem": postCommentItem == null ? null : postCommentItem,
        "postCommentReply": postCommentReply == null
            ? null
            : List<dynamic>.from(postCommentReply!.map((x) => x.toJson())),
        "postCommentTag": postCommentTag == null
            ? null
            : List<dynamic>.from(postCommentTag!.map((x) => x)),
      };
}

class PostCommentUser {
  PostCommentUser({
    this.id,
    this.idSocial,
    this.fullName,
    this.email,
    this.address1,
    this.address2,
    this.phoneNumber,
    this.maritalStatus,
    this.idEthnicity,
    this.birthDate,
    this.noKids,
    this.mobileStatus,
    this.role,
    this.idStatus,
    this.selfiStatus,
    this.userStatus,
    this.age,
    this.city,
    this.height,
    this.weight,
    this.instagram,
    this.youtube,
    this.facebook,
    this.twitter,
    this.about,
    this.hobbiesAndInterest,
    this.backgroundImage,
    this.profileImage,
    this.status,
  });

  int? id;
  String? idSocial;
  String? fullName;
  String? email;
  String? address1;
  String? address2;
  String? phoneNumber;
  String? maritalStatus;
  String? idEthnicity;
  DateTime? birthDate;
  int? noKids;
  String? mobileStatus;
  String? role;
  String? idStatus;
  String? selfiStatus;
  String? userStatus;
  int? age;
  String? city;
  String? height;
  String? weight;
  String? instagram;
  String? youtube;
  String? facebook;
  String? twitter;
  String? about;
  String? hobbiesAndInterest;
  String? backgroundImage;
  String? profileImage;
  String? status;

  factory PostCommentUser.fromJson(Map<String, dynamic> json) =>
      PostCommentUser(
        id: json["id"] == null ? null : json["id"],
        idSocial: json["id_social"] == null ? null : json["id_social"],
        fullName: json["full_name"] == null ? null : json["full_name"],
        email: json["email"] == null ? null : json["email"],
        address1: json["address1"] == null ? null : json["address1"],
        address2: json["address2"] == null ? null : json["address2"],
        phoneNumber: json["phone_number"] == null ? null : json["phone_number"],
        maritalStatus:
            json["marital_status"] == null ? null : json["marital_status"],
        idEthnicity: json["id_ethnicity"] == null ? null : json["id_ethnicity"],
        birthDate: json["birth_date"] == null
            ? null
            : DateTime.parse(json["birth_date"]),
        noKids: json["no_kids"] == null ? null : json["no_kids"],
        mobileStatus:
            json["mobile_status"] == null ? null : json["mobile_status"],
        role: json["role"] == null ? null : json["role"],
        idStatus: json["id_status"] == null ? null : json["id_status"],
        selfiStatus: json["selfi_status"] == null ? null : json["selfi_status"],
        userStatus: json["user_status"] == null ? null : json["user_status"],
        age: json["age"] == null ? null : json["age"],
        city: json["city"] == null ? null : json["city"],
        height: json["height"] == null ? null : json["height"],
        weight: json["weight"] == null ? null : json["weight"],
        instagram: json["instagram"] == null ? null : json["instagram"],
        youtube: json["youtube"] == null ? null : json["youtube"],
        facebook: json["facebook"] == null ? null : json["facebook"],
        twitter: json["twitter"] == null ? null : json["twitter"],
        about: json["about"] == null ? null : json["about"],
        hobbiesAndInterest: json["hobbies_and_Interest"] == null
            ? null
            : json["hobbies_and_Interest"],
        backgroundImage:
            json["background_image"] == null ? null : json["background_image"],
        profileImage:
            json["profile_image"] == null ? null : json["profile_image"],
        status: json["status"] == null ? null : json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "id_social": idSocial == null ? null : idSocial,
        "full_name": fullName == null ? null : fullName,
        "email": email == null ? null : email,
        "address1": address1 == null ? null : address1,
        "address2": address2 == null ? null : address2,
        "phone_number": phoneNumber == null ? null : phoneNumber,
        "marital_status": maritalStatus == null ? null : maritalStatus,
        "id_ethnicity": idEthnicity == null ? null : idEthnicity,
        "birth_date": birthDate == null
            ? null
            : "${birthDate!.year.toString().padLeft(4, '0')}-${birthDate!.month.toString().padLeft(2, '0')}-${birthDate!.day.toString().padLeft(2, '0')}",
        "no_kids": noKids == null ? null : noKids,
        "mobile_status": mobileStatus == null ? null : mobileStatus,
        "role": role == null ? null : role,
        "id_status": idStatus == null ? null : idStatus,
        "selfi_status": selfiStatus == null ? null : selfiStatus,
        "user_status": userStatus == null ? null : userStatus,
        "age": age == null ? null : age,
        "city": city == null ? null : city,
        "height": height == null ? null : height,
        "weight": weight == null ? null : weight,
        "instagram": instagram == null ? null : instagram,
        "youtube": youtube == null ? null : youtube,
        "facebook": facebook == null ? null : facebook,
        "twitter": twitter == null ? null : twitter,
        "about": about == null ? null : about,
        "hobbies_and_Interest":
            hobbiesAndInterest == null ? null : hobbiesAndInterest,
        "background_image": backgroundImage == null ? null : backgroundImage,
        "profile_image": profileImage == null ? null : profileImage,
        "status": status == null ? null : status,
      };
}

*/

import 'dart:convert';

PostCommentListModel postCommentListModelFromJson(String? str) =>
    PostCommentListModel.fromJson(json.decode(str!));

String? postCommentListModelToJson(PostCommentListModel data) =>
    json.encode(data.toJson());

class PostCommentListModel {
  PostCommentListModel({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  List<PostCommentReply>? data;

  factory PostCommentListModel.fromJson(Map<String, dynamic> json) =>
      PostCommentListModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? null
            : List<PostCommentReply>.from(
                json["data"].map((x) => PostCommentReply.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class PostCommentReply {
  PostCommentReply({
    this.id,
    this.description,
    this.createdAt,
    this.postCommentUser,
    this.postCommentItem,
    this.postCommentReply,
    this.postCommentTag,
  });

  int? id;
  String? description;
  DateTime? createdAt;
  PostCommentUser? postCommentUser;
  String? postCommentItem;
  List<PostCommentReply>? postCommentReply;
  List<dynamic>? postCommentTag;

  factory PostCommentReply.fromJson(Map<String, dynamic> json) =>
      PostCommentReply(
        id: json["id"],
        description: json["description"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        postCommentUser: json["postCommentUser"] == null
            ? null
            : PostCommentUser.fromJson(json["postCommentUser"]),
        postCommentItem: json["postCommentItem"],
        postCommentReply: json["postCommentReply"] == null
            ? null
            : List<PostCommentReply>.from(json["postCommentReply"]
                .map((x) => PostCommentReply.fromJson(x))),
        postCommentTag: json["postCommentTag"] == null
            ? null
            : List<dynamic>.from(json["postCommentTag"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "postCommentUser":
            postCommentUser == null ? null : postCommentUser!.toJson(),
        "postCommentItem": postCommentItem,
        "postCommentReply": postCommentReply == null
            ? null
            : List<dynamic>.from(postCommentReply!.map((x) => x.toJson())),
        "postCommentTag": postCommentTag == null
            ? null
            : List<dynamic>.from(postCommentTag!.map((x) => x)),
      };
}

class PostCommentUser {
  PostCommentUser({
    this.id,
    this.idSocial,
    this.fullName,
    this.email,
    this.address1,
    this.address2,
    this.phoneNumber,
    this.maritalStatus,
    this.onlineStatus,
    this.idEthnicity,
    this.birthDate,
    this.noKids,
    this.mobileStatus,
    this.role,
    this.referrallCode,
    this.idStatus,
    this.latitude,
    this.longitude,
    this.userType,
    this.selfiStatus,
    this.userStatus,
    this.age,
    this.city,
    this.height,
    this.weight,
    this.instagram,
    this.youtube,
    this.facebook,
    this.twitter,
    this.about,
    this.hobbiesAndInterest,
    this.backgroundImage,
    this.profileImage,
    this.status,
  });

  int? id;
  String? idSocial;
  String? fullName;
  String? email;
  String? address1;
  String? address2;
  String? phoneNumber;
  String? maritalStatus;
  String? onlineStatus;
  String? idEthnicity;
  DateTime? birthDate;
  int? noKids;
  String? mobileStatus;
  String? role;
  String? referrallCode;
  String? idStatus;
  double? latitude;
  double? longitude;
  String? userType;
  String? selfiStatus;
  String? userStatus;
  int? age;
  String? city;
  String? height;
  String? weight;
  String? instagram;
  String? youtube;
  String? facebook;
  String? twitter;
  String? about;
  String? hobbiesAndInterest;
  String? backgroundImage;
  String? profileImage;
  String? status;

  factory PostCommentUser.fromJson(Map<String, dynamic> json) =>
      PostCommentUser(
        id: json["id"],
        idSocial: json["id_social"],
        fullName: json["full_name"],
        email: json["email"],
        address1: json["address1"],
        address2: json["address2"],
        phoneNumber: json["phone_number"],
        maritalStatus: json["marital_status"],
        onlineStatus: json["online_status"],
        idEthnicity: json["id_ethnicity"],
        birthDate: json["birth_date"] == null
            ? null
            : DateTime.parse(json["birth_date"]),
        noKids: json["no_kids"],
        mobileStatus: json["mobile_status"],
        role: json["role"],
        referrallCode: json["referrall_code"],
        idStatus: json["id_status"],
        latitude: json["latitude"].toString().isEmpty
            ? null
            : json["latitude"] is String
                ? double.parse(json["latitude"])
                : json["latitude"],
        longitude: json["longitude"].toString().isEmpty
            ? null
            : json["longitude"] is String
                ? double.parse(json["longitude"])
                : json["longitude"],
        userType: json["user_type"],
        selfiStatus: json["selfi_status"],
        userStatus: json["user_status"],
        age: json["age"],
        city: json["city"],
        height: json["height"],
        weight: json["weight"],
        instagram: json["instagram"],
        youtube: json["youtube"],
        facebook: json["facebook"],
        twitter: json["twitter"],
        about: json["about"],
        hobbiesAndInterest: json["hobbies_and_Interest"],
        backgroundImage: json["background_image"],
        profileImage: json["profile_image"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_social": idSocial,
        "full_name": fullName,
        "email": email,
        "address1": address1,
        "address2": address2,
        "phone_number": phoneNumber,
        "marital_status": maritalStatus,
        "online_status": onlineStatus,
        "id_ethnicity": idEthnicity,
        "birth_date": birthDate == null
            ? null
            : "${birthDate!.year.toString().padLeft(4, '0')}-${birthDate!.month.toString().padLeft(2, '0')}-${birthDate!.day.toString().padLeft(2, '0')}",
        "no_kids": noKids,
        "mobile_status": mobileStatus,
        "role": role,
        "referrall_code": referrallCode,
        "id_status": idStatus,
        "latitude": latitude,
        "longitude": longitude,
        "user_type": userType,
        "selfi_status": selfiStatus,
        "user_status": userStatus,
        "age": age,
        "city": city,
        "height": height,
        "weight": weight,
        "instagram": instagram,
        "youtube": youtube,
        "facebook": facebook,
        "twitter": twitter,
        "about": about,
        "hobbies_and_Interest": hobbiesAndInterest,
        "background_image": backgroundImage,
        "profile_image": profileImage,
        "status": status,
      };
}
