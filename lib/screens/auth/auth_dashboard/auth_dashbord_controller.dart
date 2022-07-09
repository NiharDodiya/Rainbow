import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rainbow/common/popup.dart';
import 'package:http/http.dart' as http;

import 'package:rainbow/screens/auth/register/register_screen.dart';
import 'package:rainbow/screens/auth/registerfor_adviser/register_adviser.dart';
import 'package:rainbow/utils/strings.dart';

import '../login/login_screen.dart';

class AuthDashBordController extends GetxController {
  RxBool loading = false.obs;

  void onInti() {
    super.onInit();
    update(["auth"]);
  }

  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<User?> signWithGoogle() async {

    if (await googleSignIn.isSignedIn()) {
      await googleSignIn.signOut();
     // flutterToast(Strings.googleLogOutSuccess);
    }
    loading.value == true;
    final GoogleSignInAccount? account = await googleSignIn.signIn();
    final GoogleSignInAuthentication authentication =
        await account!.authentication;

      final OAuthCredential credential = GoogleAuthProvider.credential(
          idToken: authentication.idToken,
          accessToken: authentication.accessToken);

    final UserCredential authResult =
    await auth.signInWithCredential(credential);
    final User? user = authResult.user;
    print(user!.email);
    print(user.displayName);

     loading.value == false;
     flutterToast(Strings.googleSignInSuccess);
    return user;
  }

  void onSignInTap() {
    Get.to(() => LoginScreen(), transition: Transition.cupertino);
  }
  void faceBookSignIn()
  async {
 try{
   loading.value  =true;
   final LoginResult loginResult = await FacebookAuth.instance.login();

   final OAuthCredential facebookAuthCredential = FacebookAuthProvider
       .credential(loginResult.accessToken!.token);
   loading.value  =false;
   flutterToast(Strings.faceBookSignInSuccess);
 }catch(e){
   loading.value  =false;

 }
  }
  void onContinueWithEmailTap() {
    Get.to(() => RegisterScreen());
  }
  void onSignUpTap() {
    Get.to(() => AdviserRegisterScreen());
  }
}
