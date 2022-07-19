import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/screens/Home/settings/connections/connections_controller.dart';
import 'package:rainbow/screens/Home/settings/connections/connections_screen.dart';
import 'package:rainbow/screens/Search/advance_search/advance_search_controller.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/color_res.dart';
import 'package:rainbow/utils/strings.dart';

class AdvanceSearchScreen extends StatelessWidget {
  final String title;

  AdvanceSearchScreen({Key? key, required this.title}) : super(key: key);
  AdvanceSearchController advanceSearchController =
  Get.put(AdvanceSearchController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<AdvanceSearchController>(
        id: "advancedSearch",
        builder: (controller) {
          return SingleChildScrollView(
            child: SafeArea(
              child: Container(
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                    appBar(title: title),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 45,
                  width: Get.width,
                  padding: const EdgeInsets.only(
                    left: 36,
                    right: 36,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 45,
                          decoration: const BoxDecoration(
                            color: ColorRes.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
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
                              Expanded(
                                child: SizedBox(
                                  height: 56,
                                  child: TextField(
                                    obscureText: false,
                                    style: textFieldText,
                                    minLines: 1,
                                    decoration: InputDecoration(
                                      contentPadding:
                                      const EdgeInsets.only(),
                                      border: InputBorder.none,
                                      hintStyle: textStyleFont16Grey,
                                      hintText: Strings.enterLocation,
                                      /*   filled: true,
                              fillColor: ColorRes.color_9597A1.withOpacity(0.1)*/
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 45,
                        width: 45,
                        margin: const EdgeInsets.only(left: 9),
                        padding: const EdgeInsets.all(15),
                        decoration: const BoxDecoration(
                          color: ColorRes.black,
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        child: Image.asset(
                          AssetRes.filterIcon,
                          height: 15,
                          width: 15,
                        ),
                      )
                    ],
                  ),
                ),
                Image.asset(
                  AssetRes.searchBackground,
                  height: 400,
                  width: 400,
                ),
                      Container(
                        width: Get.width,
                        height: 247,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                topRight: Radius.circular(12))),
                        child: ListView.builder(
                          itemCount: controller.imageList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(15),
                              child: Row(
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: AssetImage(
                                                controller.imageList[index]
                                                    .toString()))),
                                  ),
                                  
                                ],
                              ),
                            );
                          },
                        ),
                      ),

              ],
            ),
          ),)
          ,
          );
        },
      ),
    );
  }

  Widget appBar({String? title}) {
    return SizedBox(
      width: Get.width,
      child: Column(
        children: [
          SizedBox(
            height: Get.height * 0.03,
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Image.asset(
                    AssetRes.backIcon,
                    height: 16,
                    width: 16,
                    color: Colors.white,
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      title ?? "Advance Search",
                      style: gilroyBoldTextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  ConnectionsController connectionController =
                  Get.put(ConnectionsController());
                  connectionController.init();
                  Get.to(() => ConnectionsScreen());
                },
                child: Stack(
                  children: [
                    const SizedBox(
                      height: 30,
                      width: 30,
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      child: SizedBox(
                        height: 24,
                        width: 24,
                        child: Image.asset(AssetRes.notificationIcon),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                        height: 16,
                        width: 16,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: ColorRes.color_FF6B97),
                        child: const Text(
                          "0",
                          style: TextStyle(
                            color: ColorRes.white,
                            fontSize: 8,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 10,
              )
            ],
          ),
        ],
      ),
    );
  }

}
