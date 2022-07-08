
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/utils/color_res.dart';

class AdSupportScreen extends StatelessWidget {
  const AdSupportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      color: ColorRes.color_E7D01F,
      child: const Center(
        child: Text("AdSupportScreen"),
      ),
    );
  }
}
