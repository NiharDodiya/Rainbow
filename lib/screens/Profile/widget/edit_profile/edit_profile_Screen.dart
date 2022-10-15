import 'package:cached_network_image/cached_network_image.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/loaders.dart';
import 'package:rainbow/common/Widget/text_field.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/common/helper.dart';
import 'package:rainbow/screens/Profile/profile_controller.dart';
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
  ProfileController profileController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(body: Obx(() {
        return Stack(
          children: [
            SafeArea(
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
                          editProfilePicture(context),
                          editProfileTextField()
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            controller.loader.isTrue
                ? const FullScreenLoader()
                : const SizedBox(),
          ],
        );
      })),
    );
  }

  Widget editProfileTextField() {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            SizedBox(
              height: Get.height > 865 ? Get.height / 2.6 : Get.height / 2.35,
              width: Get.width,
              child: Stack(
                children: [
                  (profileController
                              .viewProfile.data!.backgroundImage!.isEmpty ||
                          profileController.viewProfile.data!.backgroundImage
                                  .toString() ==
                              "")
                      ? (controller.backImage == null)
                          ? Container(
                              margin: const EdgeInsets.only(right: 16),
                              height: Get.height * 0.2857,
                              width: Get.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: const DecorationImage(
                                    image:
                                        AssetImage(AssetRes.placeholderImage),
                                    fit: BoxFit.cover,
                                  )),
                            )
                          : Container(
                              margin: const EdgeInsets.only(right: 16),
                              height: Get.height * 0.2857,
                              width: Get.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: FileImage(controller.backImage!),
                                    fit: BoxFit.cover,
                                  )),
                            )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            height: Get.height * 0.2857,
                            width: Get.width * 0.93,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              /* image: DecorationImage(
                          image: NetworkImage(profileController.viewProfile
                              .data!.backgroundImage.toString()),
                          fit: BoxFit.cover),*/
                            ),
                            child: CachedNetworkImage(
                              height: Get.height * 0.2857,
                              width: Get.width,
                              imageUrl: profileController
                                  .viewProfile.data!.backgroundImage
                                  .toString(),
                              fit: BoxFit.cover,
                              errorWidget: ((context, url, error) =>
                                  Image.asset(
                                    AssetRes.placeholderImage,
                                    height: Get.height * 0.2857,
                                    width: Get.width,
                                    fit: BoxFit.cover,
                                  )),
                              placeholder: ((context, url) => Image.asset(
                                    AssetRes.placeholderImage,
                                    height: Get.height * 0.2857,
                                    width: Get.width,
                                    fit: BoxFit.cover,
                                  )),
                            ),
                          ),
                        ),
                  Positioned(
                    top: Get.height /11,
                    left: Get.width * 0.24,
                    child: (profileController
                                .viewProfile.data!.profileImage!.isEmpty ||
                            profileController.viewProfile.data!.profileImage
                                    .toString() ==
                                "")
                        ? (controller.frontImage == null)
                            ? Container(
                                margin: const EdgeInsets.only(right: 16),
                                height: Get.height * 0.38666,
                                width: Get.width * 0.38666,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: AssetImage(
                                          AssetRes.portrait_placeholder),
                                      fit: BoxFit.contain,
                                    )),
                              )
                            : Container(
                                margin: const EdgeInsets.only(right: 16),
                                height: Get.height * 0.38666,
                                width: Get.width * 0.38666,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: FileImage(controller.frontImage!),
                                      fit: BoxFit.cover,
                                    )),
                              )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(99),
                            child: CachedNetworkImage(
                              imageUrl: profileController
                                  .viewProfile.data!.profileImage
                                  .toString(),
                              width: 151,
                              height: 151,
                              fit: BoxFit.cover,
                              placeholder: ((context, url) => Image.asset(
                                    AssetRes.portrait_placeholder,
                                    height: 151,
                                    width: 151,
                                    fit: BoxFit.cover,
                                  )),
                              errorWidget: ((context, url, error) =>
                                  Image.asset(
                                    AssetRes.portrait_placeholder,
                                    height: 151,
                                    width: 151,
                                    fit: BoxFit.cover,
                                  )),
                            ),
                          ),
                  ),
                  Positioned(
                    top: Get.height * 0.24,
                    left: Get.width * 0.4,
                    child: InkWell(
                        onTap: () {
                          showModalBottomSheet(
                              elevation: 10,
                              barrierColor: ColorRes.black.withOpacity(0.4),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                              ),
                              backgroundColor: ColorRes.color_4F359B,
                              context: context,
                              builder: (context) {
                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    GestureDetector(
                                      onTap: controller.navigateToCameraFront,
                                      child: const ListTile(
                                        leading: Icon(Icons.camera),
                                        title: Text(Strings.camera),
                                      ),
                                    ),
                                    Container(
                                      height: 0.5,
                                      width: Get.width,
                                      color: ColorRes.white,
                                    ),
                                    GestureDetector(
                                      onTap: controller.navigateToGallaryFront,
                                      child: const ListTile(
                                        leading: Icon(Icons
                                            .photo_size_select_actual_outlined),
                                        title: Text(Strings.gallery),
                                      ),
                                    ),
                                  ],
                                );
                              });
                        },
                        child: Container(
                          height: 29.19,
                          width: 28.48,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(AssetRes.cameraIcon))),
                        )),
                  ),
                  Positioned(
                    top: Get.height * 0.22,
                    left: Get.width * 0.77,
                    child: InkWell(
                        onTap: () {
                          // controller.backCamera();
                          showModalBottomSheet(
                              elevation: 10,
                              barrierColor: ColorRes.black.withOpacity(0.4),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                              ),
                              backgroundColor: ColorRes.color_4F359B,
                              context: context,
                              builder: (context) {
                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    GestureDetector(
                                      onTap: controller.navigateToCameraBack,
                                      child: const ListTile(
                                        leading: Icon(Icons.camera),
                                        title: Text(Strings.camera),
                                      ),
                                    ),
                                    Container(
                                      height: 0.5,
                                      width: Get.width,
                                      color: ColorRes.white,
                                    ),
                                    GestureDetector(
                                      onTap: controller.navigateToGallaryBack,
                                      child: const ListTile(
                                        leading: Icon(Icons
                                            .photo_size_select_actual_outlined),
                                        title: Text(Strings.gallery),
                                      ),
                                    ),
                                  ],
                                );
                              });
                        },
                        child: Container(
                          height: 29.19,
                          width: 28.48,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(AssetRes.cameraIcon))),
                        )),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
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
                    height: Get.height * 0.01,
                  ),
                  SizedBox(
                    width: Get.width * 0.85,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Strings.status,
                          style: gilroySemiBoldTextStyle(fontSize: 14),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        GetBuilder<EditProfileController>(
                          id: "Edit_profile",
                          builder: (controller) {
                            return DropdownButtonHideUnderline(
                              child: DropdownButton2(
                                isExpanded: true,
                                hint: Row(
                                  children: [
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Expanded(
                                      child: Text(
                                        Strings.sorrogateMom,
                                        style: gilroyMediumTextStyle(
                                            fontSize: 16,
                                            color: ColorRes.black
                                                .withOpacity(0.3)),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                                items: controller.advanceSearch
                                    .map((item) => DropdownMenuItem<String>(
                                          value: item,
                                          child: Text(
                                            item,
                                            style: gilroyMediumTextStyle(
                                                fontSize: 16,
                                                color: ColorRes.black),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ))
                                    .toList(),
                                value: controller.selectedStatus,
                                onChanged: (value) {
                                  controller.selectedStatus = value as String;
                                  controller.status.text = value;
                                  controller.update(["Edit_profile"]);
                                },
                                icon:
                                    Image.asset(AssetRes.arrowDown, height: 17),
                                iconSize: 14,
                                iconEnabledColor: Colors.grey,
                                iconDisabledColor: Colors.grey,
                                buttonHeight: 60,
                                buttonWidth: Get.width * 0.85,
                                buttonPadding:
                                    const EdgeInsets.only(left: 14, right: 23),
                                buttonDecoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                ),
                                buttonElevation: 2,
                                itemHeight: 40,
                                itemPadding:
                                    const EdgeInsets.only(left: 20, right: 14),
                                dropdownMaxHeight: Get.height * 0.3,
                                dropdownWidth: Get.width * 0.85,
                                dropdownPadding: null,
                                dropdownDecoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  color: Colors.white,
                                ),
                                dropdownElevation: 8,
                                scrollbarRadius: const Radius.circular(40),
                                scrollbarThickness: 6,
                                scrollbarAlwaysShow: true,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.026,
                  ),
                  /*   SizedBox(
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
                  ),*/
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
                      FocusScope.of(context).unfocus();
                    },
                    child: SizedBox(
                      width: Get.width * 0.85,
                      child: AppTextFiled(
                        controller: controller.height,
                        title: Strings.height,
                        hintText: Strings.h,
                        enable: false,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const WeightScreen());
                      FocusScope.of(context).unfocus();
                    },
                    child: SizedBox(
                      width: Get.width * 0.85,
                      child: AppTextFiled(
                        controller: controller.weight,
                        title: Strings.weight,
                        hintText: Strings.w,
                        enable: false,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.026,
                  ),
                  SizedBox(
                    width: Get.width * 0.85,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Strings.ethnicity,
                          style: gilroySemiBoldTextStyle(fontSize: 14),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        GetBuilder<EditProfileController>(
                            id: "drop",
                            builder: (controller) {
                              return Container(
                                width: Get.width / 1.20,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: ColorRes.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                padding:
                                    const EdgeInsets.only(left: 20, top: 5),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          flex: 14,
                                          child: InkWell(
                                            child: TextField(
                                              controller: controller.ethnicity,
                                              onTap: controller.dropDownBox,
                                              style: textFieldText,
                                              obscuringCharacter: "•",
                                              onChanged: (value) {
                                                controller.serching(value);
                                              },
                                              decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintStyle:
                                                    gilroyMediumTextStyle(
                                                        fontSize: 18,
                                                        color: ColorRes.black
                                                            .withOpacity(0.3)),
                                                hintText: "Canada",
                                              ),
                                            ),
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: controller.dropDownBox,
                                          icon: Image.asset(AssetRes.arrowDown,
                                              height: 20),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            }),
                        GetBuilder<EditProfileController>(
                            id: "drop",
                            builder: (controller) {
                              return (controller.countryBox == true)
                                  ? Container(
                                      height: 160,
                                      width: Get.width / 1.20,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white,
                                      ),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: (controller
                                                  .ethnicity.text.isEmpty)
                                              ? listNationalities.data!
                                                  .map((e) {
                                                  return Padding(
                                                    padding: const EdgeInsets.only(
                                                        left: 20,
                                                        top: 7,
                                                        bottom: 7),
                                                    child: InkWell(
                                                      onTap: () {
                                                        controller.ethnicity
                                                            .text = e.name!;
                                                        controller.countryBox =
                                                            false;
                                                        controller
                                                            .update(["drop"]);
                                                      },
                                                      child: SizedBox(
                                                        height: 25,
                                                        width: Get.width,
                                                        child: Align(
                                                          alignment:
                                                              Alignment.topLeft,
                                                          child: Text(
                                                            e.name!,
                                                            style: const TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 16),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }).toList()
                                              : controller.filterList.map((e) {
                                                  return Padding(
                                                    padding: const EdgeInsets.only(
                                                        left: 20,
                                                        top: 7,
                                                        bottom: 7),
                                                    child: InkWell(
                                                      onTap: () {
                                                        controller.ethnicity
                                                            .text = e.name!;
                                                        controller.countryBox =
                                                            false;
                                                        controller
                                                            .update(["drop"]);
                                                      },
                                                      child: SizedBox(
                                                        height: 25,
                                                        width: Get.width,
                                                        child: Align(
                                                          alignment:
                                                              Alignment.topLeft,
                                                          child: Text(
                                                            e.name!,
                                                            style: const TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 16),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }).toList(),
                                        ),
                                      ),
                                    )
                                  : const SizedBox();
                            }),
                        const SizedBox(
                          height: 10,
                        ),
                        /*   GetBuilder<EditProfileController>(
                          id: "Edit_profile",
                          builder: (controller) {
                            return DropdownButtonHideUnderline(
                              child: DropdownButton2(
                                isExpanded: true,
                                hint: Row(
                                  children: [
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Expanded(
                                      child: Text(
                                        "0",
                                        style: gilroyMediumTextStyle(
                                            fontSize: 16,
                                            color: ColorRes.black
                                                .withOpacity(0.3)),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                                items: countryNationCity
                                    .map((item) => DropdownMenuItem<String>(
                                          value: item,
                                          child: Text(
                                            item,
                                            style: gilroyMediumTextStyle(
                                                fontSize: 16,
                                                color: ColorRes.black),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ))
                                    .toList(),
                                value: controller.selectedEthicity,
                                onChanged: (value) {
                                  controller.selectedEthicity = value as String;
                                  controller.ethnicity.text = value;
                                  controller.update(["Edit_profile"]);
                                },
                                icon:
                                    Image.asset(AssetRes.arrowDown, height: 17),
                                iconSize: 14,
                                iconEnabledColor: Colors.grey,
                                iconDisabledColor: Colors.grey,
                                buttonHeight: 60,
                                buttonWidth: Get.width * 0.85,
                                buttonPadding:
                                    const EdgeInsets.only(left: 14, right: 23),
                                buttonDecoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                ),
                                buttonElevation: 2,
                                itemHeight: 40,
                                itemPadding:
                                    const EdgeInsets.only(left: 20, right: 14),
                                dropdownMaxHeight: Get.height * 0.3,
                                */ /* height: Get.height*0.19,*/ /*
                                dropdownWidth: Get.width * 0.85,
                                dropdownPadding: null,
                                dropdownDecoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  color: Colors.white,
                                ),
                                dropdownElevation: 8,
                                scrollbarRadius: const Radius.circular(40),
                                scrollbarThickness: 6,
                                scrollbarAlwaysShow: true,
                              ),
                            );
                          },
                        ),*/
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.026,
                  ),
                  // SizedBox(
                  //   width: Get.width * 0.85,
                  //   child: GestureDetector(
                  //     onTap: () {},
                  //     child: AppTextFiled(
                  //       controller: controller.haveKids,
                  //       title: Strings.haveKids,
                  //       hintText: Strings.haveKids,
                  //       enable: true,
                  //     ),
                  //   ),
                  // ),
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Strings.haveKids,
                        style: gilroySemiBoldTextStyle(fontSize: 14),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GetBuilder<EditProfileController>(
                        id: "Edit_profile",
                        builder: (controller) {
                          return DropdownButtonHideUnderline(
                            child: DropdownButton2(
                              isExpanded: true,
                              hint: Row(
                                children: [
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Expanded(
                                    child: Text(
                                      "0",
                                      style: gilroyMediumTextStyle(
                                          fontSize: 16,
                                          color:
                                              ColorRes.black.withOpacity(0.3)),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              items: controller.noOfKids
                                  .map((item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(
                                          item,
                                          style: gilroyMediumTextStyle(
                                              fontSize: 16,
                                              color: ColorRes.black),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ))
                                  .toList(),
                              value: controller.noKidsSelected,
                              onChanged: (value) {
                                controller.noKidsSelected = value as String;
                                controller.haveKids.text = value;
                                controller.update(["Edit_profile"]);
                              },
                              icon: Image.asset(AssetRes.arrowDown, height: 17),
                              iconSize: 14,
                              iconEnabledColor: Colors.grey,
                              iconDisabledColor: Colors.grey,
                              buttonHeight: 60,
                              buttonWidth: Get.width * 0.85,
                              buttonPadding:
                                  const EdgeInsets.only(left: 14, right: 23),
                              buttonDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                              ),
                              buttonElevation: 2,
                              itemHeight: 40,
                              itemPadding:
                                  const EdgeInsets.only(left: 20, right: 14),
                              dropdownMaxHeight: Get.height * 0.3,
                              /* height: Get.height*0.19,*/
                              dropdownWidth: Get.width * 0.85,
                              dropdownPadding: null,
                              dropdownDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                color: Colors.white,
                              ),
                              dropdownElevation: 8,
                              scrollbarRadius: const Radius.circular(40),
                              scrollbarThickness: 6,
                              scrollbarAlwaysShow: true,
                            ),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
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
                    padding: const EdgeInsets.all(20),
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
                        contentPadding: const EdgeInsets.only(top: 0),
                        border: InputBorder.none,
                        hintStyle: gilroyMediumTextStyle(
                            fontSize: 18,
                            color: ColorRes.black.withOpacity(0.3)),
                        hintText: Strings.aboutMeDes,
                      ),
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
                        padding: const EdgeInsets.all(20),
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
                            contentPadding: const EdgeInsets.only(top: 0),
                            border: InputBorder.none,
                            hintStyle: gilroyMediumTextStyle(
                                fontSize: 18,
                                color: ColorRes.black.withOpacity(0.3)),
                            hintText: Strings.hobbiesAndInterest,
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: Get.height * 0.04,
                  ),
                  GestureDetector(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      controller.onTapTextField(context);
                    },
                    child: Container(
                      width: Get.width * 0.84,
                      height: Get.height * 0.073,
                      decoration: BoxDecoration(
                          color: ColorRes.color_E7D01F,
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                          child: Text(
                        Strings.saveChang,
                        style: gilroyBoldTextStyle(
                            color: Colors.black, fontSize: 16),
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
