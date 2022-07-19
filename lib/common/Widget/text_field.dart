import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/utils/color_res.dart';

class AppTextFiled extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final String? hintText;
  final double? fontsize;
  final bool? obscure;
  final Widget? prefix;
  final Widget? suffix;
  final TextInputType? textInputType;
  final double? bottomPadding;
  final bool? enable;
  final VoidCallback? onTap;
  final bool? multiLine;
  final Function(String)? onChange;
  final EdgeInsetsGeometry? inputPadding;
  final double? titleBottomPadding;
  final bool? showTitle;

  const AppTextFiled({
    Key? key,
    required this.controller,
    required this.title,
    this.hintText,
    this.fontsize,
    this.obscure,
    this.prefix,
    this.textInputType,
    this.suffix,
    this.bottomPadding,
    this.enable,
    this.onTap,
    this.multiLine,
    this.onChange,
    this.inputPadding,
    this.titleBottomPadding,
    this.showTitle = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        showTitle!
            ? Text(title, style: gilroySemiBoldTextStyle(fontSize: 14))
            : const SizedBox(),
        showTitle!
            ? SizedBox(height: titleBottomPadding ?? Get.height * 0.012)
            : const SizedBox(),
        Container(
          width: Get.width,
          height: 60,
          // constraints: BoxConstraints(
          //   minHeight: Get.height * 0.0739,
          //   maxHeight: Get.height * 0.25,
          // ),
          decoration: BoxDecoration(
            color: ColorRes.white,
            borderRadius: BorderRadius.circular(20),
          ),
          padding: inputPadding ?? const EdgeInsets.fromLTRB(20, 0, 23, 0),
          child: Row(
            children: [
              prefix ?? const SizedBox(),
              Expanded(
                child: InkWell(
                  onTap: onTap,
                  child: TextField(
                    controller: controller,
                    obscureText: obscure ?? false,
                    style: textFieldText,
                    keyboardType: textInputType,
                    enabled: enable,
                    obscuringCharacter: "•",
                    textInputAction:
                        multiLine == true ? TextInputAction.newline : null,
                    maxLength: controller.text.length < 450 ? null : 500,
                    maxLines: multiLine == true ? 5 : 1,
                    minLines: 1,
                    onChanged: onChange,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintStyle: gilroyMediumTextStyle(
                          fontSize: fontsize ?? 18,
                          color: ColorRes.black.withOpacity(0.3)),
                      hintText: hintText,
                    ),
                  ),
                ),
              ),
              suffix ?? const SizedBox(),
            ],
          ),
        ),
        SizedBox(height: bottomPadding ?? 13),
      ],
    );
  }
}
