import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/utils/color_res.dart';
import 'package:rainbow/utils/strings.dart';

void errorToast(String error, {String? title}) {
  Get.snackbar(
    title ?? Strings.errorText,
    error,
    duration: const Duration(seconds: 1),
    colorText: ColorRes.white,
    backgroundColor: ColorRes.red,
  );
}

void flutterToast(String value, {String? title}) {
  Get.snackbar(
    title ?? Strings.successText,
    value,
    duration: const Duration(seconds: 1),
    colorText: ColorRes.white,
    backgroundColor: Colors.green,
  );
}

void commonAlert(
    {String? title,
    String? content,
    VoidCallback? onOkTap,
    VoidCallback? onCancelTap}) {
  Get.dialog(
      AlertDialog(
        title: title == null ? null : Text(title),
        content: content == null ? null : Text(content),
        actions: [
          TextButton(
            onPressed: onOkTap,
            child: const Text(
              "Ok",
              style: TextStyle(color: ColorRes.red),
            ),
          ),
          TextButton(
            onPressed: onCancelTap ?? Get.back,
            child: const Text("Cancel"),
          ),
        ],
      ),
  );
}
