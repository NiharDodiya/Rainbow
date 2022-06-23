import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/screens/auth/register/register_screen.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void onSignUpTap(){
    Get.to(() => const RegisterScreen());
  }
}
