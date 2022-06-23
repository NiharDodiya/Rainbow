import 'package:flutter/material.dart';

class AppTextFiled extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final String? hintText;
  final bool? obscure;
  final Widget? prefix;

  const AppTextFiled({
    Key? key,
    required this.controller,
    required this.title,
    this.hintText,
    this.obscure,
    this.prefix,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(title,style: ,),
        TextField(
          obscureText: obscure ?? false,
        ),
      ],
    );
  }
}
