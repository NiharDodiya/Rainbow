import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rainbow/common/helper.dart';
import 'package:rainbow/common/popup.dart';
import 'package:rainbow/screens/auth/auth_dashboard/api/google_id_verification_api.dart';
import 'package:rainbow/screens/auth/register/list_nationalites/list_nationalites_api.dart';
import 'package:rainbow/screens/auth/register/register_controller.dart';
import 'package:rainbow/screens/auth/register/register_screen.dart';
import 'package:rainbow/screens/auth/registerfor_adviser/listOfCountry/listOfCountryApi.dart';
import 'package:rainbow/screens/auth/registerfor_adviser/register_adviser.dart';
import 'package:rainbow/service/pref_services.dart';
import 'package:rainbow/utils/pref_keys.dart';
import 'package:rainbow/utils/strings.dart';

import '../login/login_screen.dart';

class AuthDashBordController extends GetxController {
  RxBool loading = false.obs;

  @override
  void onInit() {
    super.onInit();
    countryName();
    countryNationalites();
    update(["auth"]);
  }

  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<void> countryName() async {
    try {
      await ListOfCountryApi.postRegister()
          .then((value) => listCountryModel = value!);
      print(listCountryModel);
      getCountry();
    } catch (e) {
      errorToast(e.toString());
      debugPrint(e.toString());
    }
  }

  Future<void> countryNationalites() async {
    try {
      await ListOfNationalitiesApi.postRegister()
          .then((value) => listNationalities = value!);
      print(listNationalities);
      getCountryNation();
    } catch (e) {
      debugPrint(e.toString());
    }
  }
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  Future signWithGoogle() async {
    loading.value = true;
    if (await googleSignIn.isSignedIn()) {
      await googleSignIn.signOut();
      flutterToast(Strings.googleLogOutSuccess);
    }
    final GoogleSignInAccount? account = await googleSignIn.signIn();
    final GoogleSignInAuthentication authentication =
        await account!.authentication;

    final OAuthCredential credential = GoogleAuthProvider.credential(
      idToken: authentication.idToken,
      accessToken: authentication.accessToken,
    );

    final UserCredential authResult =
        await auth.signInWithCredential(credential);
    final User? user = authResult.user;
    print(user!.email);
    print(user.uid);
    print(user.tenantId);
    print(user.displayName);

    // GoogleIdVerification.postRegister(user.uid).then((value) {print(value);});
    try {
      await GoogleIdVerification.postRegister(user.uid, user: user)
          .then((value) async {
        print(value);

        await firebaseFirestore
            .collection("users")
            .doc(user.uid)
            .get()
            .then((value) async {
          if (value.exists) {
            await firebaseFirestore.collection("users").doc(user.uid).set({
              "email": user.email,
              "uid": user.uid,
              "name": user.displayName,
              "image": user.photoURL,
              "online": true
            });
            await PrefService.setValue(PrefKeys.uid,user.uid);
            setCount();
          } else {
            DocumentSnapshot<Map<String, dynamic>> documentReference = await firebaseFirestore
                .collection("users")
                .doc(user.uid).get();
            if(documentReference.exists==false){
              await firebaseFirestore
                  .collection("users")
                  .doc(user.uid)
                  .set({"online": true});
            }else
              {
                await firebaseFirestore
                    .collection("users")
                    .doc(user.uid)
                    .update({"online": true});
              }
            setCount();
          }
        });
      });
    } catch (e) {
      errorToast(e.toString());
      debugPrint(e.toString());
      loading.value == false;
    }
    loading.value == false;


    flutterToast(Strings.googleSignInSuccess);
  }
  setCount() async {
    int? count;
    await FirebaseFirestore.instance
        .collection("onlineCount")
        .doc("onlineCount")
        .get()
        .then((value) {
      if (value.exists) {
        count = value.data()!['count'];
      } else {}
    });
    await FirebaseFirestore.instance
        .collection("onlineCount")
        .doc("onlineCount")
        .update({"count": count! + 1});
  }

  void onSignInTap() {
    Get.to(() => LoginScreen(), transition: Transition.cupertino);
  }

  void faceBookSignIn() async {
    try {
      loading.value = true;

      final LoginResult loginResult = await FacebookAuth.instance
          .login(permissions: ["public_profile", "email"]);
      await FacebookAuth.instance.getUserData().then((userData) {
        print(userData);
      });
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(
        loginResult.accessToken!.token,
      );
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithCredential(facebookAuthCredential);
      try {
        await GoogleIdVerification.postRegister(userCredential.user!.uid,
                user: userCredential.user)
            .then((value) {
          print(value);
        });
      } catch (e) {
        errorToast(e.toString());
        debugPrint(e.toString());
      }
      loading.value = false;
      flutterToast(Strings.faceBookSignInSuccess);
    } catch (e) {
      loading.value = false;
    }
  }

  void onContinueWithEmailTap() {
    final RegisterController controller = Get.put(RegisterController());
    controller.isSocial = false;
    Get.to(() => RegisterScreen());
  }

  void onSignUpTap() {
    Get.to(() => AdviserRegisterScreen());
  }

}
