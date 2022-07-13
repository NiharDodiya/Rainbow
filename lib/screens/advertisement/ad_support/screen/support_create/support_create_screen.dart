import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/screens/advertisement/ad_support/screen/support_create/support_create_controller.dart';
import '../../../../../common/Widget/buttons.dart';
import '../../../../../common/Widget/text_styles.dart';
import '../../../../../utils/asset_res.dart';
import '../../../../../utils/color_res.dart';
import '../../../../../utils/strings.dart';

class SupportcreateScreen extends StatelessWidget {
  const SupportcreateScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: Get.width,
          height: Get.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                ColorRes.color_50369C,
                ColorRes.color_50369C,
                ColorRes.color_D18EEE,
                ColorRes.color_D18EEE,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: Get.height * 0.035,
              ),
              appBar(),
              body(),
            ],
          ),
        ),
      ),
    );
  }

  Widget body() {
    SupportCreateController controller = Get.put(SupportCreateController());
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width * 0.08),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Strings.subject,
                style: gilroySemiBoldTextStyle(fontSize: 14),
              ),
              SizedBox(
                height: Get.height * 0.005,
              ),
              Container(
                height: 50,
                width: Get.width * 0.89333,
                padding: const EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  color: ColorRes.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  onChanged: (value) {},
                  controller: controller.subjectController,
                  style: textFieldText,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(top: 0),
                    border: InputBorder.none,
                    hintStyle: gilroyMediumTextStyle(
                        fontSize: 18, color: ColorRes.black.withOpacity(0.3)),
                    hintText: Strings.writesomethinghere,
                  ),
                ),
              ),
              SizedBox(
                height: Get.height * 0.018472,
              ),
              Text(
                Strings.yourMessage,
                style: gilroySemiBoldTextStyle(fontSize: 14),
              ),
              SizedBox(
                height: Get.height * 0.005,
              ),
              Container(
                height: Get.height * 0.29679,
                width: Get.width * 0.89333,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: ColorRes.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  onChanged: (value) {},
                  maxLines: 7,
                  controller: controller.yourMsgController,
                  style: textFieldText,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(top: 0),
                    border: InputBorder.none,
                    hintStyle: gilroyMediumTextStyle(
                        fontSize: 18, color: ColorRes.black.withOpacity(0.3)),
                    hintText: Strings.writesomethinghere,
                  ),
                ),
              ),
              SizedBox(
                height: Get.height * 0.01477,
              ),
              Center(
                child: SizedBox(
                  height: Get.height * 0.0474,
                  child: InkWell(
                      onTap: () {
                        controller.navigateToCamera();
                      },
                      child: Image.asset(AssetRes.cameraPic)),
                ),
              ),
              SizedBox(
                height: Get.height * 0.0190,
              ),
              Center(
                child: Text(
                  "Attach images or proof",
                  style: gilroyMediumTextStyle(fontSize: 14),
                ),
              ),
              SizedBox(
                height: Get.height * 0.05,
              ),
              SubmitButton(
                onTap: () {
                  controller.valid();
                },
                child: Text(
                  "Send Message",
                  style: gilroyBoldTextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
              SizedBox(
                height: Get.height * 0.05,
              ),
            ],
          ),
        ),
      ),
    );
  }
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
              width: Get.width * 0.32,
            ),
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Text(
                Strings.support,
                style: gilroyBoldTextStyle(),
              ),
            ),
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
