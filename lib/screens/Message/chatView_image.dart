import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/utils/color_res.dart';

class ChatViewImageScreen extends StatelessWidget {
  String image;

  ChatViewImageScreen({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: ColorRes.color_6753A3,
        elevation: 0,
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        color: ColorRes.color_6753A3,
        child: Image.network(
          image,
        ),
      ),
    );
  }
}
