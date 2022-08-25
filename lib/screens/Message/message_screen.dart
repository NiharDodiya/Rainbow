import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/common/draggableTile_screen.dart';
import 'package:rainbow/common/helper.dart';
import 'package:rainbow/screens/Message/message_controller.dart';
import 'package:rainbow/service/pref_services.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/color_res.dart';
import 'package:rainbow/utils/pref_keys.dart';

class MessageScreen extends StatelessWidget {
  MessageScreen({Key? key}) : super(key: key);
  MessageController messageController = Get.put(MessageController());

  @override
  Widget build(BuildContext context) {
    /* messageController.getChatUserId();*/
    messageController.getUid();
    return GetBuilder<MessageController>(
      id: "message",
      builder: (controller) {
        return SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50,
                child: Stack(
                  children: [
                    Center(
                      child: Text(
                        "Chats",
                        style: gilroyMediumTextStyle(fontSize: 18),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          )),
                    )
                  ],
                ),
              ),
              GetBuilder<MessageController>(
                id: "message",
                builder: (controller) {
                  return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                    stream: FirebaseFirestore.instance
                        .collection('chats')
                        .where("uidList", arrayContains: controller.userUid)
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData == false) {
                        return const SizedBox();
                      }
                      return Column(
                        children: [
                          GetBuilder<MessageController>(
                            id: "message",
                            builder: (controller) {
                              return Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                margin: const EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.search,
                                      color: Colors.grey,
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                        child: TextFormField(
                                      controller: controller.msgController,
                                      onChanged: (value) {
                                        controller.update(["message"]);
                                      },
                                      style:
                                          const TextStyle(color: Colors.black),
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Search",
                                          hintStyle: sfProTextReguler(
                                              fontSize: 17,
                                              color: ColorRes.color_8E8E93)),
                                    ))
                                  ],
                                ),
                              );
                            },
                          ),
                          /*  messageController.msgController.text.isEmpty
                              ?*/
                          snapshot.data!.docs.isEmpty
                              ? const SizedBox()
                              : Column(
                                  children: [
                                    const SizedBox(height: 20),
                                    SizedBox(
                                      width: Get.width,
                                      height: 80,
                                      child: ListView.builder(
                                          itemCount: snapshot.data!.docs.length,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            List<dynamic> idList = snapshot
                                                .data!.docs[index]
                                                .data()['uidList'];
                                            String userId = "";
                                            for (var value in idList) {
                                              if (value != controller.userUid) {
                                                userId = value;
                                              }
                                            }
                                            return StreamBuilder<
                                                DocumentSnapshot<
                                                    Map<String, dynamic>>>(
                                              stream: FirebaseFirestore.instance
                                                  .collection('users')
                                                  .doc(userId)
                                                  .snapshots(),
                                              builder: (context, snapshot2) {
                                                Map<String, dynamic>? data =
                                                    snapshot2.data?.data();
                                                if (data == null) {
                                                  return const SizedBox();
                                                }

                                                return /* snapshot.data!.docs[index]['uid'] ==
                                                  controller.userUid
                                              ? const SizedBox()
                                              : */
                                                    data['online'] == true
                                                        ? Column(
                                                            children: [
                                                              Stack(
                                                                children: [
                                                                  Container(
                                                                    margin: const EdgeInsets
                                                                            .symmetric(
                                                                        horizontal:
                                                                            10),
                                                                    height: 50,
                                                                    width: 50,
                                                                    decoration:
                                                                        const BoxDecoration(
                                                                      shape: BoxShape
                                                                          .circle,
                                                                    ),
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius: const BorderRadius
                                                                              .all(
                                                                          Radius.circular(
                                                                              50)),
                                                                      child:
                                                                          FadeInImage(
                                                                        placeholder:
                                                                            const AssetImage(AssetRes.portrait_placeholder),
                                                                        image: NetworkImage(
                                                                            data['image'].toString()),
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Positioned(
                                                                      top: Get.height *
                                                                          0.05,
                                                                      right: 12,
                                                                      child: Image
                                                                          .asset(
                                                                        AssetRes
                                                                            .oval,
                                                                        height:
                                                                            12,
                                                                        width:
                                                                            12,
                                                                      ))
                                                                ],
                                                              ),
                                                              const SizedBox(
                                                                height: 10,
                                                              ),
                                                              Text(data['name'])
                                                            ],
                                                          )
                                                        : const SizedBox();
                                              },
                                            );
                                          }),
                                    ),
                                  ],
                                )
                          /*  : const SizedBox(
                                  child: Text("user SearchFiled"),
                                )*/
                          ,
                        ],
                      );
                    },
                  );
                },
              ),
              controller.msgController.text.isEmpty
                  ? GetBuilder<MessageController>(
                      id: "message",
                      builder: (controller) {
                        return StreamBuilder<
                            QuerySnapshot<Map<String, dynamic>>>(
                          stream: FirebaseFirestore.instance
                              .collection('chats')
                              .where("uidList",
                                  arrayContains: controller.userUid)
                              .orderBy("lastMessageTime", descending: true)
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData == false) {
                              return const SizedBox();
                            }
                            return SizedBox(
                              height: Get.height * 0.53,
                              child: ListView.builder(
                                  itemCount: snapshot.data!.docs.length,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    List<String> idList = (snapshot
                                                .data!.docs[index]
                                                .data()['uidList'] ??
                                            [])
                                        .map<String>((e) => e.toString())
                                        .toList();
                                    Map<String, dynamic> docData =
                                        snapshot.data!.docs[index].data();
                                    String userId = "";
                                    for (var value in idList) {
                                      if (value != controller.userUid) {
                                        userId = value;
                                      }
                                    }
                                    if (userId.isEmpty) {
                                      return const SizedBox();
                                    }
                                    print("@@@@@ => $userId");
                                    return StreamBuilder<
                                        DocumentSnapshot<Map<String, dynamic>>>(
                                      stream: FirebaseFirestore.instance
                                          .collection('users')
                                          .doc(userId)
                                          .snapshots(),
                                      builder: (context, snapshot2) {
                                        Map<String, dynamic>? data =
                                            snapshot2.data?.data();
                                        if (data == null) {
                                          return const SizedBox();
                                        }
                                        return DraggableTile(
                                          child: InkWell(
                                            onTap: () {
                                              controller.gotoChatScreen(
                                                  data['uid'],
                                                  data['name'],
                                                  data['image']);
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10),
                                              child: Row(
                                                children: [
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                  Container(
                                                    margin: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 10),
                                                    height: 60,
                                                    width: 60,
                                                    decoration:
                                                        const BoxDecoration(
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          const BorderRadius
                                                                  .all(
                                                              Radius.circular(
                                                                  50)),
                                                      child: FadeInImage(
                                                        placeholder:
                                                            const AssetImage(
                                                                AssetRes
                                                                    .portrait_placeholder),
                                                        image: NetworkImage(
                                                            data['image']
                                                                .toString()),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      data['name']
                                                              .toString()
                                                              .isEmpty
                                                          ? const SizedBox()
                                                          : Text(
                                                              data['name']
                                                                  .toString(),
                                                              style:
                                                                  sfProTextReguler(
                                                                      fontSize:
                                                                          17),
                                                            ),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            "${docData['lastMessageSender'] == PrefService.getString(PrefKeys.uid) ? "You:" : ""}${docData['lastMessage']}",
                                                            style: sfProTextReguler(
                                                                fontSize: 14,
                                                                color: ColorRes
                                                                    .color_F0F0F0),
                                                          ),
                                                          Text(
                                                            " · ${getFormattedTime(docData['lastMessageTime'].toDate())}",
                                                            style: sfProTextReguler(
                                                                fontSize: 14,
                                                                color: ColorRes
                                                                    .color_F0F0F0),
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                  const Spacer(),
                                                  Image.asset(
                                                    AssetRes.read,
                                                    height: 16,
                                                    width: 16,
                                                  ),
                                                  const SizedBox(
                                                    width: 15,
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  }),
                            );
                          },
                        );
                      },
                    )
                  : GetBuilder<MessageController>(
                      id: "message",
                      builder: (controller) {
                        return StreamBuilder<
                            QuerySnapshot<Map<String, dynamic>>>(
                          stream: FirebaseFirestore.instance
                              .collection('users')
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData == false) {
                              return const SizedBox();
                            }
                            return SizedBox(
                              height: Get.height * 0.53,
                              child: ListView.builder(
                                  itemCount: snapshot.data!.docs.length,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return snapshot.data!.docs[index]
                                                .data()['uid'] ==
                                            controller.userUid
                                        ? const SizedBox()
                                        : (snapshot.data!.docs[index]
                                                    .data()['email']
                                                    .toString()
                                                    .trim()
                                                    .toString()
                                                    .toLowerCase()
                                                    .contains(controller
                                                        .msgController.text)) ||
                                                (snapshot.data!.docs[index]
                                                    .data()['name']
                                                    .toString()
                                                    .trim()
                                                    .toString()
                                                    .toLowerCase()
                                                    .contains(controller
                                                        .msgController.text))
                                            ? DraggableTile(
                                                child: InkWell(
                                                  onTap: () {
                                                    controller.gotoChatScreen(
                                                        snapshot
                                                            .data!.docs[index]
                                                            .data()['uid'],
                                                        snapshot
                                                            .data!.docs[index]
                                                            .data()['name'],
                                                        snapshot
                                                            .data!.docs[index]
                                                            .data()['image']);
                                                  },
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        vertical: 10),
                                                    child: Row(
                                                      children: [
                                                        const SizedBox(
                                                          width: 5,
                                                        ),
                                                        Container(
                                                          margin:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      10),
                                                          height: 60,
                                                          width: 60,
                                                          decoration:
                                                              const BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                const BorderRadius
                                                                        .all(
                                                                    Radius
                                                                        .circular(
                                                                            50)),
                                                            child: FadeInImage(
                                                              placeholder:
                                                                  const AssetImage(
                                                                      AssetRes
                                                                          .portrait_placeholder),
                                                              image: NetworkImage(
                                                                  snapshot
                                                                      .data!
                                                                      .docs[
                                                                          index]
                                                                      .data()[
                                                                          'image']
                                                                      .toString()),
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 5,
                                                        ),
                                                        Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            snapshot.data!
                                                                    .docs[index]
                                                                    .data()[
                                                                        'name']
                                                                    .toString()
                                                                    .isEmpty
                                                                ? const SizedBox()
                                                                : Text(
                                                                    snapshot
                                                                        .data!
                                                                        .docs[
                                                                            index]
                                                                        .data()[
                                                                            'name']
                                                                        .toString(),
                                                                    style: sfProTextReguler(
                                                                        fontSize:
                                                                            17),
                                                                  ),
                                                            /*Text(
                                              "You:ok",
                                              style: sfProTextReguler(
                                                  fontSize: 14,
                                                  color: ColorRes
                                                      .color_F0F0F0),
                                            )*/
                                                          ],
                                                        ),
                                                        const Spacer(),
                                                        Image.asset(
                                                          AssetRes.read,
                                                          height: 16,
                                                          width: 16,
                                                        ),
                                                        const SizedBox(
                                                          width: 15,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              )
                                            : const SizedBox();
                                  }),
                            );
                          },
                        );
                      },
                    ),
            ],
          ),
        );
      },
    );
  }
}
