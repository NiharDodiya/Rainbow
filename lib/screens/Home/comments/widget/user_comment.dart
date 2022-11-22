import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/model/post_comment_list_model.dart';
import 'package:rainbow/screens/Home/comments/comments_controller.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/color_res.dart';

Widget userComment(
    {String? description,
    String? fullName,
    String? profileImage,
    String? image,
    String? commentId,
    DateTime? date,
    List<PostCommentReply>? reply = const []}) {
  return GetBuilder<CommentsController>(
      id: "commentPost",
      builder: (controller) {
        return Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: profileImage.toString() == ""
                      ? const ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          child: FadeInImage(
                            placeholder:
                                AssetImage(AssetRes.portraitPlaceholder),
                            image: AssetImage(AssetRes.portraitPlaceholder),
                            fit: BoxFit.cover,
                          ),
                        )
                      : ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(50)),
                          child: CachedNetworkImage(
                            imageUrl: profileImage.toString(),
                            fit: BoxFit.cover,
                            errorWidget: ((context, url, error) => Image.asset(
                                  AssetRes.portraitPlaceholder,
                                  height: 40,
                                  width: 40,
                                  fit: BoxFit.cover,
                                )),
                            placeholder: ((context, url) => Image.asset(
                                  AssetRes.portraitPlaceholder,
                                  height: 40,
                                  width: 40,
                                  fit: BoxFit.cover,
                                )),
                          ),
                          /*FadeInImage(
                            placeholder:
                                const AssetImage(AssetRes.portraitPlaceholder),
                            image: NetworkImage(profileImage.toString()),
                            fit: BoxFit.cover,
                          ),*/
                        ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 60,
                      width: Get.width - 90,
                      decoration: BoxDecoration(
                        color: ColorRes.color_959595.withOpacity(0.1),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      margin: const EdgeInsets.only(left: 5),
                      padding: const EdgeInsets.all(7),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            fullName.toString(),
                            style: beVietnamProMediumTextStyle(
                                color: ColorRes.black),
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          Text(
                            description.toString(),
                            style: beVietnamProRegularTextStyle(
                                fontSize: 12, color: ColorRes.black),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          controller.timeAgo(date!),
                          style: beVietnamProRegularTextStyle(
                            fontSize: 10,
                            color: ColorRes.color_959595,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            controller.onReplyTap(commentId, fullName);
                          },
                          child: Container(
                            padding: const EdgeInsets.only(
                                left: 15, top: 5, right: 15, bottom: 5),
                            child: Text(
                              "Reply",
                              style: beVietnamProRegularTextStyle(
                                fontSize: 12,
                                color: ColorRes.color_959595,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    image == ""
                        ? const SizedBox()
                        : /*Image.network(
                            image.toString(),
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                            errorBuilder: (context, url, error) => const Icon(
                              Icons.error,
                              color: Colors.grey,
                            ),
                          )*/
                        CachedNetworkImage(
                            height: 100,
                            width: 100,
                            imageUrl: image.toString(),
                            fit: BoxFit.cover,
                            errorWidget: ((context, url, error) => Image.asset(
                                  AssetRes.placeholderImage,
                                  height: 100,
                                  width: 100,
                                  fit: BoxFit.cover,
                                )),
                            placeholder: ((context, url) => Image.asset(
                                  AssetRes.placeholderImage,
                                  height: 100,
                                  width: 100,
                                  fit: BoxFit.cover,
                                )),
                          ),
                    /*FadeInImage(
                            height: 100,
                            width: 100,
                            placeholder:
                                const AssetImage(AssetRes.placeholderImage),
                            image: NetworkImage(image.toString()),
                            fit: BoxFit.cover,
                          ),*/
                    /* controller.replay == true
                            ? Align(
                                alignment: Alignment.topRight,
                                child: FadeInImage(
                                  height: 100,
                                  width: 100,
                                  placeholder: const AssetImage(
                                      AssetRes.placeholderImage),
                                  image: NetworkImage(image.toString()),
                                  fit: BoxFit.cover,
                                ))
                            : FadeInImage(
                                height: 100,
                                width: 100,
                                placeholder:
                                    const AssetImage(AssetRes.placeholderImage),
                                image: NetworkImage(image.toString()),
                                fit: BoxFit.cover,
                              ),*/
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Align(
              alignment: Alignment.topRight,
              child: SizedBox(
                width: Get.width * 0.717,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: reply!.length,
                  itemBuilder: (context, index) {
                    return reply.isNotEmpty
                        ? Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Column(
                              children: [
                                const Divider(
                                  thickness: 0.5,
                                  color: Colors.grey,
                                ),
                                const SizedBox(height: 10),
                                Container(
                                  width: Get.width - 110,
                                  decoration: BoxDecoration(
                                    color:
                                        ColorRes.color_959595.withOpacity(0.1),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(15),
                                    ),
                                  ),
                                  margin: const EdgeInsets.only(
                                    left: 25,
                                  ),
                                  padding: const EdgeInsets.all(7),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        reply[index]
                                            .postCommentUser!
                                            .fullName
                                            .toString(),
                                        style: beVietnamProMediumTextStyle(
                                            color: ColorRes.black),
                                      ),
                                      /* Text(
                                    controller.timeAgo(reply[index].createdAt!),
                                    style: beVietnamProRegularTextStyle(
                                      fontSize: 10,
                                      color: ColorRes.color_959595,
                                    ),
                                  ),*/
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        controller
                                            .timeAgo(reply[index].createdAt!),
                                        style: beVietnamProRegularTextStyle(
                                          fontSize: 10,
                                          color: ColorRes.color_959595,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 7,
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          text: "",
                                          style: beVietnamProRegularTextStyle(
                                            color: ColorRes.themeColor,
                                            fontSize: 12,
                                          ),
                                          children: [
                                            TextSpan(
                                              text: reply[index]
                                                  .description
                                                  .toString(),
                                              style:
                                                  beVietnamProRegularTextStyle(
                                                fontSize: 12,
                                                color: ColorRes.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      reply[index].postCommentItem.toString() ==
                                              ""
                                          ? const SizedBox()
                                          : CachedNetworkImage(
                                              imageUrl: reply[index]
                                                  .postCommentItem
                                                  .toString(),
                                              height: 100,
                                              width: 100,
                                              fit: BoxFit.cover,
                                              placeholder: ((context, url) =>
                                                  Image.asset(AssetRes
                                                      .placeholderImage)),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      const Icon(Icons.error),
                                            ),
                                      /* reply[index].postCommentItem.toString() == ""
                                          ? const SizedBox()
                                          :  image == ""
                                          ? const SizedBox()
                                      : FadeInImage(
                                        height: 100,
                                        width: 100,
                                        placeholder: const AssetImage(
                                            AssetRes.placeholderImage),
                                        image: NetworkImage(reply[index]
                                            .postCommentItem
                                            .toString()),
                                        fit: BoxFit.cover,
                                      ),*/
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 10),
                                /* Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 30),
                                    child: Text(
                                      controller
                                          .timeAgo(reply[index].createdAt!),
                                      style: beVietnamProRegularTextStyle(
                                        fontSize: 10,
                                        color: ColorRes.color_959595,
                                      ),
                                    ),
                                  ),
                                ),*/
                                const SizedBox(height: 10),
                                /*reply[index].postCommentItem.toString() == ""
                                    ? const SizedBox()
                                    : */ /*image == ""
                                          ? const SizedBox()*/ /*
                                Align(
                                  alignment: Alignment.topRight,
                                  child: FadeInImage(
                                    height: 100,
                                    width: 100,
                                    placeholder: const AssetImage(
                                        AssetRes.placeholderImage),
                                    image: NetworkImage(reply[index]
                                        .postCommentItem
                                        .toString()),
                                    fit: BoxFit.cover,
                                  ),
                                ),*/
                                const SizedBox(height: 20),
                              ],
                            ),
                          )
                        : const SizedBox();
                  },
                ),
              ),
            ),
          ],
        );
      });
}
