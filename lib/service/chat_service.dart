import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:rainbow/model/message_model.dart';
import 'package:rainbow/model/user_model.dart';
import 'package:rainbow/utils/app_state.dart';
import 'package:rainbow/utils/fireStore_collections.dart';
import 'package:rainbow/utils/firebaseKey.dart';
import 'package:rainbow/utils/gloabal_data.dart';

String userUid = "";

class ChatServices {
  CollectionReference users =
      FirebaseFirestore.instance.collection(FireStoreCollections.users);
  static FirebaseFirestore fireStore = FirebaseFirestore.instance;

  static FirebaseDatabase database = FirebaseDatabase.instance;
  static String? token;

  static getToken() async {
    await FirebaseAuth.instance.currentUser!.getIdToken();
  }

  static Future<void> getCurrentUserUid() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    if (auth.currentUser != null) {
      userUid = auth.currentUser!.uid;
    }
  }

  static Future<bool> roomIsAvailable(String chatId) async {
    DocumentSnapshot<Map<String, dynamic>> snap =
        await fireStore.collection(FirebaseKeys.chatRoom).doc(chatId).get();
    return snap.exists;
  }

  static Future<void> setChatRoomValue(
      String chatId, String uid1, String uid2) async {
    await fireStore.collection(FirebaseKeys.chatRoom).doc(chatId).set({
      uid1 + '_typing': false,
      uid2 + '_typing': false,
      uid1 + '_newMsg': 0,
      uid2 + '_newMsg': 0,
      'lastMessageTime': DateTime(2000, 1, 1),
      "uidList": [uid1, uid2],
      "lastMessage": '',
      "lastMessageSender": '',
      uid2 + '_readMsg': false,
      uid1 + '_readMsg': false,
    });
  }

  static Future<String?> getChatId(String uid) async {
    DatabaseReference ref1 = database.ref(uid + userUid);
    DatabaseReference ref2 = database.ref(userUid + uid);

    DatabaseEvent snap1 = await ref1.once();
    DatabaseEvent snap2 = await ref2.once();

    if (snap1.snapshot.exists) {
      return uid + userUid;
    } else if (snap2.snapshot.exists) {
      return userUid + uid;
    }
    return null;
  }

  Stream<DocumentSnapshot> getRoomUserStream(List<String> membersId) {
    try {
      String id = membersId
          .firstWhere((element) => element != appState.currentUser!.uid);
      return users.doc(id).snapshots();
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> getChatUserListStream(
      String uid) {
    return fireStore
        .collection(FirebaseKeys.chatRoom)
        .where('uidList', arrayContains: uid)
        .orderBy('lastMessageTime', descending: true)
        .snapshots();
  }

  static Future<QuerySnapshot<Map<String, dynamic>>> getUserList(String role) {
    return fireStore
        .collection(FirebaseKeys.users)
        .where('role', isEqualTo: role)
        .get();
  }

  static Future<bool> sendMessage(MessageModel msgModel, String chatId) async {
    try {
      await database.ref(chatId).push().set(msgModel.textJson());
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  static Future<UserModel?> getUserModel(String uid) async {
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await fireStore.collection(FirebaseKeys.users).doc(uid).get();

    if (documentSnapshot.data() != null) {
      return UserModel.fromJson(documentSnapshot.data()!);
    }
    return null;
  }

  static Future<QuerySnapshot<Map<String, dynamic>>> getChatUserIdList() {
    return fireStore
        .collection(FirebaseKeys.users)
        .where('uid', isNotEqualTo: GlobalData.user.uid)
        .get();
  }

  static Stream<DocumentSnapshot<Map<String, dynamic>>> getUserStream(
      String uid) {
    return fireStore.collection(FirebaseKeys.users).doc(uid).snapshots();
  }
}
