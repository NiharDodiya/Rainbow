import 'package:flutter/material.dart';
import 'package:flutter_mentions/flutter_mentions.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/screens/Home/addStroy/addStory_controller.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/color_res.dart';
import 'package:rainbow/utils/strings.dart';

class AddStoryViewScreen extends StatelessWidget {
  AddStoryViewScreen({Key? key}) : super(key: key);
  AddStoryController controller = Get.put(AddStoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<AddStoryController>(
        id: "adStory",
        builder: (controller) {
          return SafeArea(
            child: Stack(
              children: [
                Image.file(
                  controller.image!,
                  height: Get.height,
                  width: Get.width,
                  fit: BoxFit.cover,
                ),
                Container(
                  height: Get.height,
                  width: Get.width,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        ColorRes.color_141414.withOpacity(0.9),
                        Colors.transparent,
                        Colors.transparent
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      stops: const [0, 0.8, 1],
                    ),
                  ),
                ),
                Positioned(
                  top: Get.height * 0.032,
                  left: 15,
                  child: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: ColorRes.color_606060),
                      child: Center(
                        child: Image.asset(
                          AssetRes.backIcon,
                          height: 16,
                          width: 10,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: Get.height * 0.032,
                  left: Get.width * 0.8,
                  child: InkWell(
                    onTap: () {
                      // Get.back();
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: ColorRes.color_606060),
                      child: Center(
                        child: Text(
                          Strings.aA,
                          style: gilroyMediumTextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: Get.height * 0.85,
                  left: Get.width * 0.08,
                  child: InkWell(
                    onTap: () {
                      controller.onStoryPost(
                          des: controller
                              .key.currentState!.controller!.markupText
                              .toString());
                    },
                    child: Container(
                      height: Get.height * 0.07389,
                      width: Get.width * 0.8,
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              ColorRes.color_FFEC5C,
                              ColorRes.color_DFC60B
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                        child: Text(
                          Strings.postToStories,
                          style: gilroyMediumTextStyle(
                              fontSize: 15, color: ColorRes.black),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height * 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FlutterMentions(
                        key: controller.key,
                        suggestionPosition: SuggestionPosition.Top,
                        maxLines: 5,
                        minLines: 1,
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.only(left: 15),
                            hintText: 'Write Text',
                            border: InputBorder.none),
                        mentions: [
                          Mention(
                              trigger: '@',
                              style: const TextStyle(
                                  color: Colors.blue,
                                  decoration: TextDecoration.none),
                              data: [
                                {
                                  'id': '61as61fsa',
                                  'display': 'marion congrats new mom!',
                                  'full_name': 'Fayeed Pawaskar',
                                  'photo':
                                      'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'
                                },
                                {
                                  'id': '61asasgasgsag6a',
                                  'display': 'marion congrats new mom!',
                                  'full_name': 'DJ Khaled',
                                  'style': const TextStyle(color: Colors.blue),
                                  'photo':
                                      'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'
                                },
                              ],
                              matchAll: false,
                              suggestionBuilder: (data) {
                                return Container(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    children: <Widget>[
                                      CircleAvatar(
                                        backgroundImage: NetworkImage(
                                          data['photo'],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20.0,
                                      ),
                                      Column(
                                        children: <Widget>[
                                          Text(
                                            data['full_name'],
                                            style: const TextStyle(
                                                color: Colors.black),
                                          ),
                                          Text('@${data['display']}',
                                              style: const TextStyle(
                                                  color: Colors.black)),
                                        ],
                                      )
                                    ],
                                  ),
                                );
                              }),
                          Mention(
                            trigger: '#',
                            disableMarkup: true,
                            style: const TextStyle(
                              color: Colors.blue,
                            ),
                            data: [
                              {
                                'id': 'reactjs',
                                'display': 'marion congrats new mom!'
                              },
                              {
                                'id': 'javascript',
                                'display': 'marion congrats new mom!'
                              },
                            ],
                            matchAll: true,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
