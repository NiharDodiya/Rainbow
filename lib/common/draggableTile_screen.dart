import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/screens/Message/message_controller.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/color_res.dart';
import 'package:rainbow/utils/font_res.dart';
import 'package:rainbow/utils/strings.dart';

class DraggableTile extends StatefulWidget {
  final Widget child;

  const DraggableTile({Key? key, required this.child}) : super(key: key);

  @override
  State<DraggableTile> createState() => _DraggableTileState();
}

class _DraggableTileState extends State<DraggableTile> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MessageController>(
      id: "message",
      builder: (controller) {
        return SizedBox(
          height: 76,
          /*  width: Get.width,*/
          child: ListView(
            scrollDirection: Axis.horizontal,
            controller: scrollController,
            children: [
              GestureDetector(
                onPanUpdate: (details) {
                  // Swiping in right direction.
                  if (details.delta.dx > 0) {
                    scrollController.animateTo(
                      scrollController.position.maxScrollExtent,
                      duration: 500.milliseconds,
                      curve: Curves.linear,
                    );
                  }

                  // Swiping in left direction.
                  if (details.delta.dx < 0) {
                    scrollController.animateTo(
                      0,
                      duration: 500.milliseconds,
                      curve: Curves.linear,
                    );
                  }
                },
                child: SizedBox(
                  height: 76,
                  width: Get.width,
                  child: widget.child,
                ),
              ),
              InkWell(
                  onTap: () {
                    alertBoxPopUpBlock(context);
                  },
                  child: Image.asset(
                    AssetRes.hold,
                    height: 76,
                  )),
              InkWell(
                  onTap: () {
                    alertBoxPopUpDel(context, controller);
                  },
                  child: Image.asset(AssetRes.deleteChat, height: 76)),
            ],
          ),
        );
      },
    );
  }

  Future alertBoxPopUpDel(BuildContext context, MessageController controller) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Container(
          color: Colors.black.withOpacity(0.8),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 0.1, sigmaY: 0.1),
            child: AlertDialog(
              backgroundColor: ColorRes.color_F2F2F2,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              actions: [
                SizedBox(
                  width: 270,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Column(
                      children: [
                        SizedBox(
                          height: Get.height * 0.015,
                        ),
                        Center(
                          child: Text(
                            Strings.delete,
                            style: gilroyBoldTextStyle(
                                color: Colors.black, fontSize: 17),
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.05755,
                          width: Get.width * 0.74,
                          child: const Center(
                            child: Text(
                              Strings.deleteConversation,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                                fontFamily: FontRes.sFProText,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.01,
                        ),
                        const Divider(
                          thickness: 1,
                          color: ColorRes.color_B1B1B3,
                        ),
                        SizedBox(
                          height: Get.height * 0.005,
                        ),
                        Center(
                          child: InkWell(
                            onTap: () {
                              controller.deleteUserChat();
                            },
                            child: const SizedBox(
                                height: 22,
                                width: 65,
                                child: Text(
                                  Strings.confirm,
                                  style: TextStyle(
                                    color: ColorRes.color_007AFF,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 17,
                                    fontFamily: FontRes.sFProText,
                                  ),
                                )),
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.015,
                        ),
                        const Divider(
                          thickness: 1,
                          color: ColorRes.color_B1B1B3,
                        ),
                        SizedBox(
                          height: Get.height * 0.005,
                        ),
                        Center(
                          child: InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: SizedBox(
                              height: 22,
                              width: 65,
                              child: Text(
                                Strings.cancelSmall,
                                style: sfProTextReguler(
                                    color: ColorRes.color_007AFF, fontSize: 17),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Future alertBoxPopUpBlock(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Container(
          color: Colors.black.withOpacity(0.8),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 0.1, sigmaY: 0.1),
            child: AlertDialog(
              backgroundColor: ColorRes.color_F2F2F2,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              actions: [
                SizedBox(
                  width: 270,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Column(
                      children: [
                        SizedBox(
                          height: Get.height * 0.015,
                        ),
                        Center(
                          child: Text(
                            Strings.block,
                            style: gilroyBoldTextStyle(
                                color: Colors.black, fontSize: 17),
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.05755,
                          width: Get.width * 0.74,
                          child: const Center(
                            child: Text(
                              Strings.blockPerson,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                                fontFamily: FontRes.sFProText,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.01,
                        ),
                        const Divider(
                          thickness: 1,
                          color: ColorRes.color_B1B1B3,
                        ),
                        SizedBox(
                          height: Get.height * 0.005,
                        ),
                        const Center(
                          child: SizedBox(
                              height: 22,
                              width: 65,
                              child: Text(
                                Strings.confirm,
                                style: TextStyle(
                                  color: ColorRes.color_007AFF,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 17,
                                  fontFamily: FontRes.sFProText,
                                ),
                              )),
                        ),
                        SizedBox(
                          height: Get.height * 0.015,
                        ),
                        const Divider(
                          thickness: 1,
                          color: ColorRes.color_B1B1B3,
                        ),
                        SizedBox(
                          height: Get.height * 0.005,
                        ),
                        Center(
                          child: InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: SizedBox(
                              height: 22,
                              width: 65,
                              child: Text(
                                Strings.cancelSmall,
                                style: sfProTextReguler(
                                    color: ColorRes.color_007AFF, fontSize: 17),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
