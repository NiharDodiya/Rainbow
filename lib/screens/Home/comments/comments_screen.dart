import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/screens/Home/comments/comments_controller.dart';
import 'package:rainbow/screens/Home/comments/widget/user_comment.dart';
import 'package:rainbow/utils/color_res.dart';
import 'package:rainbow/utils/strings.dart';

class CommentsScreen extends StatelessWidget {
  const CommentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CommentsController controller = Get.put(CommentsController());
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
        child: Column(
          children: [
            Expanded(
              child: Container(
                height: Get.height,
                width: Get.width,
                padding: const EdgeInsets.only(
                  left: 19,
                  right: 19,
                ),
                child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  padding: const EdgeInsets.only(top: 10),
                  itemBuilder: (context, index) {
                    return userComment(
                      controller.reply[index],
                    );
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
            Container(
              width: Get.width,

              decoration: BoxDecoration(
                  color: ColorRes.white,
                  boxShadow: [
                    BoxShadow(color: ColorRes.black.withOpacity(0.5),blurRadius: 15.0,offset: Offset(-10, 10), )
                  ]
              ),
              padding: const EdgeInsets.only(
                left: 19,
                right: 12,
                top: 10,
                bottom: 15,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'Replying to ',
                      style: beVietnamProRegularTextStyle(
                        fontSize: 14,
                        color: ColorRes.black,
                      ),
                      children: [
                        TextSpan(
                          text: "Maria Rosales",
                          style: beVietnamProMediumTextStyle(
                            color: ColorRes.themeColor,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.only(right: 5,top: 15),
                          child: Image.asset(
                            AssetRes.commentCamera,
                            height: 22,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Padding(
                          padding:
                          const EdgeInsets.only(left: 15.0, right: 5,top: 15),
                          child: Image.asset(
                            AssetRes.commentGallery,
                            height: 22,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 40,
                          margin: const EdgeInsets.only(left: 5,top: 7),
                          padding: const EdgeInsets.only(left: 7,top: 7,bottom: 7,right: 7),
                          decoration: BoxDecoration(
                            color: ColorRes.color_959595.withOpacity(0.5),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: controller.msgController,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.only(top: 0,bottom: 12),
                                    border: InputBorder.none,
                                    hintText: Strings.typeYourReply,
                                    hintStyle: sfProTextReguler(
                                      fontSize: 17,
                                      color: ColorRes.black.withOpacity(0.40),
                                    ),
                                  ),
                                  style: sfProTextReguler(
                                    fontSize: 17,
                                    color: ColorRes.black,
                                  ),
                                  textInputAction: TextInputAction.newline,
                                ),
                              ),
                              InkWell(
                                onTap: () {},
                                child: Padding(
                                  padding:
                                  const EdgeInsets.only(left: 5, right: 5,top: 5,bottom: 5),
                                  child: Image.asset(
                                    AssetRes.commentSend,
                                    height: 17,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 5),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
