import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SmartLoader extends StatelessWidget {
  const SmartLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Platform.isIOS
            ? const CupertinoActivityIndicator()
            : const CircularProgressIndicator(),
      ),
    );
  }
}

class SmallLoader extends StatelessWidget {
  final double? progress;

  const SmallLoader({Key? key, this.progress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Platform.isIOS
          ? const CupertinoActivityIndicator()
          : CircularProgressIndicator(value: progress),
    );
  }
}

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black54,
      height: Get.height,
      width: Get.width,
      child: InkWell(
        onTap: () {},
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(35),
            height: 110,
            width: 110,
            decoration: BoxDecoration(
                color: Colors.white70, borderRadius: BorderRadius.circular(25)),
            child: const CircularProgressIndicator(
              backgroundColor: Colors.white,
              color: Colors.black45,
            ),
          ),
        ),
      ),
    );
  }
}
