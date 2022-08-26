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
        status: json["status"] == null ? null : json["status"],
        myStory: json["myStory"] == null
            ? null
            : List<MyStory>.from(
                json["myStory"].map((x) => MyStory.fromJson(x))),
        message: json["message"] == null ? null : json["message"],
        friendsStory: json["friendsStory"] == null
            ? null
            : List<FriendsStory>.from(
                json["friendsStory"].map((x) => FriendsStory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "myStory": myStory == null
            ? null
            : List<dynamic>.from(myStory!.map((x) => x.toJson())),
        "message": message == null ? null : message,
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
        id: json["id"] == null ? null : json["id"],
        storyItem: json["story_item"] == null ? null : json["story_item"],
        description: json["description"] == null ? null : json["description"],
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
        storyLikeCount:
            json["storyLikeCount"] == null ? null : json["storyLikeCount"],
        storyLikeList: json["storyLikeList"] == null
            ? null
            : List<UserDetail>.from(
                json["storyLikeList"].map((x) => UserDetail.fromJson(x))),
        isLike: json["isLike"] == null ? null : json["isLike"],
        storyCommentCount: json["storyCommentCount"] == null
            ? null
            : json["storyCommentCount"],
        storyCommentList: json["storyCommentList"] == null
            ? null
            : List<StoryCommentList>.from(json["storyCommentList"]
                .map((x) => StoryCommentList.fromJson(x))),
        storyViewCount:
            json["storyViewCount"] == null ? null : json["storyViewCount"],
        storyView: json["storyView"] == null
            ? null
            : List<StoryView>.from(
                json["storyView"].map((x) => StoryView.fromJson(x))),
        isView: json["isView"] == null ? null : json["isView"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "story_item": storyItem == null ? null : storyItem,
        "description": description == null ? null : description,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "storyTag": storyTag == null
            ? null
            : List<dynamic>.from(storyTag!.map((x) => x.toJson())),
        "storyLikeCount": storyLikeCount == null ? null : storyLikeCount,
        "storyLikeList": storyLikeList == null
            ? null
            : List<dynamic>.from(storyLikeList!.map((x) => x.toJson())),
        "isLike": isLike == null ? null : isLike,
        "storyCommentCount":
            storyCommentCount == null ? null : storyCommentCount,
        "storyCommentList": storyCommentList == null
            ? null
            : List<dynamic>.from(storyCommentList!.map((x) => x.toJson())),
        "storyViewCount": storyViewCount == null ? null : storyViewCount,
        "storyView": storyView == null
            ? null
            : List<dynamic>.from(storyView!.map((x) => x.toJson())),
        "isView": isView == null ? null : isView,
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
        id: json["id"] == null ? null : json["id"],
        description: json["description"] == null ? null : json["description"],
        storyUserComment: json["storyUserComment"] == null
            ? null
            : UserDetail.fromJson(json["storyUserComment"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "description": description == null ? null : description,
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
        id: json["id"] == null ? null : json["id"],
        idSocial: json["id_social"] == null ? null : json["id_social"],
        fullName: json["full_name"] == null ? null : json["full_name"],
        email: json["email"] == null ? null : json["email"],
        address1: json["address1"] == null ? null : json["address1"],
        address2: json["address2"] == null ? null : json["address2"],
        phoneNumber: json["phone_number"] == null ? null : json["phone_number"],
        maritalStatus:
            json["marital_status"] == null ? null : json["marital_status"],
        onlineStatus:
            json["online_status"] == null ? null : json["online_status"],
        idEthnicity: json["id_ethnicity"] == null ? null : json["id_ethnicity"],
        birthDate: json["birth_date"] == null
            ? null
            : DateTime.parse(json["birth_date"]),
        noKids: json["no_kids"] == null ? null : json["no_kids"],
        mobileStatus:
            json["mobile_status"] == null ? null : json["mobile_status"],
        role: json["role"] == null ? null : json["role"],
        referrallCode:
            json["referrall_code"] == null ? null : json["referrall_code"],
        idStatus: json["id_status"] == null ? null : json["id_status"],
        latitude: json["latitude"] == null ? null : json["latitude"].toDouble(),
        longitude:
            json["longitude"] == null ? null : json["longitude"].toDouble(),
        userType: json["user_type"] == null ? null : json["user_type"],
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
        "online_status": onlineStatus == null ? null : onlineStatus,
        "id_ethnicity": idEthnicity == null ? null : idEthnicity,
        "birth_date": birthDate == null
            ? null
            : "${birthDate!.year.toString().padLeft(4, '0')}-${birthDate!.month.toString().padLeft(2, '0')}-${birthDate!.day.toString().padLeft(2, '0')}",
        "no_kids": noKids == null ? null : noKids,
        "mobile_status": mobileStatus == null ? null : mobileStatus,
        "role": role == null ? null : role,
        "referrall_code": referrallCode == null ? null : referrallCode,
        "id_status": idStatus == null ? null : idStatus,
        "latitude": latitude == null ? null : latitude,
        "longitude": longitude == null ? null : longitude,
        "user_type": userType == null ? null : userType,
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
        id: json["id"] == null ? null : json["id"],
        idTag: json["id_tag"] == null ? null : json["id_tag"],
        name: json["name"] == null ? null : json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "id_tag": idTag == null ? null : idTag,
        "name": name == null ? null : name,
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
        id: json["id"] == null ? null : json["id"],
        idUser: json["id_user"] == null ? null : json["id_user"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "id_user": idUser == null ? null : idUser,
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
        id: json["id"] == null ? null : json["id"],
        idUser: json["id_user"] == null ? null : json["id_user"],
        storyItem: json["story_item"] == null ? null : json["story_item"],
        description: json["description"] == null ? null : json["description"],
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
        isLike: json["isLike"] == null ? null : json["isLike"],
        storyLikeCount:
            json["storyLikeCount"] == null ? null : json["storyLikeCount"],
        storyLikeList: json["storyLikeList"] == null
            ? null
            : List<Story>.from(
                json["storyLikeList"].map((x) => Story.fromJson(x))),
        storyCommentCount: json["storyCommentCount"] == null
            ? null
            : json["storyCommentCount"],
        storycommentList: json["storycommentList"] == null
            ? null
            : List<StorycommentList>.from(json["storycommentList"]
                .map((x) => StorycommentList.fromJson(x))),
        storyViewCount:
            json["storyViewCount"] == null ? null : json["storyViewCount"],
        storyView: json["storyView"] == null
            ? null
            : List<StoryView>.from(
                json["storyView"].map((x) => StoryView.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "id_user": idUser == null ? null : idUser,
        "story_item": storyItem == null ? null : storyItem,
        "description": description == null ? null : description,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "storyTag": storyTag == null
            ? null
            : List<dynamic>.from(storyTag!.map((x) => x.toJson())),
        "isLike": isLike == null ? null : isLike,
        "storyLikeCount": storyLikeCount == null ? null : storyLikeCount,
        "storyLikeList": storyLikeList == null
            ? null
            : List<dynamic>.from(storyLikeList!.map((x) => x.toJson())),
        "storyCommentCount":
            storyCommentCount == null ? null : storyCommentCount,
        "storycommentList": storycommentList == null
            ? null
            : List<dynamic>.from(storycommentList!.map((x) => x.toJson())),
        "storyViewCount": storyViewCount == null ? null : storyViewCount,
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
        id: json["id"] == null ? null : json["id"],
        idSocial: json["id_social"] == null ? null : json["id_social"],
        fullName: json["full_name"] == null ? null : json["full_name"],
        email: json["email"] == null ? null : json["email"],
        address1: json["address1"] == null ? null : json["address1"],
        address2: json["address2"] == null ? null : json["address2"],
        phoneNumber: json["phone_number"] == null ? null : json["phone_number"],
        maritalStatus:
            json["marital_status"] == null ? null : json["marital_status"],
        onlineStatus:
            json["online_status"] == null ? null : json["online_status"],
        idEthnicity: json["id_ethnicity"] == null ? null : json["id_ethnicity"],
        birthDate: json["birth_date"] == null
            ? null
            : DateTime.parse(json["birth_date"]),
        noKids: json["no_kids"] == null ? null : json["no_kids"],
        mobileStatus:
            json["mobile_status"] == null ? null : json["mobile_status"],
        role: json["role"] == null ? null : json["role"],
        referrallCode: json["referrall_code"],
        idStatus: json["id_status"] == null ? null : json["id_status"],
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
        "online_status": onlineStatus == null ? null : onlineStatus,
        "id_ethnicity": idEthnicity == null ? null : idEthnicity,
        "birth_date": birthDate == null
            ? null
            : "${birthDate!.year.toString().padLeft(4, '0')}-${birthDate!.month.toString().padLeft(2, '0')}-${birthDate!.day.toString().padLeft(2, '0')}",
        "no_kids": noKids == null ? null : noKids,
        "mobile_status": mobileStatus == null ? null : mobileStatus,
        "role": role == null ? null : role,
        "referrall_code": referrallCode,
        "id_status": idStatus == null ? null : idStatus,
        "latitude": latitude == null ? null : latitude,
        "longitude": longitude == null ? null : longitude,
        "user_type": userType,
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
        id: json["id"] == null ? null : json["id"],
        description: json["description"] == null ? null : json["description"],
        storyUserComment: json["storyUserComment"] == null
            ? null
            : Story.fromJson(json["storyUserComment"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "description": description == null ? null : description,
        "storyUserComment":
            storyUserComment == null ? null : storyUserComment!.toJson(),
      };
}
