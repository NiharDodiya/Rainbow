
import 'package:rainbow/screens/auth/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void onSignUpTap(){
    Get.to(() => RegisterScreen());
  }
}
