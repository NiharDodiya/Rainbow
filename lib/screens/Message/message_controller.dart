import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/common/helper.dart';
import 'package:rainbow/common/popup.dart';
import 'package:rainbow/model/friend_model.dart';
import 'package:rainbow/model/send_notification_model.dart';
import 'package:rainbow/model/user_model.dart';
import 'package:rainbow/screens/Home/home_controller.dart';
import 'package:rainbow/screens/Message/api/message_api.dart';
import 'package:rainbow/screens/Message/chat_screen.dart';
import 'package:rainbow/service/Users_services.dart';
import 'package:rainbow/service/chat_service.dart';
import 'package:rainbow/service/notification_service.dart';
import 'package:rainbow/service/pref_services.dart';
import 'package:rainbow/utils/color_res.dart';
import 'package:rainbow/utils/gloabal_data.dart';
import 'package:rainbow/utils/pref_keys.dart';
import 'package:rainbow/utils/strings.dart';

class MessageController extends GetxController {
  TextEditingController msgController = TextEditingController();
  TextEditingController msController = TextEditingController();
  final ScrollController listScrollController = ScrollController();
  RxBool loader = false.obs;
  UserModel receiver = UserModel();
  String chatId = '';
  String receiverId = '';
  bool chatRoomExist = false;
  bool showScrollDownBtn = false;
  String? userUid;
  String? roomId;
  String? id;
  final _storage = FirebaseStorage.instance;
  DateTime lastMsg = DateTime.now();
  List<Friend> friendList = [];
  bool apiLoader = false;

  @override
  void onInit() {
    init();
    getUid();
    update(["message"]);
    super.onInit();
  }

  void manageScrollDownBtn() {
    if (listScrollController.position.pixels > 150) {
      if (!showScrollDownBtn) {
        showScrollDownBtn = true;
        update(["chats"]);
      }
    } else {
      if (showScrollDownBtn) {
        showScrollDownBtn = false;
        update(["chats"]);
      }
    }
  }

  void onScrollDownTap() {
    listScrollController.position.jumpTo(0);
  }

  doNothing(BuildContext context) {}
  String? token;
  Future<void> init() async {
  token = await NotificationService.getFcmToken();
    loader.value = true;
    getFriendListData();
    listScrollController.addListener(manageScrollDownBtn);
  }

  Future<void> getChatRoomId() async {
/*    loader.value = true;
    receiver = await ChatServices.getUserModel(receiverId) ?? UserModel();
    chatId = getChatId(receiver.uid!, GlobalData.user.uid!);
    GlobalData.chatId = chatId;
    chatRoomExist = await ChatServices.roomIsAvailable(chatId);
    if (chatRoomExist == false) {
      await ChatServices.setChatRoomValue(
          chatId, GlobalData.user.uid!, receiver.uid!);
    }
    loader.value = false*/;
  }

  getUid() async {
    userUid = PrefService.getString(PrefKeys.uid).toString();
    print(userUid);
    update(["message"]);
  }

  Future<void> getUserDetail() async {
    loader.value = true;
    UserModel? user =
        await UserService.getUserModel(PrefService.getString(PrefKeys.uid));

    if (user != null) {
      GlobalData.user = user;
    }
    GlobalData.user.isOnline = true;
    UserService.updateUserModel(GlobalData.user);
    loader.value = false;
  }

  bool validation() {
    if (msController.text.isEmpty) {
      errorToast("please enter message");
      return false;
    }
    return true;
  }

  getChatUserId() async {
    final snapShot2 =
        await FirebaseFirestore.instance.collection("users").doc(userUid).get();
    Map<String, dynamic> daysDocs = snapShot2.data() as Map<String, dynamic>;
    id = daysDocs["id"];
  }

  deleteUserChat() {
    FirebaseFirestore.instance
        .collection('chats')
        .doc(roomId)
        .collection(roomId.toString())
        .get()
        .then((value) {
      for (var element in value.docs) {
        /*element.reference.delete();*/
      }
    });
    Get.back();
    update(["message"]);
  }

  String getChatId(String uid1, String uid2) {
    if (uid1.hashCode > uid2.hashCode) {
      return uid1 + '_' + uid2;
    } else {
      return uid2 + '_' + uid1;
    }
  }

  getRoomId(String otherUid) async {
    DocumentReference doc = FirebaseFirestore.instance
        .collection("chats")
        .doc(getChatId(userUid.toString(), otherUid));

    await doc
        .collection(getChatId(userUid.toString(), otherUid))
        .get()
        .then((value) async {
      DocumentSnapshot<Object?> i = await doc.get();
      if (i.exists == false) {
        await doc.set({
          "uidList": [userUid, otherUid],
        });
      }
      if (value.docs.isNotEmpty) {
        roomId = getChatId(userUid.toString(), otherUid);
      } else {
        await FirebaseFirestore.instance
            .collection("chats")
            .doc(getChatId(userUid.toString(), otherUid))
            .collection(getChatId(userUid.toString(), otherUid))
            .get()
            .then((value) {
          if (value.docs.isNotEmpty) {
            roomId = getChatId(userUid.toString(), otherUid);
          } else {
            roomId = getChatId(userUid.toString(), otherUid);
          }
        });
      }
    });
  }

  File? image;
  String imageName = "";
  var dowanloadurl;
  Future<void> sendNotification({String? body, String? roomId, String? otherUid}) async {
    await NotificationService.sendNotification(SendNotificationModel(
      id: userUid,
      chatId: roomId,
      body: body,
      /*title: receiver.userName,*/
      fcmTokens: [token.toString()],
    ));
  }

