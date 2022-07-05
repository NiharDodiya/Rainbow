import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/text_field.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/screens/Profile/widget/edit_profile/editProfile_contoller.dart';
import 'package:rainbow/screens/Profile/widget/edit_profile/widget/editprofile_picture.dart';
import 'package:rainbow/screens/auth/heightweight/height_screen.dart';
import 'package:rainbow/screens/auth/heightweight/weight_screen.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/color_res.dart';
import 'package:rainbow/utils/strings.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  EditProfileController controller = Get.put(EditProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: GetBuilder<EditProfileController>(
            id: 'Edit_profile',
            builder: (controller) {
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
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      editProfilePicture(),
                      editProfileTextField()

                    ],
                  ),
                ),
              );
            },
          ),
        ));
  }
  Widget editProfileTextField()
  {
    return  Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: Get.height * 0.045,
            ),
            SizedBox(
              height: 260,
              width: Get.width,
              child: Stack(
                children: [
                 controller.backImage==null? Container(
                    margin: const EdgeInsets.only(right: 16),
                    height: Get.height * 0.2857,
                    width: Get.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                            image: AssetImage(AssetRes.overlay),
                            fit: BoxFit.cover)),
                  ): Container(
                   margin: const EdgeInsets.only(right: 16),
                   height: Get.height * 0.2857,
                   width: Get.width,
                   decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(10),
                       image: DecorationImage(
                         image:  FileImage(controller.backImage!),
                         fit: BoxFit.cover,
                       )),
                 ),
                  Positioned(
                    top: Get.height * 0.072,
                    left: Get.width * 0.25,
                    child: controller.frontImage==null?Container(
                      height: Get.height * 0.38666,
                      width: Get.width * 0.38666,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage(
                                  AssetRes.se_profile),
                              fit: BoxFit.contain)),
                    ):Container(
                      height: Get.height * 0.38666,
                      width: Get.width * 0.38666,
                      decoration:  BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image:  FileImage(controller.frontImage!),
                          fit: BoxFit.cover,
                        ),),
                    ),
                  ),
                  Positioned(
                    top: Get.height * 0.24,
                    left: Get.width * 0.4,
                    child: InkWell(onTap: () {
                      controller.backCamera();
                    },
                      child: Container(
                        height: 29.19,
                        width: 28.48,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    AssetRes.cameraIcon))),
                      )
                    ),
                  ),
                  Positioned(
                    top: Get.height * 0.22,
                    left: Get.width * 0.77,
                    child: InkWell(onTap:
                      () {
                        controller.frontCamera();
                        },
                      child:Container(
                        height: 29.19,
                        width: 28.48,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    AssetRes.cameraIcon))),
                      )
                    ),
                  ),
                ],
              ),
            ),
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: Get.height * 0.026,
                ),
                SizedBox(
                  width: Get.width * 0.85,
                  child: GestureDetector(
                    onTap: () {},
                    child: AppTextFiled(
                      controller: controller.fullName,
                      title: Strings.fullName,
                      hintText: Strings.natalieNara,
                      enable: true,
                    ),
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
                      controller: controller.status,
                      title: Strings.status,
                      hintText: Strings.sorrogateMom,
                      enable: true,
                    ),
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
                      controller: controller.age,
                      title: Strings.age,
                      hintText: Strings.ageHint,
                      enable: true,
                    ),
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
                      controller: controller.city,
                      title: Strings.city,
                      hintText: Strings.london,
                      enable: true,
                    ),
                  ),
                ),
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
                  height: Get.height * 0.026,
                ),
                SizedBox(
                  width: Get.width * 0.85,
                  child: GestureDetector(
                    onTap: () {},
                    child: AppTextFiled(
                      controller: controller.ethnicity,
                      title: Strings.ethnicity,
                      hintText: Strings.ethnicity,
                      enable: true,
                    ),
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
                      controller: controller.haveKids,
                      title: Strings.haveKids,
                      hintText: Strings.haveKids,
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
                    controller: controller.status1,
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
                GetBuilder<EditProfileController>(
                  id: 'Edit_profile',
                  builder: (controller) {
                    return Container(
                      height: Get.height * 0.28,
                      width: Get.width * 0.85,
                      decoration: BoxDecoration(
                        color: ColorRes.white,
                        borderRadius:
                        BorderRadius.circular(20),
                      ),
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            controller.hobbiesTextCounter =
                                value;
                          });
                        },
                        controller: controller.hobbies,
                        maxLines: 7,
                        style: textFieldText,
                        decoration: InputDecoration(
                            contentPadding:
                            const EdgeInsets.only(
                                left: 20, top: 15),
                            border: InputBorder.none,
                            hintStyle: textStyleFont18Grey,
                            hintText: Strings.aboutMeDes,
                            counterText:
                            '${controller.hobbiesTextCounter.length.toString()}/70',
                            counterStyle:
                            textStyleFont18Grey),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: Get.height * 0.04,
                ),
                GestureDetector(
                  onTap: () {
                    controller.onTapTextField();
                  },
                  child: Container(
                    width: Get.width * 0.84,
                    height: Get.height * 0.073,
                    decoration: BoxDecoration(
                        color: ColorRes.color_E7D01F,
                        borderRadius:
                        BorderRadius.circular(15)),
                    child: Center(
                        child: Text(
                          Strings.save,
                          style: textStyleFont16Black,
                        )),
                  ),
                ),
                SizedBox(height: Get.height * 0.07)
              ],
            ),
          )
          ],
        ),
      ),
    );
  }
}
