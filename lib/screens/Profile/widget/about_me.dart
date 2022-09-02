import 'package:flutter/material.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/utils/color_res.dart';
import 'package:rainbow/utils/strings.dart';
import 'package:readmore/readmore.dart';

Widget aboutProfiler(String title, String aboutMe) {
  return Padding(
    padding: const EdgeInsets.only(left: 30, right: 30),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        Text(
          title,
          style: beVietnamProBoldTextStyle(fontSize: 18),
        ),
        aboutMe == ""
            ? Center(
                child: Text(
                  "-",
                  style: gilroyBoldTextStyle(fontSize: 18),
                ),
              )
            : Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.only(top: 15),
                child: ReadMoreText(
                  /* "${Strings.aboutMeDes}${Strings.aboutMeDes} ",*/
                  aboutMe,
                  trimLines: 3,
                  trimMode: TrimMode.Line,
                  delimiter: " ",
                  trimCollapsedText: Strings.seeMore,
                  trimExpandedText: Strings.seeLess,
                  style: beVietnamProRegularTextStyle(
                      color: ColorRes.white.withOpacity(0.70), fontSize: 18),
                  moreStyle: beVietnamProRegularTextStyle(
                    color: ColorRes.color_FF6B97,
                  ),
                  lessStyle: beVietnamProRegularTextStyle(
                    color: ColorRes.color_FF6B97,
                  ),
                ),
              ),
      ],
    ),
  );
}
