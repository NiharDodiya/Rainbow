import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/screens/Profile/widget/edit_profile/edit_profile_contoller.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/color_res.dart';
import 'package:rainbow/utils/strings.dart';

class HeightScreen extends StatelessWidget {
  const HeightScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<EditProfileController>(
        id: "Edit_profile",
        builder: (controller) {
          return SafeArea(
            child: Center(
              child: Container(
                height: Get.height,
                width: Get.width,
                margin: EdgeInsets.all(Get.width * 0.02669),
                decoration: BoxDecoration(
                  color: ColorRes.color_4F359B,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: Get.height * 0.0616),
                      Image.asset(
                        AssetRes.rainBowLogo,
                        height: Get.height * 0.05541,
                      ),
                      SizedBox(height: Get.height * 0.03),
                      Text(
                        Strings.height,
                        style: textStyleFont26WhiteBold,
                      ),
                      SizedBox(height: Get.height * 0.04),
                      Row(
                        children: [
                          Text(
                            Strings.feet,
                            style: textStyleFont14WhiteBold,
                          ),
                          SizedBox(
                            width: Get.width * 0.5,
                          ),
                          Text(
                            Strings.inches,
                            style: textStyleFont14WhiteBold,
                          ),
                        ],
                      ),
                      SizedBox(height: Get.height * 0.04),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 14),
                            child: SizedBox(
                              height: 80,
                              width: Get.width * 0.3971,
                              child: CupertinoPicker(
                                selectionOverlay: Container(
                                  height: 10,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color:
                                        ColorRes.color_6753A3.withOpacity(0.3),
                                  ),
                                ),
                                itemExtent: 50,
                                onSelectedItemChanged: (int index) {
                                  controller.heightFeet = index + 1;
                                },
                                children: List.generate(
                                    8,
                                    (index) => Center(
                                            child: Text(
                                          "${index + 1} ft",
                                          style: textStyleFont14White,
                                        ))),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 14),
                            child: SizedBox(
                              height: 80,
                              width: Get.width * 0.3971,
                              child: CupertinoPicker(
                                selectionOverlay: Container(
                                  height: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color:
                                        ColorRes.color_6753A3.withOpacity(0.3),
                                  ),
                                ),
                                itemExtent: 50,
                                onSelectedItemChanged: (int index) {
                                  controller.heightInches = index + 1;
                                  // controller.update(["Edit_profile"]);
                                },
                                children: List.generate(
                                    15,
                                    (index) => Center(
                                            child: Text(
                                          "${index + 1} in",
                                          style: textStyleFont14White,
                                        ))),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: Get.height * 0.4),
                      GestureDetector(
                        onTap: controller.onHeightSave,
                        child: Container(
                          width: Get.width * 0.84,
                          height: Get.height * 0.073,
                          decoration: BoxDecoration(
                              color: ColorRes.colorE7D01F,
                              borderRadius: BorderRadius.circular(15)),
                          child: Center(
                              child: Text(
                            Strings.save,
                            style: gilroyBoldTextStyle(
                                color: Colors.black, fontSize: 16),
                          )),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
