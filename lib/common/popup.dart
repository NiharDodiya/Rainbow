import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/utils/color_res.dart';
import 'package:rainbow/utils/strings.dart';

void errorToast(String error, {String? title}) {
  Get.snackbar(
    title ?? Strings.errorText,
    error,
    colorText: ColorRes.white,
    backgroundColor: ColorRes.red,
  );
}

void flutterToast(String value, {String? title}) {
  Get.snackbar(
    title ?? Strings.successText,
    value,
    colorText: ColorRes.white,
    backgroundColor: Colors.green,
  );
}
