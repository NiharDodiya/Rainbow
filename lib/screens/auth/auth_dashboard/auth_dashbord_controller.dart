
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthDashBordController extends GetxController
{

  bool loading = false;
  void onInti()
  {
    super.onInit();
    update(["auth"]);
  }


  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();


  Future<User?> signWithGoogle() async {
    loading == true;
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
  void signOutGoogle() async{
    loading == true;
    await googleSignIn.signOut();
    print("User Sign Out");
    loading == false;
  }
}