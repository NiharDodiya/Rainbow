import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/screens/Message/message_controller.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/color_res.dart';

class MessageScreen extends StatelessWidget {
  MessageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
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
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search",
                    hintStyle: sfProTextReguler(
                        fontSize: 17, color: ColorRes.color_8E8E93)),
              ))
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        GetBuilder<MessageController>(
          id: "message",
          builder: (controller) {
            return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream:
                  FirebaseFirestore.instance.collection('users').snapshots(),
              builder: (context, snapshot) {
                return SizedBox(
                  width: Get.width,
                  height: 80,
                  child: ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return snapshot.data!.docs[index]['uid'] ==
                                controller.userUid
                            ? const SizedBox()
                            : snapshot.data!.docs[index]['online'] == true
                                ? Column(
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            height: 50,
                                            width: 50,
                                            decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.grey),
                                            child: const Center(
                                              child: Icon(Icons.person),
                                            ),
                                          ),
                                          Positioned(
                                              top: Get.height * 0.05,
                                              right: 12,
                                              child: Image.asset(
                                                AssetRes.oval,
                                                height: 12,
                                                width: 12,
                                              ))
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Text("Name")
                                    ],
                                  )
                                : const SizedBox();
                      }),
                );
              },
            );
          },
        ),
        GetBuilder<MessageController>(
          id: "message",
          builder: (controller) {
            return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream:
                  FirebaseFirestore.instance.collection('users').snapshots(),
              builder: (context, snapshot) {
                return SizedBox(
                  height: Get.height *0.53,
                  child: ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext context, int index) {
                          return   snapshot.data!.docs[index]['uid'] ==
                              controller.userUid
                              ? const SizedBox()
                              : InkWell(
                            onTap: () {
                              controller.gotoChatScreen(
                                  snapshot.data!.docs[index]['uid'],
                                  snapshot.data!.docs[index]
                                  ['email']);
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10),
                              child: Dismissible(
                                key: ValueKey<int>(index),
                                direction:
                                DismissDirection.endToStart,
                                onDismissed: (direction) {
                                  if (direction ==
                                      DismissDirection.startToEnd) {}
                                },
                                child: Row(
                                  children: [
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      margin:
                                      const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      height: 60,
                                      width: 60,
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.grey),
                                      child: const Center(
                                        child: Icon(Icons.person),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${snapshot.data!.docs[index]['email'].toString()}",
                                          style: sfProTextReguler(
                                              fontSize: 17),
                                        ),
                                        Text(
                                          "You:ok",
                                          style: sfProTextReguler(
                                              fontSize: 14,
                                              color: ColorRes
                                                  .color_F0F0F0),
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
                      }),
                );
              },
            );
          },
        )
      ],
    );
  }
}
