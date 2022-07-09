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
        height: 60,
        width: Get.width * 0.85,
        decoration: BoxDecoration(
          color: ColorRes.color_E7D01F,
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            colors: [ColorRes.color_FFEC5C, ColorRes.color_DFC60B],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Center(
          child: child ??
              Text(
                text!,
                style: gilroyBoldTextStyle(color: Colors.black, fontSize: 16),
              ),
        ),
      ),
    );
  }
}
