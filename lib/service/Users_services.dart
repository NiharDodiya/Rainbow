import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:rainbow/model/user_model.dart';
import 'package:rainbow/utils/firebaseKey.dart';

class UserService {
  static FirebaseFirestore fireStore = FirebaseFirestore.instance;
  static FirebaseStorage storage = FirebaseStorage.instance;

  static Future<UserModel?> getUserModel(String uid) async {
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await fireStore.collection(FirebaseKeys.users).doc(uid).get();

    if (documentSnapshot.data() != null) {
      return UserModel.fromJson(documentSnapshot.data()!);
    }
    return null;
  }

  static Future<void> updateUserModel(UserModel user) async {
    try {
      await fireStore
          .collection(FirebaseKeys.users)
          .doc(user.uid)
          .update(user.updateJson());
    } catch (e) {

    }
  }

/*  static Future<void> createUser(UserModel? user) async {
    await fireStore
        .collection(FirebaseKeys.users)
        .doc(user!.uid).collection(FirebaseKeys.registerId).doc(PrefService.getInt(PrefKeys.userId).toString())
        .set(user.toJson());
  }*/
}