  void gotoChatScreen(
      BuildContext context, String otherUid, name, image) async {
    loader.value = true;
    await getRoomId(otherUid);
    loader.value = false;
    // if user have not subcription show pop up
    subscribePopUp == true
        ? showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                backgroundColor: Colors.white,
                actions: <Widget>[
                  const SizedBox(
                    height: 34,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Center(
                        child: SizedBox(
                            height: 40,
                            width: 152,
                            child: Text(
                              Strings.subscriptionPremium,
                              style: gilroySemiBoldTextStyle(
                                  fontSize: 16, color: Colors.black),
                            ))),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Center(
                      child: Text(
                    "£9.99 / month",
                    style: gilroySemiBoldTextStyle(
                        fontSize: 26, color: Colors.black),
                  )),
                  const SizedBox(
                    height: 16,
                  ),
                  Center(
                    child: Container(
                      height: 30,
                      width: 101,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(46.2),
                        gradient: const LinearGradient(
                          colors: [
                            ColorRes.color_4F359B,
                            ColorRes.color_B279DB,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.topRight,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "Subscribe",
                          style: gilroyBoldTextStyle(fontSize: 9.6),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 21,
                  ),
                ],
              );
            })
        : Get.to(() => ChatScreen(
              roomId: roomId,
              name: name,
              otherUserUid: otherUid,
              userUid: userUid,
              profileImage: image,
            ));
  }

  void imageSend(String otherUid) async {
    loader.value = true;
    if (isToday(lastMsg) == false) {
      await sendAlertMsg();
    }
    if (image != null) {
      var snapshote = await _storage
          .ref()
          .child(userUid.toString())
          .child(DateTime.now().millisecondsSinceEpoch.toString())
          .putFile(image!);
      dowanloadurl = await snapshote.ref.getDownloadURL();
      print(dowanloadurl);
    } else {
      print("no path recievd");
    }

    await FirebaseFirestore.instance
        .collection("chats")
        .doc(roomId)
        .collection(roomId!)
        .doc()
        .set({
      "image": dowanloadurl,
      "senderUid": userUid,
      "type": "image",
      "time": DateTime.now(),
      "read": false,
    });
    setLastMsgInDoc("📷 Image");
    msController.clear();
    update(['message']);
    image = null;
    update(['chats']);
    sendNotification(body: "📷 Image",otherUid: otherUid,roomId: roomId);
    loader.value = false;
  }

  void sendMessage(String roomId, otherUid) async {
    String msg = msController.text;
    final userUid1 = userUid;

    if (isToday(lastMsg) == false) {
      await sendAlertMsg();
    }

    await setMessage(roomId, msg, userUid);
    setLastMsgInDoc(msg);

    //setMsgCount(roomId, loginController.userUid, msg, userUid);
    sendNotification(roomId: roomId,otherUid: otherUid,body: msg);
    update(['message']);
  }

  Future<void> setMessage(String roomId, msg, userUid) async {
    await FirebaseFirestore.instance
        .collection("chats")
        .doc(roomId)
        .collection(roomId)
        .doc()
        .set({
      "content": msg,
      "type": "text",
      "senderUid": userUid,
      "time": DateTime.now(),
      "read": false,
    });
    msController.clear();
    update(['message']);
  }

  void navigateToCamera() async {
    String? path = await cameraPickImage1();
    if (path != null) {
      image = File(path);
    }
    update(['chats']);
  }

  void navigateToGallery() async {
    String? path = await gallaryPickImage1();

    if (path != null) {
      image = File(path);
    }

    update(['chats']);
  }

  Future<String?> cameraPickImage1() async {
    XFile? pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      return pickedFile.path;
    }

    return null;
  }

  Future<String?> gallaryPickImage1() async {
    XFile? pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      return pickedFile.path;
    }
    return null;
  }

  void back() {
    image = null;
    update(['chats']);
  }

  Future<void> setLastMsgInDoc(String msg) async {
    await FirebaseFirestore.instance.collection("chats").doc(roomId).update({
      "lastMessage": msg,
      "lastMessageSender": userUid,
      "lastMessageTime": DateTime.now(),
      "lastMessageRead": false,
    });
  }

  Future<void> sendAlertMsg() async {
    await FirebaseFirestore.instance
        .collection("chats")
        .doc(roomId)
        .collection(roomId!)
        .doc()
        .set({
      "content": "new Day",
      "senderUid": userUid,
      "type": "alert",
      "time": DateTime.now()
    });
  }

  Future<void> getFriendListData() async {
    apiLoader = true;
    update(['message']);
    FriendModel? model = await MessageApi.friendApi();
    if (model?.data != null) {
      friendList = model!.data!;
    }
    apiLoader = false;
    update(['message']);
  }

  List<int> getFriendIdList() {
    return friendList.map<int>((e) => e.id ?? 0).toList();
  }

  Future<void> setReadTrue(String docId) async {
    await FirebaseFirestore.instance
        .collection("chats")
        .doc(roomId)
        .collection(roomId!)
        .doc(docId)
        .update({"read": true});
    await setReadInChatDoc(true);
  }

  Future<void> setReadInChatDoc(bool status) async {
    await FirebaseFirestore.instance
        .collection("chats")
        .doc(roomId)
        .update({"lastMessageRead": status});
  }
}
