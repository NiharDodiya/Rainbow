// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_stack/image_stack.dart';

import 'package:paginate_firestore/paginate_firestore.dart';
import 'package:rainbow/common/Widget/loaders.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/common/helper.dart';
import 'package:rainbow/screens/Message/chatView_image.dart';
import 'package:rainbow/screens/Message/message_controller.dart';
import 'package:rainbow/screens/Profile/profile_controller.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/color_res.dart';

class ChatScreen extends StatelessWidget {
  final String? name;
  final String? roomId;
  final String? otherUserUid;
  final String? userUid;
  final String? profileImage;
  final String? userToken;

  ChatScreen(
      {Key? key,
      this.name,
      this.userUid,
      this.otherUserUid,
      this.roomId,
      this.profileImage,
      this.userToken})
      : super(key: key);
  MessageController messageController = Get.put(MessageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<MessageController>(
        id: "chats",
        builder: (controller) {
          return (messageController.image == null)
              ? Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        ColorRes.color_50369C,
                        ColorRes.color_D18EEE,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      Container(
                        height: 86,
                        padding: const EdgeInsets.only(bottom: 10),
                        decoration:
                            BoxDecoration(color: Colors.white.withOpacity(0.6)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 20,
                                  bottom: 20,
                                  right: 20,
                                ),
                                child: Image.asset(
                                  AssetRes.backIcon,
                                  height: 15,
                                  width: 35,
                                ),
                              ),
                            ),
                            const SizedBox(width: 9),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                profileImage.toString().isEmpty
                                    ? Container(
                                        height: 50,
                                        width: 50,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: AssetImage(AssetRes
                                                  .portrait_placeholder)),
                                        ),
                                      )
                                    : Container(
                                        height: 50,
                                        width: 50,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: ClipRRect(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(50)),
                                          child: CachedNetworkImage(
                                            imageUrl: profileImage.toString(),
                                            fit: BoxFit.cover,
                                            errorWidget: ((context, url,
                                                    error) =>
                                                Image.asset(
                                                  AssetRes.portrait_placeholder,
                                                  height: 50,
                                                  width: 50,
                                                  fit: BoxFit.cover,
                                                )),
                                            placeholder: ((context, url) =>
                                                Image.asset(
                                                  AssetRes.portrait_placeholder,
                                                  height: 50,
                                                  width: 50,
                                                  fit: BoxFit.cover,
                                                )),
                                          ),
                                          /*FadeInImage(
                                            placeholder: const AssetImage(
                                                AssetRes.portrait_placeholder),
                                            image: NetworkImage(
                                                profileImage.toString()),
                                            fit: BoxFit.cover,
                                          ),*/
                                        ),
                                      ),
                                /*   Container(
                            height: 50,
                            width: 50,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Colors.grey),
                          ),*/
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      name.toString(),
                                      style: sfProTextReguler(
                                        fontSize: 17,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "Connection",
                                      style: sfProTextReguler(
                                          fontSize: 13,
                                          color: ColorRes.color_000000
                                              .withOpacity(0.5)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: PaginateFirestore(
                            onEmpty: SizedBox(
                              height: Get.height - (86 + 80),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.grey,
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          profileImage.toString(),
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    name.toString(),
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const Text(
                                    "You’re connection on Rainbow",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  SizedBox(
                                    height: 50,
                                    width: 50,
                                    child: ImageStack(
                                      imageList: [
                                        profileImage.toString(),
                                        (Get.find<ProfileController>()
                                                .viewProfile
                                                .data
                                                ?.profileImage ??
                                            ''),
                                      ],
                                      totalCount: 2,
                                      // If larger than images.length, will show extra empty circle
                                      imageRadius: 25,
                                      // Radius of each images
                                      imageCount: 3,
                                      // Maximum number of images to be shown in stack
                                      imageBorderWidth: 1,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            padding: const EdgeInsets.only(top: 30),
                            scrollController: controller.listScrollController,
                            isLive: true,
                            reverse: true,
                            itemBuilder: (context, docementSnapshot, index) {
                              Map<String, dynamic>? data =
                                  docementSnapshot[index].data()
                                      as Map<String, dynamic>?;
                              if (data == null) {
                                return const SizedBox();
                              }
                              if (index == 0) {
                                controller.lastMsg = data['time'].toDate();
                              }

                              if (data['read'] != true &&
                                  data['senderUid'].toString() != userUid) {
                                controller
                                    .setReadTrue(docementSnapshot[index].id);
                              }

                              Widget box = data['type'] == "alert"
                                  ? alertBox(data['time'].toDate())
                                  : Column(
                                      children: [
                                        SizedBox(
                                          width: Get.width,
                                          height: 35,
                                          child: Center(
                                            child: Text(
                                              controller.timeAgo(
                                                  data['time'].toDate()),
                                              style: textStyleFont14WhiteW500
                                                  .copyWith(
                                                color: ColorRes.color_F0F0F0
                                                    .withOpacity(0.5),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          mainAxisAlignment:
                                              data['senderUid'].toString() ==
                                                      userUid
                                                  ? MainAxisAlignment.end
                                                  : MainAxisAlignment.start,
                                          children: [
                                            // Text(controller.data['time'].toString(),style: sfProTextReguler(fontSize: 12,color:ColorRes.color_F0F0F0 ),),
                                            const SizedBox(
                                              width: 9,
                                            ),
                                            data['senderUid'].toString() ==
                                                    userUid
                                                ? const SizedBox()
                                                : profileImage.toString() == ""
                                                    ? ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(50),
                                                        child: Image.asset(
                                                          AssetRes
                                                              .portrait_placeholder,
                                                          height: 28,
                                                          width: 28,
                                                        ))
                                                    : ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(50),
                                                        child:
                                                            CachedNetworkImage(
                                                          imageUrl: profileImage
                                                              .toString(),
                                                          fit: BoxFit.cover,
                                                          errorWidget:
                                                              ((context, url,
                                                                      error) =>
                                                                  Image.asset(
                                                                    AssetRes
                                                                        .portrait_placeholder,
                                                                    height: 28,
                                                                    width: 28,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  )),
                                                          placeholder:
                                                              ((context, url) =>
                                                                  Image.asset(
                                                                    AssetRes
                                                                        .portrait_placeholder,
                                                                    height: 28,
                                                                    width: 28,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  )),
                                                        ),
                                                        /*FadeInImage(
                                                          placeholder:
                                                              const AssetImage(
                                                            AssetRes
                                                                .portrait_placeholder,
                                                          ),
                                                          image: NetworkImage(
                                                            profileImage
                                                                .toString(),
                                                          ),
                                                          height: 28,
                                                          width: 28,
                                                          fit: BoxFit.cover,
                                                        ),*/
                                                      ),
                                            const SizedBox(
                                              width: 12,
                                            ),
                                            data['type'] == "text"
                                                ? Container(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10),
                                                    constraints: BoxConstraints(
                                                      maxWidth: Get.width / 1.3,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50),
                                                      color: data['senderUid']
                                                                  .toString() ==
                                                              userUid
                                                          ? Colors.white
                                                          : ColorRes
                                                              .color_E9D224,
                                                    ),
                                                    child: Text(
                                                      data['content']
                                                          .toString(),
                                                      style:
                                                          gilroyBoldTextStyle(
                                                              fontSize: 17,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  )
                                                : Container(
                                                    height: 200,
                                                    width: 200,
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color:
                                                                Colors.white),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10)),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          const BorderRadius
                                                                  .all(
                                                              Radius.circular(
                                                                  10)),
                                                      child: InkWell(
                                                        onTap: () {
                                                          Get.to(() =>
                                                              ChatViewImageScreen(
                                                                image: data[
                                                                    'image'],
                                                              ));
                                                        },
                                                        child: FadeInImage(
                                                          placeholder:
                                                              const AssetImage(
                                                                  AssetRes
                                                                      .portrait_placeholder),
                                                          image: NetworkImage(
                                                            data['image'],
                                                          ),
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            (data['senderUid'].toString() ==
                                                        userUid) &&
                                                    (data['read'] == true)
                                                ? Image.asset(
                                                    AssetRes.read,
                                                    color: Colors.white,
                                                    height: 16,
                                                    width: 16,
                                                  )
                                                : const SizedBox(),
                                            const SizedBox(
                                              width: 5,
                                            )
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                      ],
                                    );
                              if ((index + 1) == docementSnapshot.length) {
                                return Column(
                                  // mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 100,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.grey,
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            profileImage.toString(),
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      name.toString(),
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 24,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const Text(
                                      "You’re connection on Rainbow",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    SizedBox(
                                      height: 50,
                                      width: 50,
                                      child: ImageStack(
                                        imageList: [
                                          profileImage.toString(),
                                          (Get.find<ProfileController>()
                                                  .viewProfile
                                                  .data
                                                  ?.profileImage ??
                                              ''),
                                        ],
                                        totalCount: 2,
                                        // If larger than images.length, will show extra empty circle
                                        imageRadius: 25,
                                        // Radius of each images
                                        imageCount: 3,
                                        // Maximum number of images to be shown in stack
                                        imageBorderWidth: 1,
                                      ),
                                    ),
                                    box,
                                  ],
                                );
                              }

                              return box;
                            },
                            query: FirebaseFirestore.instance
                                .collection("chats")
                                .doc(roomId)
                                .collection(roomId!)
                                .orderBy("time", descending: true),
                            itemBuilderType: PaginateBuilderType.listView),
                      ),
                      Container(
                        height: 80,
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.6),
                        ),
                        child: GetBuilder<MessageController>(
                            id: "pic",
                            builder: (controller) {
                              return Row(
                                children: [
                                  InkWell(
                                    onTap: controller.navigateToCamera,
                                    child: Image.asset(
                                      AssetRes.shapeCamera,
                                      height: 16,
                                      width: 18.4,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  InkWell(
                                    onTap: controller.navigateToGallery,
                                    child: Image.asset(
                                      AssetRes.chatImage,
                                      height: 16,
                                      width: 18.4,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 0,
                                  ),
                                  Expanded(
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: Colors.white.withOpacity(0.4),
                                      ),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: TextFormField(
                                              controller:
                                                  controller.msController,
                                              style: const TextStyle(
                                                  color: Colors.black),
                                              decoration: InputDecoration(
                                                  hintText:
                                                      "Type your message...",
                                                  hintStyle: sfProTextReguler(
                                                      fontSize: 17,
                                                      color: ColorRes
                                                          .color_999999),
                                                  border: InputBorder.none),
                                            ),
                                          ),
                                          InkWell(
                                              onTap: () {
                                                if (controller.validation()) {
                                                  controller.sendMessage(
                                                      roomId.toString(),
                                                      otherUserUid,
                                                      userToken);
                                                  FocusScope.of(context)
                                                      .unfocus();
                                                }
                                              },
                                              child: Image.asset(
                                                AssetRes.chatSend,
                                                height: 16,
                                                width: 18.4,
                                              ))
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              );
                            }),
                      ),
                    ],
                  ),
                )
              : sendImage(controller);
        },
      ),
    );
  }

  Widget sendImage(MessageController controller) {
    return Obx(() {
      return Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: IconButton(
                  onPressed: messageController.back,
                  icon: const Icon(
                    Icons.cancel,
                    size: 40,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: Get.height / 1.4,
                width: Get.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: FileImage(messageController.image!),
                  fit: BoxFit.cover,
                )),
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: FloatingActionButton(
                    onPressed: () {
                      controller.imageSend(
                          otherUserUid.toString(), userToken.toString());
                    },
                    backgroundColor: ColorRes.color_4F359B,
                    child: const Icon(
                      Icons.send,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          controller.loader.isTrue ? const FullScreenLoader() : const SizedBox()
        ],
      );
    });
  }

  Widget alertBox(DateTime time) {
    return Center(
      child: Container(
        padding: const EdgeInsets.fromLTRB(15, 5, 15, 7),
        margin: const EdgeInsets.only(bottom: 10, top: 15),
        decoration: BoxDecoration(
          color: ColorRes.color_2F80ED.withOpacity(0.5),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          getAlertString(time),
          style: textStyleFont12.copyWith(
            color: ColorRes.bgColor1.withOpacity(0.78),
            fontSize: 10,
          ),
        ),
      ),
    );
  }
}

/*
GetBuilder<MessageController>(
        id: "chats",
        builder: (controller) {
          return (messageController.image == null)
              ?Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  ColorRes.color_50369C,
                  ColorRes.color_D18EEE,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              children: [
                Container(
                  height: 30,
                ),
                Container(
                  height: 96,
                  padding: const EdgeInsets.only(bottom: 10),
                  decoration:
                  BoxDecoration(color: Colors.white.withOpacity(0.6)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, bottom: 20),
                        child: InkWell(
                          onTap: () {
                            controller.msgController.clear();
                            Get.back();
                          },
                          child: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 29,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: ClipRRect(
                              borderRadius: const BorderRadius.all(Radius.circular(50)),
                              child: FadeInImage(
                                placeholder:
                                const AssetImage(AssetRes.portrait_placeholder),
                                image: NetworkImage(profileImage.toString()),
                                fit: BoxFit.cover,
                              )                     ,
                            ),
                          ),
                          /*   Container(
                            height: 50,
                            width: 50,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Colors.grey),
                          ),*/
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                name.toString(),
                                style: sfProTextReguler(
                                  fontSize: 17,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Connection",
                                style: sfProTextReguler(
                                    fontSize: 13,
                                    color:
                                    ColorRes.color_000000.withOpacity(0.5)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                controller.data == null
                    ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      name.toString(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w600),
                    ),
                    const Text(
                      "You’re connection on Rainbow",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: ImageStack(
                        imageList: const [
                          'https://www.google.com/search?q=profile+image&rlz=1C5CHFA_enIN999IN999&sxsrf=ALiCzsZvXZ7y5bj1eNTv8xHZTa4CVsYw4Q:1659178155367&tbm=isch&source=iu&ictx=1&vet=1&fir=QsatBu9zpFWl5M%252Cy7i4Swccn0rqpM%252C_%253BeHQKa74ZnnpTfM%252CSixlWtBpRVa7SM%252C_%253Bedem4rwzS1opXM%252Cb5C9ViMmmhpq-M%252C_%253BH6pHpB03ZEAgeM%252Cwg0CyFWNfK7o5M%252C_%253BnfkyptoYx2OzJM%252CFvQHUVZ-cx81xM%252C_%253BkEuHdfl2sp9d1M%252C-m0v_GLbqugcoM%252C_%253B-H_ExttvR7ahYM%252Cb5C9ViMmmhpq-M%252C_%253BvzXbYZ4nxFQ_JM%252Ct12EXnbCus7-DM%252C_%253Blcjtk8drNcGL8M%252COgWk3wP_2xVHMM%252C_%253BVT5qYdgyTZyr8M%252CSixlWtBpRVa7SM%252C_%253BD6gTFSDWaohX4M%252C9DRWIkHC4pkATM%252C_%253B4-QuSdqRU8BF_M%252CUL2sEtRo5j7P-M%252C_%253B-h20Jdis7Qx6mM%252C-m0v_GLbqugcoM%252C_%253B__-QXXUnC94QWM%252C1fZ7G0LIFjb7EM%252C_%253Bbr1AoC-ks5mzIM%252ClmqFVLnPa43AfM%252C_%253Bk9HuIjooyhqMwM%252CLIdqNVo-afJ0fM%252C_&usg=AI4_-kQdR3wYIdk7FQbASM6-C-NgNqCY7A&sa=X&ved=2ahUKEwjZgsekuKD5AhUDfN4KHUm3BUkQ9QF6BAgREAE#imgrc=H6pHpB03ZEAgeM',
                          'https://www.google.com/search?q=profile+image&rlz=1C5CHFA_enIN999IN999&sxsrf=ALiCzsZvXZ7y5bj1eNTv8xHZTa4CVsYw4Q:1659178155367&tbm=isch&source=iu&ictx=1&vet=1&fir=QsatBu9zpFWl5M%252Cy7i4Swccn0rqpM%252C_%253BeHQKa74ZnnpTfM%252CSixlWtBpRVa7SM%252C_%253Bedem4rwzS1opXM%252Cb5C9ViMmmhpq-M%252C_%253BH6pHpB03ZEAgeM%252Cwg0CyFWNfK7o5M%252C_%253BnfkyptoYx2OzJM%252CFvQHUVZ-cx81xM%252C_%253BkEuHdfl2sp9d1M%252C-m0v_GLbqugcoM%252C_%253B-H_ExttvR7ahYM%252Cb5C9ViMmmhpq-M%252C_%253BvzXbYZ4nxFQ_JM%252Ct12EXnbCus7-DM%252C_%253Blcjtk8drNcGL8M%252COgWk3wP_2xVHMM%252C_%253BVT5qYdgyTZyr8M%252CSixlWtBpRVa7SM%252C_%253BD6gTFSDWaohX4M%252C9DRWIkHC4pkATM%252C_%253B4-QuSdqRU8BF_M%252CUL2sEtRo5j7P-M%252C_%253B-h20Jdis7Qx6mM%252C-m0v_GLbqugcoM%252C_%253B__-QXXUnC94QWM%252C1fZ7G0LIFjb7EM%252C_%253Bbr1AoC-ks5mzIM%252ClmqFVLnPa43AfM%252C_%253Bk9HuIjooyhqMwM%252CLIdqNVo-afJ0fM%252C_&usg=AI4_-kQdR3wYIdk7FQbASM6-C-NgNqCY7A&sa=X&ved=2ahUKEwjZgsekuKD5AhUDfN4KHUm3BUkQ9QF6BAgUEAE#imgrc=nfkyptoYx2OzJM'
                        ],
                        totalCount: 2,
                        // If larger than images.length, will show extra empty circle
                        imageRadius: 25,
                        // Radius of each images
                        imageCount: 3,
                        // Maximum number of images to be shown in stack
                        imageBorderWidth: 1,
                      ),
                    )
                  ],
                )
                    : const SizedBox(),
                Expanded(
                  child: PaginateFirestore(
                      scrollController: controller.listScrollController,
                      isLive: true,
                      reverse: true,
                      itemBuilder: (context, docementSnapshot, index) {
                        controller.data =
                        docementSnapshot[index].data() as Map?;
                        return Row(
                          mainAxisAlignment:
                          controller.data!['senderUid'].toString() ==
                              userUid
                              ? MainAxisAlignment.end
                              : MainAxisAlignment.start,
                          children: [
                            // Text(controller.data['time'].toString(),style: sfProTextReguler(fontSize: 12,color:ColorRes.color_F0F0F0 ),),
                            const SizedBox(
                              width: 9,
                            ),
                            controller.data!['senderUid'].toString() == userUid
                                ? const SizedBox()
                                : Container(
                              margin: const EdgeInsets.only(top: 5),
                              height: 28,
                              width: 28,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey),
                            ),
                            const SizedBox(
                              width: 12,
                            ),

                            Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              padding: const EdgeInsets.all(10),
                              constraints: BoxConstraints(
                                maxWidth: Get.width / 1.3,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color:
                                controller.data['senderUid'].toString() ==
                                    userUid
                                    ? Colors.white
                                    : ColorRes.color_E9D224,
                              ),
                              child: Text(
                                controller.data['content'],
                                style: gilroyBoldTextStyle(
                                    fontSize: 17, color: Colors.black),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            controller.data!['senderUid'].toString() == userUid
                                ? Container(
                              margin: const EdgeInsets.only(top: 15),
                              child: Image.asset(
                                AssetRes.read,
                                color: Colors.white,
                                height: 16,
                                width: 16,
                              ),
                            )
                                : const SizedBox(),
                            const SizedBox(
                              width: 5,
                            )
                          ],
                        );
                      },
                      query: FirebaseFirestore.instance
                          .collection("chats")
                          .doc(roomId)
                          .collection(roomId!)
                          .orderBy("time", descending: true),
                      itemBuilderType: PaginateBuilderType.listView),
                ),
                Container(
                  height: 80,
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.6),
                  ),
                  child: GetBuilder<MessageController>(
                      id: "pic",
                      builder: (controller){
                        return Row(
                          children: [
                            InkWell(
                              onTap: controller.navigateToCamera,
                              child: Image.asset(
                                AssetRes.shapeCamera,
                                height: 16,
                                width: 18.4,
                              ),
                            ),

                            const SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: controller.navigateToGallery,
                              child: Image.asset(
                                AssetRes.chatImage,
                                height: 16,
                                width: 18.4,
                              ),
                            ),
                            const SizedBox(
                              width: 0,
                            ),
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.symmetric(horizontal: 20),
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.white.withOpacity(0.4),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        controller: controller.msController,
                                        style: const TextStyle(color: Colors.black),
                                        decoration: InputDecoration(
                                            hintText: "Type your message...",
                                            hintStyle: sfProTextReguler(
                                                fontSize: 17,
                                                color: ColorRes.color_999999),
                                            border: InputBorder.none),
                                      ),
                                    ),
                                    InkWell(
                                        onTap: () {
                                          controller.sendMessage(
                                              roomId.toString(), otherUserUid);
                                          FocusScope.of(context).unfocus();
                                        },
                                        child: Image.asset(
                                          AssetRes.chatSend,
                                          height: 16,
                                          width: 18.4,
                                        ))
                                  ],
                                ),
                              ),
                            )
                          ],
                        );
                      }),
                ),
              ],
            ),
          )
              :SendImage();
        },
      )
 */
