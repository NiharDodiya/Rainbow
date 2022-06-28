import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/screens/auth/completeyourprofile/completeyourprofile_controller.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/color_res.dart';
import 'package:rainbow/utils/strings.dart';

class HeightScreen extends StatelessWidget {
  const HeightScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CompleteYourProfileController controller =
        Get.put(CompleteYourProfileController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<CompleteYourProfileController>(
        builder: (controller) {
          return SafeArea(
            child: Center(
              child: Container(
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
                    mainAxisAlignment: MainAxisAlignment.start,
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
                                onSelectedItemChanged: (int index) {},
                                children: <Widget>[
                                  Center(
                                      child: Text(" 1 ft",
                                          style: textStyleFont14White)),
                                  Center(
                                      child: Text(" 2 ft",
                                          style: textStyleFont14White)),
                                  Center(
                                      child: Text(" 3 ft",
                                          style: textStyleFont14White)),
                                  Center(
                                      child: Text(" 3 ft",
                                          style: textStyleFont14White)),
                                  Center(
                                      child: Text(" 3 ft",
                                          style: textStyleFont14White)),
                                  Center(
                                      child: Text(" 3 ft",
                                          style: textStyleFont14White)),
                                  Center(
                                      child: Text(" 3 ft",
                                          style: textStyleFont14White)),
                                ],
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
                                onSelectedItemChanged: (int index) {},
                                children: <Widget>[
                                  Center(
                                      child: Text(
                                    "1 in",
                                    style: textStyleFont14White,
                                  )),
                                  Center(
                                      child: Text(
                                    "2 in",
                                    style: textStyleFont14White,
                                  )),
                                  Center(
                                      child: Text(
                                    "3 in",
                                    style: textStyleFont14White,
                                  )),
                                  Center(
                                      child: Text(
                                    "3 in",
                                    style: textStyleFont14White,
                                  )),
                                  Center(
                                      child: Text(
                                    "3 in",
                                    style: textStyleFont14White,
                                  )),
                                  Center(
                                      child: Text(
                                    "3 in",
                                    style: textStyleFont14White,
                                  )),
                                  Center(
                                      child: Text(
                                    "3 in",
                                    style: textStyleFont14White,
                                  )),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: Get.height * 0.4),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: Get.width * 0.84,
                          height: Get.height * 0.073,
                          decoration: BoxDecoration(
                              color: ColorRes.color_E7D01F,
                              borderRadius: BorderRadius.circular(15)),
                          child: Center(
                              child: Text(
                            Strings.save,
                            style: textStyleFont16Black,
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
