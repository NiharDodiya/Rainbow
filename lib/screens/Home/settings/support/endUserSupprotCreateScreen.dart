import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/buttons.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/screens/advertisement/ad_support/screen/support_create/support_create_controller.dart';
import 'package:rainbow/screens/advertisement/ad_support/screen/support_details/support_details_controller.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/color_res.dart';
import 'package:rainbow/utils/strings.dart';

class SupportCreateEndUserScreen extends StatelessWidget {
  String? com;
   SupportCreateEndUserScreen({
    Key? key,this.com
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: Get.width,
          // height: Get.height,
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
              body("fdefd"!),
              // SizedBox(
              //   height: Get.height * 0.07,
              // ),
              // const Spacer(),
              // SubmitButton(
              //   child: Text(
              //     Strings.sendNewMessage,
              //     style: gilroyBoldTextStyle(color: Colors.black, fontSize: 16),
              //   ),
              // ),
              // SizedBox(
              //   height: Get.height * 0.05,
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Widget body(String comp) {
    SupportDetailsController controller = Get.put(SupportDetailsController());
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width * 0.08),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: Get.width * 0.1866,
                  ),
                  Text(
                    Strings.supportCode,
                    style: gilroyMediumTextStyle(fontSize: 16),
                  ),
                  const Spacer(),
                  Text(
                    "sdfsd",
                    style: gilroySemiBoldTextStyle(
                        fontSize: 18, color: ColorRes.color_FFA620),
                  ),
                ],
              ),
              SizedBox(
                height: Get.height * 0.032,
              ),
              SizedBox(
                height: Get.width * 0.144,
                child: Row(
                  children: [
                    Container(
                      height: Get.width * 0.144,
                      width: Get.width * 0.144,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(AssetRes.account),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: Get.width * 0.04,
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Spacer(),
                          Text(
                            Strings.raymondMarcos,
                            style: gilroySemiBoldTextStyle(
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(
                            height: Get.height * 0.0086,
                          ),
                          Text(
                            Strings.supportDate,
                            style: gilroySemiBoldTextStyle(
                              fontSize: 18,
                            ),
                          ),
                          // SizedBox(
                          //   height: Get.height * 0.0086,
                          // )
                        ]),

                    // const Spacer(),
                  ],
                ),
              ),
              SizedBox(
                height: Get.height * 0.0233,
              ),
              Text(
                Strings.supportdeatailDEs02,
                style: gilroySemiBoldTextStyle(fontSize: 14),
              ),
              SizedBox(
                height: Get.height * 0.0184,
              ),
              Container(
                height: Get.height * 0.07279,
                width: Get.width * 0.354666,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: ColorRes.white,
                    width: 2,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(9),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // SizedBox(
                    //   width: Get.width * 0.02626,
                    // ),
                    Padding(
                      padding:
                      EdgeInsets.symmetric(vertical: Get.height * 0.0104),
                      child: Image.asset(AssetRes.support01),
                    ),
                    // SizedBox(
                    //   width: Get.width * 0.02626,
                    // ),
                    Padding(
                      padding:
                      EdgeInsets.symmetric(vertical: Get.height * 0.0104),
                      child: Image.asset(AssetRes.support02),
                    ),

                    Padding(
                      padding:
                      EdgeInsets.symmetric(vertical: Get.height * 0.021),
                      child: Image.asset(AssetRes.downlode),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Get.height * 0.0300,
              ),
              SizedBox(
                height: Get.width * 0.144,
                child: Row(
                  children: [
                    Container(
                      height: Get.width * 0.144,
                      width: Get.width * 0.144,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [
                            ColorRes.color_50369C,
                            ColorRes.color_D18EEE,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: Center(
                        child: Container(
                          height: Get.width * 0.11,
                          width: Get.width * 0.11,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(AssetRes.duck),
                              )),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: Get.width * 0.04,
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Spacer(),
                          Text(
                            Strings.raymondMarcos,
                            style: gilroySemiBoldTextStyle(
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(
                            height: Get.height * 0.0086,
                          ),
                          Text(
                            Strings.supportDate,
                            style: gilroySemiBoldTextStyle(
                              fontSize: 18,
                            ),
                          ),
                          // SizedBox(
                          //   height: Get.height * 0.0086,
                          // )
                        ]),

                    // const Spacer(),
                  ],
                ),
              ),
              SizedBox(
                height: Get.height * 0.0233,
              ),
              Text(
                Strings.supportdeatailDEs,
                style: gilroySemiBoldTextStyle(fontSize: 14),
              ),
              SizedBox(
                height: Get.height * 0.0246,
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
                    hintText: Strings.writeSomethings,
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
                  Strings.attachImagesOrproof,
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
                  Strings.sendMessage,
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
