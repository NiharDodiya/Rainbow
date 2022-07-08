import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/text_field.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/screens/auth/completeyourprofile/completeyourprofile_controller.dart';
import 'package:rainbow/screens/auth/heightweight/height_screen.dart';
import 'package:rainbow/screens/auth/heightweight/weight_screen.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/color_res.dart';
import 'package:rainbow/utils/strings.dart';

class CompleteYourProfile extends StatefulWidget {
  const CompleteYourProfile({Key? key}) : super(key: key);

  @override
  State<CompleteYourProfile> createState() => _CompleteYourProfileState();
}

class _CompleteYourProfileState extends State<CompleteYourProfile> {
  @override
  Widget build(BuildContext context) {
    CompleteYourProfileController controller =
        Get.put(CompleteYourProfileController());
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: GetBuilder<CompleteYourProfileController>(
            id: 'Complete_screen',
            builder: (controller) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: Get.width,
                      margin: EdgeInsets.all(Get.width * 0.02669),
                      decoration: BoxDecoration(
                          color: ColorRes.color_4F359B,
                          borderRadius: BorderRadius.circular(25)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(height: Get.height * 0.0616),
                            Image.asset(
                              AssetRes.rainBowLogo,
                              height: Get.height * 0.05541,
                            ),
                            SizedBox(height: Get.height * 0.038),
                            Text(
                              Strings.completeProfile,
                              style: gilroyBoldTextStyle(fontSize: 30),
                            ),
                            SizedBox(
                              height: Get.height * 0.045,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 14),
                              child: SizedBox(
                                height: 182,
                                width: Get.width,
                                child: Stack(
                                  children: [
                                    DottedBorder(
                                      dashPattern: [8, 6],
                                      color: ColorRes.color_B4B4B4,
                                      borderType: BorderType.RRect,
                                      radius: const Radius.circular(12),
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(12)),
                                        child: GestureDetector(onTap:() => controller.frontCamera(),
                                          child:controller.frontImage==null? Container(
                                            height: 136,
                                            width: 300,
                                            color: ColorRes.color_6753A3,
                                          ): Container(
                                            height: 136,
                                            width: 300,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image:  FileImage(controller.frontImage!),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          )
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: Get.height * 0.045,
                                      left: Get.width * 0.2,
                                      child: DottedBorder(
                                        dashPattern: [8, 6],
                                        color: ColorRes.color_B4B4B4,
                                        borderType: BorderType.RRect,
                                        radius: const Radius.circular(120),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(120),
                                          child: GestureDetector(onTap: () => controller.backCamera(),
                                            child: controller.backImage==null?Container(
                                              height: 145,
                                              width: 145,
                                              color: ColorRes.color_6753A3
                                                  .withOpacity(1),
                                            ):Container(
                                              height: 145,
                                              width: 145,
                                             decoration: BoxDecoration(
                                            image: DecorationImage(
                                            image:  FileImage(controller.backImage!),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                            )
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: Get.height * 0.12,
                                      left: Get.width * 0.35,
                                      child: Container(
                                        height: 29.19,
                                        width: 28.48,
                                        decoration: const BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    AssetRes.cameraIcon))),
                                      ),
                                    ),
                                    Positioned(
                                      top: Get.height * 0.12,
                                      left: Get.width * 0.66,
                                      child: Container(
                                        height: 29.19,
                                        width: 28.48,
                                        decoration: const BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    AssetRes.cameraIcon))),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: Get.height * 0.03,
                            ),
                            Center(
                                child: Text(
                              Strings.uploadPhotos,
                              style: textStyleFont14WhiteBold,
                            )),
                            SizedBox(
                              height: Get.height * 0.026,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(right: 15),
                              child: Divider(
                                thickness: 1,
                                color: ColorRes.color_B4B4B4,
                              ),
                            ),
                            SizedBox(
                              height: Get.height * 0.026,
                            ),
                            SizedBox(
                              width: Get.width * 0.85,
                              child: GestureDetector(
                                onTap: () {},
                                child: AppTextFiled(
                                  controller: controller.bio,
                                  title: Strings.bio,
                                  hintText: Strings.sorrogateMom,
                                  enable: true,
                                ),
                              ),
                            ),
                            /*      !controller.idTypeDrop
                                ? const SizedBox()
                                : AppDroDownIdType(
                              paramList: controller.ethnicityList,
                              onTap: controller.idTypeVerification,
                            ),*/
                            SizedBox(
                              height: Get.height * 0.02,
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(() => const HeightScreen());
                              },
                              child: SizedBox(
                                width: Get.width * 0.85,
                                child: AppTextFiled(
                                  controller: controller.height,
                                  title: Strings.height,
                                  suffix: const Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    size: 14.6,
                                    color: ColorRes.color_464646,
                                  ),
                                  hintText: Strings.h,
                                  enable: true,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: Get.height * 0.02,
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(() => const WeightScreen());
                              },
                              child: SizedBox(
                                width: Get.width * 0.85,
                                child: AppTextFiled(
                                  controller: controller.weight,
                                  title: Strings.weight,
                                  suffix: const Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    size: 14.6,
                                    color: ColorRes.color_464646,
                                  ),
                                  hintText: Strings.w,
                                  enable: true,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: Get.height * 0.02,
                            ),
                            SizedBox(
                              width: Get.width * 0.85,
                              child: AppTextFiled(
                                controller: controller.status,
                                title: Strings.status,
                                hintText: Strings.single,
                                enable: true,
                              ),
                            ),
                            SizedBox(
                              height: Get.height * 0.02,
                            ),
                            SizedBox(
                              width: Get.width * 0.85,
                              child: AppTextFiled(
                                controller: controller.instagram,
                                title: Strings.instagram,
                                hintText: Strings.instagramUsername,
                                enable: true,
                              ),
                            ),
                            SizedBox(
                              height: Get.height * 0.02,
                            ),
                            SizedBox(
                              width: Get.width * 0.85,
                              child: AppTextFiled(
                                controller: controller.youTube,
                                title: Strings.youTube,
                                hintText: Strings.youTubeUserName,
                                enable: true,
                              ),
                            ),
                            SizedBox(
                              height: Get.height * 0.02,
                            ),
                            SizedBox(
                              width: Get.width * 0.85,
                              child: AppTextFiled(
                                controller: controller.faceBook,
                                title: Strings.facebook,
                                hintText: Strings.faceBookUserName,
                                enable: true,
                              ),
                            ),
                            SizedBox(
                              height: Get.height * 0.02,
                            ),
                            SizedBox(
                              width: Get.width * 0.85,
                              child: AppTextFiled(
                                controller: controller.twitter,
                                title: Strings.twitter,
                                hintText: Strings.twitterUserName,
                                enable: true,
                              ),
                            ),
                            SizedBox(
                              height: Get.height * 0.02,
                            ),
                            Text(
                              Strings.aboutMe,
                              style: textStyleFont14White600,
                            ),
                            SizedBox(
                              height: Get.height * 0.02,
                            ),
                            Container(
                              height: Get.height * 0.28,
                              width: Get.width * 0.85,
                              decoration: BoxDecoration(
                                color: ColorRes.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: TextField(
                                onChanged: (value) {
                                  setState(() {
                                    controller.aboutTextCounter = value;
                                  });
                                },
                                maxLines: 7,
                                controller: controller.aboutMe,
                                style: textFieldText,
                                decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.only(
                                        left: 20, top: 15),
                                    border: InputBorder.none,
                                    hintStyle: textStyleFont18Grey,
                                    hintText: Strings.aboutMeDes,
                                    counterText:
                                        '${controller.aboutTextCounter.length.toString()}/70',
                                    counterStyle: textStyleFont18Grey),
                              ),
                            ),
                            SizedBox(
                              height: Get.height * 0.04,
                            ),
                            Text(
                              Strings.hobbies,
                              style: textStyleFont14White600,
                            ),
                            SizedBox(
                              height: Get.height * 0.02,
                            ),
                            GetBuilder<CompleteYourProfileController>(
                              id: 'Complete_screen',
                              builder: (controller) {
                                return Container(
                                  height: Get.height * 0.28,
                                  width: Get.width * 0.85,
                                  decoration: BoxDecoration(
                                    color: ColorRes.white,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: TextField(
                                    onChanged: (value) {
                                      setState(() {
                                        controller.hobbiesTextCounter = value;
                                      });
                                    },
                                    controller: controller.hobbies,
                                    maxLines: 7,
                                    style: textFieldText,
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.only(
                                            left: 20, top: 15),
                                        border: InputBorder.none,
                                        hintStyle: textStyleFont18Grey,
                                        hintText: Strings.aboutMeDes,
                                        counterText:
                                            '${controller.hobbiesTextCounter.length.toString()}/70',
                                        counterStyle: textStyleFont18Grey),
                                  ),
                                );
                              },
                            ),
                            SizedBox(
                              height: Get.height * 0.04,
                            ),
                            GestureDetector(
                              onTap: () {
                                controller.onRegisterTap();
                              },
                              child: Container(
                                width: Get.width * 0.84,
                                height: Get.height * 0.073,
                                decoration: BoxDecoration(
                                    color: ColorRes.color_E7D01F,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Center(
                                    child: Text(
                                  Strings.finish,
                                  style: gilroyBoldTextStyle(color: Colors.black,fontSize: 16),
                                )),
                              ),
                            ),
                            SizedBox(height: Get.height * 0.07),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ));
  }
}
