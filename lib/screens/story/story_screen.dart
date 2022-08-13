/*
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/screens/story/story_controller.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/color_res.dart';

class StoryScreen extends StatelessWidget {
  StoryController controller = Get.put(StoryController());

  StoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StoryController>(
      id: "story",
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: SafeArea(
            child: Container(
              height: Get.height * 0.88,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  PageView(
                    onPageChanged: controller.onChanged,
                    controller: controller.pageController,
                    children: <Widget>[
                      animation(),
                      animation(),
                      animation(),
                      animation(),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: Get.height * 0.858),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: _buildIndicator(controller),
                    ),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                SizedBox(
                    height: Get.height * 0.07,
                    width: Get.width * 0.7,
                    child: TextFormField(
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(left: 15),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          hintStyle: const TextStyle(fontSize: 14),
                          hintText: "Send message"),
                    )),
                SizedBox(
                  width: Get.width * 0.04,
                ),
                const SizedBox(
                    height: 20,
                    width: 20,
                    child: Image(
                      image: AssetImage(AssetRes.heart),
                      color: Colors.white,
                    )),
                SizedBox(
                  width: Get.width * 0.05,
                ),
                const SizedBox(
                    height: 20,
                    width: 20,
                    child: Image(image: AssetImage(AssetRes.sendInsta))),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 2,
      width: Get.width * 0.2,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: isActive ? ColorRes.color_4F359B : ColorRes.color_656F85,
      ),
    );
  }

  List<Widget> _buildIndicator(StoryController controller) {
    List<Widget> indicators = [];
    for (int i = 0; i < 4; i++) {
      if (controller.currentIndex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }

    return indicators;
  }

  Widget animation() {
    return Container(
      height: 200,
      width: Get.width,
      decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(AssetRes.backGround))),
    );
  }
}
*/
