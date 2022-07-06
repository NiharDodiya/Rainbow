import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/screens/Home/addStroy/addStory_controller.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/color_res.dart';
import 'package:rainbow/utils/strings.dart';

Widget addStoryAppBar(AddStoryController controller)
{
  return Padding(
    padding: const EdgeInsets.only(top: 20),
    child: Row(children: [
      const SizedBox(width: 15,),
      GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Image.asset(
          AssetRes.backIcon,
          height: 16,
          width: 16,
          color: Colors.black,
        ),
      ),
      SizedBox(width:Get.width * 0.3,),

      Text(Strings.addToStory,style: beVietnamRegularTextStyle(fontSize: 16,color: ColorRes.color_252525),),
      SizedBox(width:Get.width * 0.22,),

      Text(Strings.post,style: beVietnamRegularTextStyle(fontSize: 13,color: ColorRes.color_252525),)
    ],),
  );
}