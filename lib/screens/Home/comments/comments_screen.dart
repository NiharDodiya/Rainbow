import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/screens/Home/comments/widget/user_comment.dart';
import 'package:rainbow/utils/color_res.dart';

class CommentsScreen extends StatelessWidget {
  const CommentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: InkWell(
          onTap: () => Get.back(),
          child: const Icon(
            Icons.chevron_left,
            color: ColorRes.black,
            size: 25,
          ),
        ),
        title: Text(
          "Comments",
          style: beVietnamProBoldTextStyle(
            fontSize: 16,
            color: ColorRes.black,
          ),
        ),
        backgroundColor: ColorRes.white,
        elevation: 1,
      ),
      backgroundColor: ColorRes.white,
      body: SafeArea(
        child: Container(
          height: Get.height,
          width: Get.width,
          padding: const EdgeInsets.only(left: 19, right: 19, ),
          child: ListView.separated(
            padding: EdgeInsets.only(top: 10),
            itemBuilder: (context, index) {
              return userComment();
            },
            separatorBuilder: (context, index) {
              return Divider(
                color: ColorRes.black.withOpacity(0.6),
                height: 40,
              );
            },
            itemCount: 10,
          ),
        ),
      ),
    );
  }
}
