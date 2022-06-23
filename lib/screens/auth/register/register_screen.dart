import 'package:flutter/material.dart';
import 'package:rainbow/screens/auth/register/widget/register_form.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            RegisterForm(),
          ],
        ),
      ),
    );
  }
}
