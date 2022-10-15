import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/buttons.dart';
import 'package:rainbow/common/Widget/country_name.dart';
import 'package:rainbow/common/Widget/loaders.dart';
import 'package:rainbow/common/Widget/text_field.dart';
import 'package:rainbow/common/helper.dart';
import 'package:rainbow/common/popup.dart';
import 'package:rainbow/screens/advertisement/ad_home/screen/update_advertisement/update_advertisement_controller.dart';
import 'package:rainbow/utils/color_res.dart';

import '../../../../../common/Widget/buttons.dart';
import '../../../../../common/Widget/text_styles.dart';
import '../../../../../utils/asset_res.dart';
import '../../../../../utils/color_res.dart';
import '../../../../../utils/strings.dart';

class UpdateAdvertiseScreen extends StatelessWidget {
  int id;

  UpdateAdvertiseScreen({Key? key, required this.id}) : super(key: key);

  UpdateAdvertiseController updateAdvertiseController =
      Get.put(UpdateAdvertiseController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<UpdateAdvertiseController>(
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
                        body(context, controller),
                        SubmitButton(
                          onTap: () {
                            updateAdvertiseController.editAdvertisement(id: id);
                          },
                          child: Text(
                            "Edit Advertisement",
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
                  width: 35,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: Get.width * 0.15,
              ),
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Text(
                  'Edit Advertisement',
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

  Widget body(context, UpdateAdvertiseController controller) {
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
                controller: controller.tagsController,
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
            SizedBox(height: Get.height * 0.0197),
            GetBuilder<UpdateAdvertiseController>(
                id: "img",
                builder: (controller) {
                  return Container(
                    width: Get.width * 0.89333,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: ColorRes.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        (controller.imagePath.isEmpty)
                            ? const SizedBox()
                            : (controller.imagePath.length == 3)
                                ? Row(
                                    children: [
                                      Stack(
                                        alignment: const Alignment(1.2, -1.3),
                                        children: [
                                          Container(
                                            height: Get.height / 12,
                                            width: Get.width / 6,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                image: DecorationImage(
                                                    image: FileImage(controller
                                                        .imagePath[0]),
                                                    fit: BoxFit.cover)),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              FocusScopeNode currentfocus =
                                                  FocusScope.of(context);
                                              if (!currentfocus
                                                  .hasPrimaryFocus) {
                                                currentfocus.unfocus();
                                              }
                                              controller.imagePath.removeAt(0);
                                              controller.update(["img"]);
                                            },
                                            child: Container(
                                                decoration: const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Colors.black),
                                                child: const Icon(
                                                  Icons.clear,
                                                  color: Colors.white,
                                                )),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(width: 20),
                                      Stack(
                                        alignment: const Alignment(1.2, -1.3),
                                        children: [
                                          Container(
                                            height: Get.height / 12,
                                            width: Get.width / 6,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                image: DecorationImage(
                                                    image: FileImage(controller
                                                        .imagePath[1]),
                                                    fit: BoxFit.cover)),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              FocusScopeNode currentfocus =
                                                  FocusScope.of(context);
                                              if (!currentfocus
                                                  .hasPrimaryFocus) {
                                                currentfocus.unfocus();
                                              }
                                              controller.imagePath.removeAt(1);
                                              controller.update(["img"]);
                                            },
                                            child: Container(
                                                decoration: const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Colors.black),
                                                child: const Icon(
                                                  Icons.clear,
                                                  color: Colors.white,
                                                )),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(width: 20),
                                      Stack(
                                        alignment: const Alignment(1.2, -1.3),
                                        children: [
                                          Container(
                                            height: Get.height / 12,
                                            width: Get.width / 6,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                image: DecorationImage(
                                                    image: FileImage(controller
                                                        .imagePath[2]),
                                                    fit: BoxFit.cover)),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              FocusScopeNode currentfocus =
                                                  FocusScope.of(context);
                                              if (!currentfocus
                                                  .hasPrimaryFocus) {
                                                currentfocus.unfocus();
                                              }
                                              controller.imagePath.removeAt(2);
                                              controller.update(["img"]);
                                            },
                                            child: Container(
                                                decoration: const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Colors.black),
                                                child: const Icon(
                                                  Icons.clear,
                                                  color: Colors.white,
                                                )),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                : (controller.imagePath.length == 2)
                                    ? Row(
                                        children: [
                                          Stack(
                                            alignment:
                                                const Alignment(1.2, -1.3),
                                            children: [
                                              Container(
                                                height: Get.height / 12,
                                                width: Get.width / 6,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    image: DecorationImage(
                                                        image: FileImage(
                                                            controller
                                                                .imagePath[0]),
                                                        fit: BoxFit.cover)),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  FocusScopeNode currentfocus =
                                                      FocusScope.of(context);
                                                  if (!currentfocus
                                                      .hasPrimaryFocus) {
                                                    currentfocus.unfocus();
                                                  }
                                                  controller.imagePath
                                                      .removeAt(0);
                                                  controller.update(["img"]);
                                                },
                                                child: Container(
                                                    decoration:
                                                        const BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            color:
                                                                Colors.black),
                                                    child: const Icon(
                                                      Icons.clear,
                                                      color: Colors.white,
                                                    )),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(width: 20),
                                          Stack(
                                            alignment:
                                                const Alignment(1.2, -1.3),
                                            children: [
                                              Container(
                                                height: Get.height / 12,
                                                width: Get.width / 6,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    image: DecorationImage(
                                                        image: FileImage(
                                                            controller
                                                                .imagePath[1]),
                                                        fit: BoxFit.cover)),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  FocusScopeNode currentfocus =
                                                      FocusScope.of(context);
                                                  if (!currentfocus
                                                      .hasPrimaryFocus) {
                                                    currentfocus.unfocus();
                                                  }
                                                  controller.imagePath
                                                      .removeAt(1);
                                                  controller.update(["img"]);
                                                },
                                                child: Container(
                                                    decoration:
                                                        const BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            color:
                                                                Colors.black),
                                                    child: const Icon(
                                                      Icons.clear,
                                                      color: Colors.white,
                                                    )),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                    : (controller.imagePath.length == 1)
                                        ? Row(
                                            children: [
                                              Stack(
                                                alignment:
                                                    const Alignment(1.2, -1.3),
                                                children: [
                                                  Container(
                                                    height: Get.height / 12,
                                                    width: Get.width / 6,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                        image: DecorationImage(
                                                            image: FileImage(
                                                                controller
                                                                    .imagePath[0]),
                                                            fit: BoxFit.cover)),
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      FocusScopeNode
                                                          currentfocus =
                                                          FocusScope.of(
                                                              context);
                                                      if (!currentfocus
                                                          .hasPrimaryFocus) {
                                                        currentfocus.unfocus();
                                                      }
                                                      controller.imagePath
                                                          .removeAt(0);
                                                      controller
                                                          .update(["img"]);
                                                    },
                                                    child: Container(
                                                        decoration:
                                                            const BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                color: Colors
                                                                    .black),
                                                        child: const Icon(
                                                          Icons.clear,
                                                          color: Colors.white,
                                                        )),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          )
                                        : Row(
                                            children: [
                                              Stack(
                                                alignment:
                                                    const Alignment(1.2, -1.3),
                                                children: [
                                                  Container(
                                                    height: Get.height / 12,
                                                    width: Get.width / 5,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                        image: DecorationImage(
                                                            image: FileImage(
                                                                controller
                                                                    .imagePath[0]),
                                                            fit: BoxFit.cover)),
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      FocusScopeNode
                                                          currentfocus =
                                                          FocusScope.of(
                                                              context);
                                                      if (!currentfocus
                                                          .hasPrimaryFocus) {
                                                        currentfocus.unfocus();
                                                      }
                                                      controller.imagePath
                                                          .removeAt(0);
                                                      controller
                                                          .update(["img"]);
                                                    },
                                                    child: Container(
                                                        decoration:
                                                            const BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                color: Colors
                                                                    .black),
                                                        child: const Icon(
                                                          Icons.clear,
                                                          color: Colors.white,
                                                        )),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(width: 20),
                                              Stack(
                                                alignment:
                                                    const Alignment(1.2, -1.3),
                                                children: [
                                                  Container(
                                                    height: Get.height / 12,
                                                    width: Get.width / 5,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                        image: DecorationImage(
                                                            image: FileImage(
                                                                controller
                                                                    .imagePath[1]),
                                                            fit: BoxFit.cover)),
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      FocusScopeNode
                                                          currentfocus =
                                                          FocusScope.of(
                                                              context);
                                                      if (!currentfocus
                                                          .hasPrimaryFocus) {
                                                        currentfocus.unfocus();
                                                      }
                                                      controller.imagePath
                                                          .removeAt(1);
                                                      controller
                                                          .update(["img"]);
                                                    },
                                                    child: Container(
                                                        decoration:
                                                            const BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                color: Colors
                                                                    .black),
                                                        child: const Icon(
                                                          Icons.clear,
                                                          color: Colors.white,
                                                        )),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(width: 20),
                                              Stack(
                                                alignment:
                                                    const Alignment(1.2, -1.3),
                                                children: [
                                                  Container(
                                                    height: Get.height / 12,
                                                    width: Get.width / 5,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                        image: DecorationImage(
                                                            image: FileImage(
                                                                controller
                                                                    .imagePath[2]),
                                                            fit: BoxFit.cover)),
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      FocusScopeNode
                                                          currentfocus =
                                                          FocusScope.of(
                                                              context);
                                                      if (!currentfocus
                                                          .hasPrimaryFocus) {
                                                        currentfocus.unfocus();
                                                      }
                                                      controller.imagePath
                                                          .removeAt(2);
                                                      controller
                                                          .update(["img"]);
                                                    },
                                                    child: Container(
                                                        decoration:
                                                            const BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                color: Colors
                                                                    .black),
                                                        child: const Icon(
                                                          Icons.clear,
                                                          color: Colors.white,
                                                        )),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 30,
                            ),
                            InkWell(
                              onTap: () {
                                if (controller.imagePath.length == 3) {
                                  errorToast("you can take only 3 images");
                                } else {
                                  showModalBottomSheet(
                                      elevation: 10,
                                      barrierColor:
                                          ColorRes.black.withOpacity(0.4),
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
                                              onTap:
                                                  controller.navigateToCamera,
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
                                              onTap:
                                                  controller.navigateToGallary,
                                              child: const ListTile(
                                                leading: Icon(Icons
                                                    .photo_size_select_actual_outlined),
                                                title: Text(Strings.gallery),
                                              ),
                                            ),
                                          ],
                                        );
                                      });
                                }
                              },
                              child: SizedBox(
                                height: Get.height * 0.0474,
                                child: const Image(
                                  image: AssetImage(AssetRes.imageHint),
                                ),
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
                      ],
                    ),
                  );
                }),
            SizedBox(height: Get.height * 0.0197),
            AppTextFiled(
              controller: updateAdvertiseController.titleController,
              title: "",
              titleBottomPadding: 0,
              hintText: Strings.title,
              showTitle: false,
            ),
            GetBuilder<UpdateAdvertiseController>(
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
                          width: 20,
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
                            : SizedBox(
                                width: MediaQuery.of(context).size.width / 1.8,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      Text(
                                        controller.address!,
                                        style: gilroyBoldTextStyle(
                                            fontSize: 16,
                                            color: ColorRes.black),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                        const Spacer()
                      ],
                    )),
              ),
            ),
            SizedBox(height: Get.height * 0.0197),
            GetBuilder<UpdateAdvertiseController>(
                id: "drop",
                builder: (controller) {
                  return Container(
                    width: Get.width / 1.20,
                    height: 60,
                    decoration: BoxDecoration(
                      color: ColorRes.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.only(left: 20, top: 5),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 14,
                              child: InkWell(
                                child: TextField(
                                  onTap: controller.dropDownBox,
                                  controller: controller.countryController,
                                  style: textFieldText,
                                  obscuringCharacter: "•",
                                  onChanged: (value) {
                                    controller.serching(value);
                                  },
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintStyle: gilroyMediumTextStyle(
                                        fontSize: 18,
                                        color: ColorRes.black.withOpacity(0.3)),
                                    hintText: "Canada",
                                  ),
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: controller.dropDownBox,
                              icon: Image.asset(AssetRes.arrowDown, height: 20),
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
            GetBuilder<UpdateAdvertiseController>(
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
                                      .countryController.text.isEmpty)
                                  ? listCountryModel.data!.map((e) {
                                      return Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, top: 7, bottom: 7),
                                        child: InkWell(
                                          onTap: () {
                                            controller.countryController.text =
                                                e.name!;
                                            controller.countryBox = false;
                                            controller.update(["drop"]);
                                          },
                                          child: SizedBox(
                                            height: 25,
                                            width: Get.width,
                                            child: Align(
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                e.name!,
                                                style: const TextStyle(
                                                    color: Colors.black,
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
                                            left: 20, top: 7, bottom: 7),
                                        child: InkWell(
                                          onTap: () {
                                            controller.countryController.text =
                                                e.name!;
                                            controller.countryBox = false;
                                            controller.update(["drop"]);
                                          },
                                          child: SizedBox(
                                            height: 25,
                                            width: Get.width,
                                            child: Align(
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                e.name!,
                                                style: const TextStyle(
                                                    color: Colors.black,
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
            SizedBox(height: Get.height * 0.0197),

            /*GetBuilder<UpdateAdvertiseController>(
              id: 'advertiser',
              builder: (controller) {
                return dropdownButton(
                  showtitle: false,
                  title: "",
                  hintText: "canada",
                  selectedValue: controller.selectedCity,
                  onTap: controller.onTapEthnicity,
                  dropdownList: countryCity,
                  height: Get.height * 0.3,
                );
              },
            ),*/
            AppTextFiled(
              controller: updateAdvertiseController.streetController,
              title: "",
              titleBottomPadding: 0,
              hintText: Strings.street,
              showTitle: false,
            ),
            Text(
              Strings.plase,
              style: gilroyBoldTextStyle(
                  fontSize: 12, color: Colors.white.withOpacity(0.5)),
            ),
            SizedBox(height: Get.height * 0.0197),
            AppTextFiled(
              controller: updateAdvertiseController.cityController,
              title: "",
              titleBottomPadding: 0,
              hintText: Strings.city,
              showTitle: false,
            ),
            AppTextFiled(
              controller: updateAdvertiseController.provinceController,
              title: "",
              titleBottomPadding: 0,
              hintText: Strings.proviceHint,
              showTitle: false,
            ),
            AppTextFiled(
              controller: updateAdvertiseController.postalCodeController,
              title: "",
              titleBottomPadding: 0,
              hintText: Strings.postalHint,
              showTitle: false,
            ),
            GetBuilder<UpdateAdvertiseController>(
              id: 'advertiser',
              builder: (controller) {
                return InkWell(
                  onTap: () {
                    controller.showDatePicker(context);
                    FocusScope.of(context).unfocus();
                  },
                  child: AppTextFiled(
                    controller: updateAdvertiseController.dateController,
                    title: "",
                    titleBottomPadding: 0,
                    hintText: 'Date',
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
                controller: updateAdvertiseController.descriptoionController,
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
            GetBuilder<UpdateAdvertiseController>(
              id: "advertiser",
              builder: (controller) => dropdownButton(
                dropdownList: updateAdvertiseController.dropDList,
                selectedValue: updateAdvertiseController.callToAction,
                onTap: updateAdvertiseController.onCallToActionChange,
                title: "",
                showtitle: false,
                hintText: Strings.callToAction,
              ),
            ),
            SizedBox(height: Get.height * 0.006),
            AppTextFiled(
              controller: updateAdvertiseController.urlLinkController,
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
