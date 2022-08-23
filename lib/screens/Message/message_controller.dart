
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rainbow/common/helper.dart';
import 'package:rainbow/model/user_model.dart';
import 'package:rainbow/screens/Message/chat_screen.dart';
import 'package:rainbow/screens/Message/sendImage_screen.dart';
import 'package:rainbow/service/Users_services.dart';
import 'package:rainbow/service/chat_service.dart';
import 'package:rainbow/service/pref_services.dart';
import 'package:rainbow/utils/gloabal_data.dart';
import 'package:rainbow/utils/pref_keys.dart';

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

  var data;
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

  Future<void> init() async {
    loader.value = true;
    listScrollController.addListener(manageScrollDownBtn);
  }
  Future<void> getChatRoomId() async {
    loader.value = true;
    receiver = await ChatServices.getUserModel(receiverId) ?? UserModel();
    chatId = getChatId(receiver.uid!, GlobalData.user.uid!);
    GlobalData.chatId = chatId;
    chatRoomExist = await ChatServices.roomIsAvailable(chatId);
    if (chatRoomExist == false) {
      await ChatServices.setChatRoomValue(
          chatId, GlobalData.user.uid!, receiver.uid!);
    }
    loader.value = false;
  }

  getUid()
  async {
   userUid= PrefService.getString(PrefKeys.uid).toString();
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
  getRoomId(String otherUid) async {
    await FirebaseFirestore.instance
        .collection("chats")
        .doc("${userUid}_$otherUid")
        .collection("${userUid}_$otherUid")
        .get()
        .then((value) async {
      if (value.docs.isNotEmpty) {
        roomId = "${userUid}_$otherUid";
      } else {
        await FirebaseFirestore.instance
            .collection("chats")
            .doc("${userUid}_$otherUid")
            .collection("${userUid}_$otherUid")
            .get()
            .then((value) {
          if (value.docs.isNotEmpty) {
            roomId = "${userUid}_$otherUid";
          } else {
            roomId = "${userUid}_$otherUid";
          }
        });
      }
    });
  }

  gotoChatScreen(String otherUid, name,image) async {
    loader.value = true;
    await getRoomId(otherUid);
    loader.value = false;
    Get.to(() => ChatScreen(
      roomId: roomId,
      name: name,
      otherUserUid: otherUid,
      userUid: userUid,
      profileImage:image ,
    ));
  }
  sendMessage(String roomId, otherUid) async {
    String msg = msController.text;
    final userUid1 = userUid;

    await setMessage(roomId, msg, userUid);

    //setMsgCount(roomId, loginController.userUid, msg, userUid);
    update(['message']);
    update(['chats']);
  }

  setMessage(String roomId, msg, userUid) async {
    await FirebaseFirestore.instance
        .collection("chats")
        .doc(roomId)
        .collection(roomId)
        .doc()
        .set({"content": msg, "senderUid": userUid, "time": DateTime.now()});
    msController.clear();
    update(['message']);
    update(['chats']);
  }

  File? image;

  navigateToCamera() async {
    String? path = await cameraPickImage1();

    if (path != null) {
      image = File(path);
    }


update(['chats']);
  }

  navigateToGallery() async {
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
    update(['chats']);

    return null;
  }

  Future<String?> gallaryPickImage1() async {
    XFile? pickedFile =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      return pickedFile.path;
    }
    update(['chats']);
    return null;
  }

  back(){
    image=null;
    update(['chats']);
  }




}
