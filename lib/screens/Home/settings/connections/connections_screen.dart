import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/screens/Home/settings/connections/connections_controller.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/color_res.dart';
import 'package:rainbow/utils/strings.dart';

class ConnectionsScreen extends StatelessWidget {
  ConnectionsScreen({Key? key}) : super(key: key);
  ConnectionsController controller = Get.put(ConnectionsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
            children: [
              appBar(),
              Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                children: [listOfRequest(), listOfSuggestions()],
              ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Widget appBar() {
    return SizedBox(
      width: Get.width,
      child: Column(
        children: [
          SizedBox(
            height: Get.height * 0.03,
          ),
          Row(
            children: [
              SizedBox(
                width: Get.width * 0.05,
              ),
              GestureDetector(
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
              SizedBox(
                width: Get.width * 0.2,
              ),
              GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Text(
                    Strings.connectionRequest,
                    style: gilroyBoldTextStyle(),
                  )),
              SizedBox(
                width: Get.width * 0.05,
              ),
            ],
          ),
          SizedBox(
            height: Get.height * 0.04,
          ),
        ],
      ),
    );
  }

  Widget listOfRequest() {
    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: controller.connectionsRequest.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: Get.width * 0.07,
                      ),
                      Container(
                        height: 58.41,
                        width: 58.33,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage(AssetRes.se_profile))),
                      ),
                      SizedBox(
                        width: Get.width * 0.04,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Amber J Santiago",
                            style: textStyleFont16WhitLight,
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Text(
                            "SURROGATE MOM",
                            style: textStyleFont12White,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: Get.width * 0.07,
                      ),
                      const SizedBox(
                          height: 40,
                          width: 40,
                          child: Image(
                            image: AssetImage(AssetRes.profilep),
                            color: Colors.white,
                          )),
                      SizedBox(
                        width: Get.width * 0.04,
                      ),
                      const SizedBox(
                          height: 40,
                          width: 40,
                          child: Image(image: AssetImage(AssetRes.delete))),
                    ],
                  )
                ],
              ),
            );
          },
        )
      ],
    );
  }

  Widget listOfSuggestions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
              top: Get.height * 0.055, left: 20, bottom: Get.height * 0.02),
          child: Text(
            Strings.suggestedConnection,
            style: textStyleFont20W700,
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: controller.suggestionConnection.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: Get.width * 0.07,
                      ),
                      Container(
                        height: 58.41,
                        width: 58.33,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage(AssetRes.se_profile))),
                      ),
                      SizedBox(
                        width: Get.width * 0.04,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Amber J Santiago",
                            style: textStyleFont16WhitLight,
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Text(
                            "SURROGATE MOM",
                            style: textStyleFont12White,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: Get.width * 0.07,
                      ),
                      const SizedBox(
                          height: 40,
                          width: 40,
                          child: Image(
                            image: AssetImage(AssetRes.profilep),
                            color: Colors.white,
                          )),
                      SizedBox(
                        width: Get.width * 0.04,
                      ),
                      const SizedBox(
                          height: 40,
                          width: 40,
                          child: Image(image: AssetImage(AssetRes.delete))),
                    ],
                  )
                ],
              ),
            );
          },
        )
      ],
    );
  }
}
