import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/buttons.dart';
import 'package:rainbow/common/Widget/loaders.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/common/popup.dart';
import 'package:rainbow/screens/Profile/profile_controller.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/color_res.dart';
import 'package:rainbow/utils/strings.dart';

class PostTestimonialScreen extends StatelessWidget {
  final String? id;

  const PostTestimonialScreen({Key? key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ProfileController>(
        id: "testimonials",
        builder: (controller) {
          return Obx(() {
            return Stack(
              children: [
                Container(
                  height: Get.height,
                  width: Get.width,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        ColorRes.color_50369C,
                        ColorRes.colorD18EEE,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 45,
                        ),
                        appBar(),
                        const SizedBox(
                          height: 38,
                        ),
                        textField(context)
                      ],
                    ),
                  ),
                ),
                controller.loaderTestimonials.isTrue
                    ? const FullScreenLoader()
                    : const SizedBox()
              ],
            );
          });
        },
      ),
    );
  }

  Widget appBar() {
    return Row(
      children: [
        const SizedBox(
          width: 20,
        ),
        InkWell(
          onTap: () {
            Get.back();
          },
          child: Container(
            padding: const EdgeInsets.all(7),
            height: 30,
            width: 30,
            child: Image.asset(
              AssetRes.backIcon,
              height: 15,
            ),
          ),
        ),
        SizedBox(
          width: Get.width * 0.17,
        ),
        Text(
          "Post a Testimonial",
          style: gilroyBoldTextStyle(fontSize: 18),
        )
      ],
    );
  }

  Widget textField(BuildContext context) {
    return GetBuilder<ProfileController>(
      id: "testimonials",
      builder: (controller) {
        return Column(
          children: [
            Container(
              height: 326,
              width: Get.width * 0.85,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: ColorRes.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                maxLines: 7,
                controller: controller.postTestimonials,
                style: gilroyBoldTextStyle(fontSize: 18, color: Colors.black),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(top: 0),
                  border: InputBorder.none,
                  hintStyle: gilroyMediumTextStyle(
                      fontSize: 18, color: ColorRes.black.withOpacity(0.3)),
                  hintText: "What do you want to say about Amber Davis",
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SubmitButton(
              text: Strings.post,
              onTap: () {
                FocusScopeNode currentfocus = FocusScope.of(context);
                if (!currentfocus.hasPrimaryFocus) {
                  currentfocus.unfocus();
                }

                if (controller.postTestimonials.text == "") {
                  errorToast("Testimonials field is empty");
                } else {
                  controller.postTestimonialsApi(id.toString(), context);
                  Get.back();
                }
              },
            )
          ],
        );
      },
    );
  }
}
