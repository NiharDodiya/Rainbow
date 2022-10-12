import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/popup.dart';
import 'package:rainbow/screens/Home/home_controller.dart';
import 'package:rainbow/screens/Home/view_story/view_story_controller.dart';
import 'package:rainbow/screens/Profile/profile_api/profile_model.dart';
import 'package:rainbow/screens/advertisement/ad_home/ad_home_controller.dart';
import 'package:rainbow/screens/auth/login/login_api/login_api.dart';
import 'package:rainbow/screens/auth/login/login_api/login_json.dart';
import 'package:rainbow/screens/auth/phonenumber/phonenumber_Screen.dart';
import 'package:rainbow/screens/auth/register/register_screen.dart';
import 'package:rainbow/screens/auth/registerfor_adviser/register_adviser.dart';
import 'package:rainbow/screens/dashboard/dashboard_controller.dart';
import 'package:rainbow/service/notification_service.dart';
import 'package:rainbow/service/pref_services.dart';
import 'package:rainbow/utils/pref_keys.dart';
import 'package:rainbow/utils/strings.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  RxBool loader = false.obs;
  bool advertiser = false;
  String? userUid;

  bool? showPassword = false;

  void onSignUpTap() {
    // Get.off(() => RegisterScreen(), transition: Transition.cupertino);
    Get.off(
      () => !advertiser ? AdviserRegisterScreen() : RegisterScreen(),
    );
  }

  void onTapAsLogin() {
    advertiser = !advertiser;
    update(['as']);
  }

  void onSignUpDontHaveTap() {
    Get.off(() => advertiser ? AdviserRegisterScreen() : RegisterScreen(),
        transition: Transition.cupertino);

    // Get.off(() => AdviserRegisterScreen(), );
  }

  void onLoginTap(context) {


     HomeController homeController = Get.put(HomeController());
     AdHomeController adHomeController = Get.put(AdHomeController());


     adHomeController.viewAdvertiserModel.data?.profilePhoto = null;
     adHomeController.viewAdvertiserModel.data?.fullName = "";
     adHomeController.viewAdvertiserModel.data?.profileImage = "";
     adHomeController.viewAdvertiserModel.data?.email = "";
     homeController.viewProfile.data = null;
     homeController.controller.viewProfile.data?.profileImage = null;
     homeController.controller.viewProfile.data?.profileImage  = "";


     homeController.viewStoryController.storyModel.friendsStory = null;
     homeController.viewStoryController.storyModel.friendsStory?.length = 0;
     homeController.friendPostListData = [];


    FocusScopeNode currentfocus = FocusScope.of(context);
    if (!currentfocus.hasPrimaryFocus) {
      currentfocus.unfocus();
    }

    if (validation()) {
      registerDetails();
    }
  }

  void onForgotPassword() {
    Get.to(() => PhoneNumberScreen());
  }

  void onTapShowPassword() {
    if (showPassword == false) {
      showPassword = true;
      print(showPassword);
    } else {
      showPassword = false;
      print(showPassword);
    }
    update(["login_form"]);
  }

  bool validation() {
    if (emailController.text.isEmpty) {
      errorToast(Strings.emailError);
      return false;
    } else if (!GetUtils.isEmail(emailController.text)) {
      errorToast(Strings.emailValidError);
      return false;
    } else if (passwordController.text.isEmpty) {
      errorToast(Strings.passwordError);
      return false;
    }
    return true;
  }

  LoginModel loginModel = LoginModel();

 /* ViewStoryController viewStoryController = Get.put(ViewStoryController());
  HomeController homeController = Get.put(HomeController());*/
  Future<void> registerDetails() async {
    loader.value = true;
    try {
     /* viewStoryController.storyModel.friendsStory=null;
      homeController.myStoryController.viewStoryController.storyModel
          .myStory=null;*/
      loginModel = await LoginApi.postRegister(
        emailController.text,
        passwordController.text,
      );
      // await PrefService.setValue(PrefKeys.uid, loginM );
      await firebaseSignIn();
      loader.value = false;
      //flutterToast("Successfully login");
      // await PrefService.setValue(PrefKeys.accessToken, loginModel.token);
    } catch (e) {
      loader.value = false;
      debugPrint(e.toString());
    }
  }

  Future<void> firebaseSignIn() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    try {
      final userCredential = await firebaseAuth.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
      if (userCredential.user != null) {
        print(userCredential.user!.uid);
        userUid = userCredential.user!.uid;
        await PrefService.setValue(PrefKeys.uid, userCredential.user!.uid);
        await addUser(userCredential.user!.uid);

        DashboardController dashboardController =
            Get.put(DashboardController());
        dashboardController.setUserOnlineStatus(true);
        // Get.snackbar("Success", "Login SuccessFull");
        //Get.to(() => const UserListScreen());
      }
    } on FirebaseAuthException catch (e) {
      print(e.toString());
      if (e.code == "user-not-found") {
        // Get.snackbar("Error", "User Not Found");
      } else if (e.code == "wrong-password") {
        // Get.snackbar("Error", "Wrong Password");
      }
    }
    update(['login']);
  }
String? token;

  Future<void> addUser(String uid) async {
    token = await NotificationService.getFcmToken();
    print("usert token$token");
    await firebaseFirestore
        .collection("users")
        .doc(uid)
        .get()
        .then((value) async {
      if (!value.exists) {
        await firebaseFirestore.collection("users").doc(uid).set({
          "email": emailController.text,
          "uid": userUid,
          "id": PrefService.getInt(PrefKeys.userId),
          "name": loginModel.data!.fullName,
          "image": loginModel.data!.profileImage,
          "UserToken": token.toString(),
          "online": true
        });
      } else {
        await firebaseFirestore
            .collection("users")
            .doc(uid)
            .update({"online": true});
      }
    });
  }
}
