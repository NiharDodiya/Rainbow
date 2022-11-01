import 'dart:convert';

StoryModel storyModelFromJson(String? str) =>
    StoryModel.fromJson(json.decode(str!));

String? storyModelToJson(StoryModel data) => json.encode(data.toJson());

class StoryModel {
  StoryModel({
    this.status,
    this.myStory,
    this.message,
    this.friendsStory,
  });

  bool? status;
  List<MyStory>? myStory;
  String? message;
  List<FriendsStory>? friendsStory;

  factory StoryModel.fromJson(Map<String, dynamic> json) => StoryModel(
        status: json["status"],
        myStory: json["myStory"] == null
            ? null
            : List<MyStory>.from(
                json["myStory"].map((x) => MyStory.fromJson(x))),
        message: json["message"],
        friendsStory: json["friendsStory"] == null
            ? null
            : List<FriendsStory>.from(
                json["friendsStory"].map((x) => FriendsStory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "myStory": myStory == null
            ? null
            : List<dynamic>.from(myStory!.map((x) => x.toJson())),
        "message": message,
        "friendsStory": friendsStory == null
            ? null
            : List<dynamic>.from(friendsStory!.map((x) => x.toJson())),
      };
}

class FriendsStory {
  FriendsStory({
    this.userDetail,
    this.storyList,
  });

  UserDetail? userDetail;
  List<StoryList>? storyList;

  factory FriendsStory.fromJson(Map<String, dynamic> json) => FriendsStory(
        userDetail: json["userDetail"] == null
            ? null
            : UserDetail.fromJson(json["userDetail"]),
        storyList: json["storyList"] == null
            ? null
            : List<StoryList>.from(
                json["storyList"].map((x) => StoryList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "userDetail": userDetail == null ? null : userDetail!.toJson(),
        "storyList": storyList == null
            ? null
            : List<dynamic>.from(storyList!.map((x) => x.toJson())),
      };
}

class StoryList {
  StoryList({
    this.id,
    this.storyItem,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.storyTag,
    this.storyLikeCount,
    this.storyLikeList,
    this.isLike,
    this.storyCommentCount,
    this.storyCommentList,
    this.storyViewCount,
    this.storyView,
    this.isView,
  });

  int? id;
  String? storyItem;
  String? description;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<StoryTag>? storyTag;
  int? storyLikeCount;
  List<UserDetail>? storyLikeList;
  String? isLike;
  int? storyCommentCount;
  List<StoryCommentList>? storyCommentList;
  int? storyViewCount;
  List<StoryView>? storyView;
  String? isView;

  factory StoryList.fromJson(Map<String, dynamic> json) => StoryList(
        id: json["id"],
        storyItem: json["story_item"],
        description: json["description"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        storyTag: json["storyTag"] == null
            ? null
            : List<StoryTag>.from(
                json["storyTag"].map((x) => StoryTag.fromJson(x))),
        storyLikeCount: json["storyLikeCount"],
        storyLikeList: json["storyLikeList"] == null
            ? null
            : List<UserDetail>.from(
                json["storyLikeList"].map((x) => UserDetail.fromJson(x))),
        isLike: json["isLike"],
        storyCommentCount: json["storyCommentCount"],
        storyCommentList: json["storyCommentList"] == null
            ? null
            : List<StoryCommentList>.from(json["storyCommentList"]
                .map((x) => StoryCommentList.fromJson(x))),
        storyViewCount: json["storyViewCount"],
        storyView: json["storyView"] == null
            ? null
            : List<StoryView>.from(
                json["storyView"].map((x) => StoryView.fromJson(x))),
        isView: json["isView"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "story_item": storyItem,
        "description": description,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "storyTag": storyTag == null
            ? null
            : List<dynamic>.from(storyTag!.map((x) => x.toJson())),
        "storyLikeCount": storyLikeCount,
        "storyLikeList": storyLikeList == null
            ? null
            : List<dynamic>.from(storyLikeList!.map((x) => x.toJson())),
        "isLike": isLike,
        "storyCommentCount": storyCommentCount,
        "storyCommentList": storyCommentList == null
            ? null
            : List<dynamic>.from(storyCommentList!.map((x) => x.toJson())),
        "storyViewCount": storyViewCount,
        "storyView": storyView == null
            ? null
            : List<dynamic>.from(storyView!.map((x) => x.toJson())),
        "isView": isView,
      };
}

class StoryCommentList {
  StoryCommentList({
    this.id,
    this.description,
    this.storyUserComment,
  });

  int? id;
  String? description;
  UserDetail? storyUserComment;

  factory StoryCommentList.fromJson(Map<String, dynamic> json) =>
      StoryCommentList(
        id: json["id"],
        description: json["description"],
        storyUserComment: json["storyUserComment"] == null
            ? null
            : UserDetail.fromJson(json["storyUserComment"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
        "storyUserComment":
            storyUserComment == null ? null : storyUserComment!.toJson(),
      };
}

class UserDetail {
  UserDetail({
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

  factory UserDetail.fromJson(Map<String, dynamic> json) => UserDetail(
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
        // ignore: prefer_null_aware_operators
        latitude: json["latitude"] == null ? null : json["latitude"].toDouble(),
        longitude:
            // ignore: prefer_null_aware_operators
            json["longitude"] == null ? null : json["longitude"].toDouble(),
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

class StoryView {
  StoryView({
    this.id,
    this.idUser,
  });

  int? id;
  int? idUser;

  factory StoryView.fromJson(Map<String, dynamic> json) => StoryView(
        id: json["id"],
        idUser: json["id_user"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_user": idUser,
      };
}

class MyStory {
  MyStory({
    this.id,
    this.idUser,
    this.storyItem,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.storyTag,
    this.isLike,
    this.storyLikeCount,
    this.storyLikeList,
    this.storyCommentCount,
    this.storycommentList,
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
  String? isLike;
  int? storyLikeCount;
  List<Story>? storyLikeList;
  int? storyCommentCount;
  List<StorycommentList>? storycommentList;
  int? storyViewCount;
  List<StoryView>? storyView;

  factory MyStory.fromJson(Map<String, dynamic> json) => MyStory(
        id: json["id"],
        idUser: json["id_user"],
        storyItem: json["story_item"],
        description: json["description"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        storyTag: json["storyTag"] == null
            ? null
            : List<StoryTag>.from(
                json["storyTag"].map((x) => StoryTag.fromJson(x))),
        isLike: json["isLike"],
        storyLikeCount: json["storyLikeCount"],
        storyLikeList: json["storyLikeList"] == null
            ? null
            : List<Story>.from(
                json["storyLikeList"].map((x) => Story.fromJson(x))),
        storyCommentCount: json["storyCommentCount"],
        storycommentList: json["storycommentList"] == null
            ? null
            : List<StorycommentList>.from(json["storycommentList"]
                .map((x) => StorycommentList.fromJson(x))),
        storyViewCount: json["storyViewCount"],
        storyView: json["storyView"] == null
            ? null
            : List<StoryView>.from(
                json["storyView"].map((x) => StoryView.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_user": idUser,
        "story_item": storyItem,
        "description": description,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "storyTag": storyTag == null
            ? null
            : List<dynamic>.from(storyTag!.map((x) => x.toJson())),
        "isLike": isLike,
        "storyLikeCount": storyLikeCount,
        "storyLikeList": storyLikeList == null
            ? null
            : List<dynamic>.from(storyLikeList!.map((x) => x.toJson())),
        "storyCommentCount": storyCommentCount,
        "storycommentList": storycommentList == null
            ? null
            : List<dynamic>.from(storycommentList!.map((x) => x.toJson())),
        "storyViewCount": storyViewCount,
        "storyView": storyView == null
            ? null
            : List<dynamic>.from(storyView!.map((x) => x.toJson())),
      };
}

class Story {
  Story({
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

  factory Story.fromJson(Map<String, dynamic> json) => Story(
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
                : json["latitude"],
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

class StorycommentList {
  StorycommentList({
    this.id,
    this.description,
    this.storyUserComment,
  });

  int? id;
  String? description;
  Story? storyUserComment;

  factory StorycommentList.fromJson(Map<String, dynamic> json) =>
      StorycommentList(
        id: json["id"],
        description: json["description"],
        storyUserComment: json["storyUserComment"] == null
            ? null
            : Story.fromJson(json["storyUserComment"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
        "storyUserComment":
            storyUserComment == null ? null : storyUserComment!.toJson(),
      };
}
