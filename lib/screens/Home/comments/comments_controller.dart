import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommentsController extends GetxController {
  List<bool> reply = [
    true,
    true,
    false,
    true,
    false,
    true,
    true,
    false,
    true,
    true
  ];
  TextEditingController msgController = TextEditingController();
}
