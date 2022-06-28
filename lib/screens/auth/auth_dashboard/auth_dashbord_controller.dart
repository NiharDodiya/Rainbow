import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rainbow/screens/auth/register/register_screen.dart';

import '../login/login_screen.dart';

class AuthDashBordController extends GetxController {
  bool loading = false;

  void onInti() {
    super.onInit();
    update(["auth"]);
  }

  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<User?> signWithGoogle() async {
    loading == true;
    if (await googleSignIn.isSignedIn()) {
      await googleSignIn.signOut();
    }
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

    loading == false;
    return user;
  }

  void onSignInTap() {
    Get.to(() => LoginScreen(), transition: Transition.cupertino);
  }

  void onSignUpTap() {
    Get.to(() => RegisterScreen(), transition: Transition.cupertino);
  }
}
