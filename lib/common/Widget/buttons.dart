import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/utils/color_res.dart';

class SubmitButton extends StatelessWidget {
  final String? text;
  final VoidCallback? onTap;
  final Widget? child;

  const SubmitButton({Key? key, this.text = '', this.onTap, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: Get.height * 0.076,
        width: Get.width * 0.85,
        decoration: BoxDecoration(
          color: ColorRes.color_E7D01F,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: child ?? Text(
            text!,
            style: gilroyBoldTextStyle(color: Colors.black,fontSize: 16),
          ),
        ),
      ),
    );
  }
}
