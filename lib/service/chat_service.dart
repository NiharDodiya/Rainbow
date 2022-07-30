import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:rainbow/model/message_model.dart';
String userUid="";
class ChatServices{
  static FirebaseDatabase database = FirebaseDatabase.instance;


  static Future<void> getCurrentUserUid() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    if (auth.currentUser != null) {
      userUid = auth.currentUser!.uid;
    }
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


}