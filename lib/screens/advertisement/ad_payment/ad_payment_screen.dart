import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/utils/color_res.dart';

class AdPaymentScreen extends StatelessWidget {
  const AdPaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      color: ColorRes.darkBlue,
      child: Center(
        child: Text("AdPaymentScreen"),
      ),
    );
  }
}
