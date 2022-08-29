import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/country_name.dart';
import 'package:rainbow/common/Widget/loaders.dart';
import 'package:rainbow/common/Widget/text_field.dart';
import 'package:rainbow/common/helper.dart';
import 'package:rainbow/screens/advertisement/ad_home/screen/create_advertisement/create_advertisement_controller.dart';

import '../../../../../common/Widget/buttons.dart';
import '../../../../../common/Widget/text_styles.dart';
import '../../../../../utils/asset_res.dart';
import '../../../../../utils/color_res.dart';
import '../../../../../utils/strings.dart';

class CreateAdvertisementScreen extends StatelessWidget {
  CreateAdvertisementScreen({Key? key}) : super(key: key);
  CreateAdvertisementController advertisementController =
      Get.put(CreateAdvertisementController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<CreateAdvertisementController>(
        id: "advertiser",
        builder: (controller) {
          return Container(
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
            child: Obx(() {
              return SingleChildScrollView(
                child: Stack(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: Get.height * 0.035,
                        ),
                        appBar(),
                        body(context),
                        SubmitButton(
                          onTap: () {
                            advertisementController.createAdvertisement();
                          },
                          child: Text(
                            "Create Advertisement",
                            style: gilroyBoldTextStyle(
                                color: Colors.black, fontSize: 16),
                          ),
                        ),
                        SizedBox(height: Get.height * 0.02),
                      ],
                    ),
                    controller.loader.isTrue
                        ? const FullScreenLoader()
                        : const SizedBox()
                  ],
                ),
              );
            }),
          );
        },
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
                width: Get.width * 0.25,
              ),
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Text(
                  Strings.addAdvertisement,
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

  Widget body(context) {
    CreateAdvertisementController advertisementController =
        Get.put(CreateAdvertisementController());
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width * 0.0853),
        child: Column(
          children: [
            Container(
              height: 151,
              width: Get.width * 0.89333,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: ColorRes.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                onChanged: (value) {},
                maxLines: 7,
                controller: advertisementController.tagsController,
                style: textFieldText,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(top: 0),
                  border: InputBorder.none,
                  hintStyle: gilroyMediumTextStyle(
                      fontSize: 18, color: ColorRes.black.withOpacity(0.3)),
                  hintText: Strings.tagsSeparated,
                ),
              ),
            ),
           /* GetBuilder<CreateAdvertisementController>(
              id: 'advertiser',
              builder: (controller) {
                if (controller.filterList.isEmpty) {
                  return const SizedBox();
                } else {
                  return Container(
                    constraints: const BoxConstraints(
                        maxHeight: 200 - 20 - 50, minHeight: 30),
                    // height: 200,
                    width: Get.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 5),
                      ],
                    ),
                    child: ListView.builder(
                      itemCount: controller.filterList.length,
                      shrinkWrap: true,
                      itemBuilder: (con, index) {
                        return InkWell(
                          onTap: () =>
                              controller.onTagTap(controller.filterList[index]),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 10),
                            child: Row(
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: Image.network(
                                      controller.filterList[index].profileImage
                                          .toString(),
                                      height: 30,
                                      width: 30,
                                      fit: BoxFit.cover,
                                      errorBuilder: (con, str, dy) {
                                        return Container(
                                          height: 30,
                                          width: 30,
                                          decoration: BoxDecoration(
                                            color: ColorRes.white,
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: ColorRes.black,
                                                width: 0.7),
                                          ),
                                          child: const Center(
                                            child: Icon(
                                              Icons.account_circle_outlined,
                                              color: ColorRes.black,
                                            ),
                                          ),
                                        );
                                      },
                                    )),
                                const SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.filterList[index].fullName
                                          .toString(),
                                      style: const TextStyle(
                                        color: ColorRes.black,
                                        fontSize: 12,
                                      ),
                                    ),
                                    Text(
                                      controller.filterList[index].email
                                          .toString(),
                                      style: const TextStyle(
                                        color: ColorRes.black,
                                        fontSize: 10,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
              },
            ),*/
            SizedBox(height: Get.height * 0.0197),
            GetBuilder<CreateAdvertisementController>(
              id: "advertiser",
              builder: (controller) => InkWell(
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
                              onTap: controller.cameraPickImage,
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
                              onTap: controller.gallaryPickImage,
                              child: const ListTile(
                                leading: Icon(
                                    Icons.photo_size_select_actual_outlined),
                                title: Text(Strings.gallery),
                              ),
                            ),
                          ],
                        );
                      });
                },
                child: Container(
                  height: 133,
                  width: Get.width * 0.89333,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: ColorRes.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 56,
                        width: 200,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.imagePath.length,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 56,
                              width: 56,
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(19)),
                                image: controller.imagePath == null
                                    ? const DecorationImage(
                                        image: AssetImage(AssetRes.imageHint),
                                      )
                                    : DecorationImage(
                                        image: FileImage(
                                          File(controller.imagePath[index].path
                                              .toString()),
                                        ),
                                        fit: BoxFit.cover),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        Strings.uploadImage,
                        style: gilroyMediumTextStyle(
                            fontSize: 16, color: ColorRes.color_ADB1B1),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: Get.height * 0.0197),
            AppTextFiled(
              controller: advertisementController.titleController,
              title: "",
              titleBottomPadding: 0,
              hintText: Strings.title,
              showTitle: false,
            ),
            GetBuilder<CreateAdvertisementController>(
              id: "advertiser",
              builder: (controller) => InkWell(
                onTap: () {
                  controller.getCurrentLocation();
                },
                child: Container(
                    height: 60,
                    width: Get.width * 0.89333,
                    // padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: ColorRes.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 28,
                        ),
                        const Icon(
                          Icons.location_on,
                          color: ColorRes.black,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        controller.address == null
                            ? Text(
                                Strings.useCurrentLocation,
                                style: gilroyBoldTextStyle(
                                    fontSize: 16, color: ColorRes.black),
                              )
                            : Text(
                                controller.address!,
                                style: gilroyBoldTextStyle(
                                    fontSize: 9, color: ColorRes.black),
                              ),
                        const Spacer()
                      ],
                    )),
              ),
            ),
            SizedBox(height: Get.height * 0.0197),
            GetBuilder<CreateAdvertisementController>(
              id: 'advertiser',
              builder: (controller) {
                return dropdownButton(
                  showtitle: false,
                  title: "",
                  hintText: "caneda",
                  selectedValue: controller.selectedCity,
                  onTap: controller.onTapEthnicity,
                  dropdownList: countryNationCity,
                  height: Get.height * 0.3,
                );
              },
            ),
            AppTextFiled(
              controller: advertisementController.streetController,
              title: "",
              titleBottomPadding: 0,
              hintText: Strings.street,
              showTitle: false,
            ),
            Text(
              Strings.plase,
              style: gilroyBoldTextStyle(
                  fontSize: 12, color: ColorRes.color_979B9B),
            ),
            SizedBox(height: Get.height * 0.0197),
            AppTextFiled(
              controller: advertisementController.cityController,
              title: "",
              titleBottomPadding: 0,
              hintText: Strings.city,
              showTitle: false,
            ),
            AppTextFiled(
              controller: advertisementController.provinceController,
              title: "",
              titleBottomPadding: 0,
              hintText: Strings.proviceHint,
              showTitle: false,
            ),
            AppTextFiled(
              controller: advertisementController.postalCodeController,
              title: "",
              titleBottomPadding: 0,
              hintText: Strings.postalHint,
              showTitle: false,
            ),
            GetBuilder<CreateAdvertisementController>(
              id: 'advertiser',
              builder: (controller) {
                return InkWell(
                  onTap: () {
                    controller.showDatePicker(context);
                    FocusScope.of(context).unfocus();
                  },
                  child: AppTextFiled(
                    controller: advertisementController.dateController,
                    title: "",
                    titleBottomPadding: 0,
                    hintText: Strings.date,
                    showTitle: false,
                    enable: false,
                  ),
                );
              },
            ),
            Container(
              height: 151,
              width: Get.width * 0.89333,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: ColorRes.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                onChanged: (value) {},
                maxLines: 7,
                controller: advertisementController.descriptoionController,
                style: textFieldText,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(top: 0),
                  border: InputBorder.none,
                  hintStyle: gilroyMediumTextStyle(
                      fontSize: 18, color: ColorRes.black.withOpacity(0.3)),
                  hintText: Strings.description,
                ),
              ),
            ),
            SizedBox(height: Get.height * 0.0197),
            GetBuilder<CreateAdvertisementController>(
              id: "advertiser",
              builder: (controller) => dropdownButton(
                dropdownList: advertisementController.dropDList,
                selectedValue: advertisementController.callToAction,
                onTap: advertisementController.onCallToActionChange,
                title: "",
                showtitle: false,
                hintText: Strings.callToAction,
              ),
            ),
            SizedBox(height: Get.height * 0.006),
            AppTextFiled(
              controller: advertisementController.urlLinkController,
              title: "",
              titleBottomPadding: 0,
              hintText: Strings.urlHint,
              showTitle: false,
            ),
          ],
        ),
      ),
    );
  }
}
