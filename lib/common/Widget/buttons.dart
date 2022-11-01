import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/utils/color_res.dart';

class SubmitButton extends StatelessWidget {
  final String? text;
  final VoidCallback? onTap;
  final Widget? child;
  final List<Color>? colors;

  const SubmitButton(
      {Key? key, this.text = '', this.onTap, this.child, this.colors})
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
          color: ColorRes.colorE7D01F,
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: colors ?? [ColorRes.colorFFEC5C, ColorRes.colorDFC60B],
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
