import 'package:rainbow/model/user_model.dart';

class RoomModel {
  String? id;
  String? lastMessage;
  List<String>? membersId;
  DateTime? lastMessageTime;
  bool? isGroup;
  UserModel? userModel;

  RoomModel({
    this.id,
    this.lastMessage,
    this.lastMessageTime,
    this.isGroup,
    this.membersId,
  });

  factory RoomModel.fromMap(Map<String, dynamic> data) => RoomModel(
        id: data['id'],
        lastMessageTime: data['lastMessageTime'].toDate(),
        lastMessage: data['lastMessage'],
        isGroup: data['isGroup'],
        membersId: data['membersId'].cast<String>(),
      );
}
