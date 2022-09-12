import 'package:flutter/material.dart';
import 'package:rainbow/common/Widget/premiumPopUpBox/PremiumPopUpBox.dart';
import 'package:rainbow/utils/color_res.dart';

class MyScreen extends StatelessWidget {
  const MyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.color_4F359B,
      body: Center(
        child: premiumPopUpBox(),
      ),
    );
  }
}
