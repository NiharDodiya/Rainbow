import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/screens/Search/search_controller.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/color_res.dart';
import 'package:rainbow/utils/strings.dart';

class SearchScreen extends StatelessWidget {
  SearchController controller = Get.put(SearchController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchController>(
      id: "Search",
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(children: [
              appBar(),
              textField(),
              const SizedBox(
                height: 15,
              ),
              profile()
            ]),
          ),
        );
      },
    );
  }

  Widget appBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      actions: [
        Row(
          children: [
            Text(
              Strings.search,
              style: textStyleFont20W700Black,
            ),
            SizedBox(
              width: Get.width * 0.47,
            ),
            Text(
              Strings.advancedSearch,
              style: textStyleFont12Grey,
            ),
            SizedBox(
              width: Get.width * 0.05,
            ),
          ],
        )
      ],
    );
  }

  Widget textField() {
    return Container(
      height: 56,
      width: Get.width * 0.9066,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ColorRes.color_9597A1.withOpacity(0.1)),
      child: InkWell(
          onTap: () {},
          child: Row(
            children: [
              SizedBox(
                width: Get.width * 0.04,
              ),
              const Image(
                image: AssetImage(AssetRes.search),
                color: Colors.black,
                height: 16,
                width: 16,
              ),
              SizedBox(
                width: Get.width * 0.03,
              ),
              SizedBox(
                height: 56,
                width: Get.width * 0.7,
                child: TextField(
                  controller: controller.searchBar,
                  obscureText: false,
                  style: textFieldText,
                  minLines: 1,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(top: 6),
                    border: InputBorder.none,
                    hintStyle: textStyleFont16Grey,
                    hintText: Strings.discoverOtherConnections,
                    /*   filled: true,
                        fillColor: ColorRes.color_9597A1.withOpacity(0.1)*/
                  ),
                ),
              ),
            ],
          )),
    );
  }

  Widget profile() {
    return Container(
      width: Get.width,
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
          ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.only(top: 16),
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        height: 232,
                        width: Get.width * 0.90133,
                        child: const Image(image: AssetImage(AssetRes.woman)),
                      ),
                      Positioned(
                        top: Get.height * 0.03,
                        left: Get.width * 0.05,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 3),
                          ),
                          child: const Image(image: AssetImage(AssetRes.se)),
                        ),
                      ),
                      Container(
                          height: 232,
                          width: Get.width * 0.90133,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: LinearGradient(
                              colors: [
                                ColorRes.color_141414.withOpacity(0.1),
                                ColorRes.color_141414.withOpacity(0.1),
                                ColorRes.color_141414.withOpacity(0.5),
                                ColorRes.color_141414.withOpacity(0.8),
                                ColorRes.color_141414
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          )),
                      Positioned(
                          top: Get.height * 0.255,
                          left: 15,
                          child: Text(
                            "Sallie Wilson",
                            style: textStyleFont14WhiteBold,
                          )),
                      Positioned(
                          top: Get.height * 0.28,
                          left: 15,
                          child: Text(
                            "Surrogate Mom",
                            style: textStyleFont12White400,
                          )),
                      Positioned(
                          top: Get.height * 0.04,
                          left: Get.width * 0.8,
                          child: GestureDetector(
                              onTap: () {
                                controller.onTapConnect();
                              },
                              child: const Icon(Icons.more_horiz))),
                     controller.connect.isTrue? Positioned(
                        top: Get.height * 0.07,
                        left: Get.width * 0.58,
                        child: Container(
                          height: 69,
                          width: 105,
                          color: ColorRes.color_50369C.withOpacity(0.45),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Image.asset(
                                    AssetRes.profilep,
                                    height: 22,
                                    width: 22,
                                    color: ColorRes.color_FFB2B2,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    Strings.connect,
                                    style: textStyleFont12WhiteBold,
                                  )
                                ],
                              ),
                              const Divider(
                                thickness: 1.5,
                                color: Colors.white,
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Image.asset(
                                    AssetRes.block,
                                    height: 22,
                                    width: 22,
                                    color: ColorRes.color_FFB2B2,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    Strings.block,
                                    style: textStyleFont12WhiteBold,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ):const SizedBox()
                    ],
                  ),
                  SizedBox(
                    height: Get.height * 0.026,
                  ),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
