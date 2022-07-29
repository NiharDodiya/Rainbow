import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/buttons.dart';
import 'package:rainbow/screens/advertisement/ad_home/screen/create_advertisement/create_advertisement_controller.dart';
import 'package:rainbow/screens/advertisement/ad_home/screen/edit_advertisement/edit_advertisement_controller.dart';
import 'package:rainbow/utils/strings.dart';

import '../../../../../common/Widget/text_styles.dart';
import '../../../../../utils/asset_res.dart';
import '../../../../../utils/color_res.dart';

class EditAdvertisementscreen extends StatelessWidget {
  const EditAdvertisementscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EditAdvertiesementController editAdvertiesementController =
        Get.put(EditAdvertiesementController());
    editAdvertiesementController.getImagePath();

    return Scaffold(
      body: SafeArea(
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
              appBar(),
              body(),
            ],
          ),
        ),
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
                width: Get.width * 0.2,
              ),
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Text(
                  Strings.editAdvertisement,
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

  Widget body() {
    CreateAdvertisementController createAdvertisementController =
        Get.put(CreateAdvertisementController());
    EditAdvertiesementController editAdvertiesementController =
        Get.put(EditAdvertiesementController());
    return SizedBox(
      width: Get.width,
      height: Get.height - (Get.height * 0.03 + Get.height * 0.04 + 46),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Get.width * 0.0853, vertical: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Tags",
                        style: poppinsMediumBold(fontSize: 18),
                      ),
                      const Spacer(),
                      Text(
                        "Edit",
                        style: poppinsMediumBold(fontSize: 18)
                            .copyWith(decoration: TextDecoration.underline),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: Get.width * 0.496,
                        height: 25,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount:
                              createAdvertisementController.tags.length > 3
                                  ? 3
                                  : createAdvertisementController.tags.length,
                          itemBuilder: (context, index) => Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Container(
                              height: 25,
                              width: 80,
                              decoration: const BoxDecoration(
                                color: ColorRes.color_ECEFF0,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(4),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  createAdvertisementController.tags[index],
                                  style: gilroyMediumTextStyle(
                                      fontSize: 12,
                                      color: ColorRes.color_696D6D),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 10,
              color: ColorRes.white,
            ),

            /// IMAGES
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Get.width * 0.0853, vertical: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("Images", style: poppinsMediumBold(fontSize: 18)),
                      const Spacer(),
                      Text(
                        "Edit",
                        style: poppinsMediumBold(fontSize: 18)
                            .copyWith(decoration: TextDecoration.underline),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        height: 40,
                        width: Get.width - (Get.width * 0.0853 * 2),
                        child: Text(
                          editAdvertiesementController.imageName,
                          style: poppinsRegularBold(
                            fontSize: 14,
                            color: ColorRes.color_3083FF,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 10,
              color: ColorRes.white,
            ),

            ///Title
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Get.width * 0.0853, vertical: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("Title", style: poppinsMediumBold(fontSize: 18)),
                      const Spacer(),
                      Text(
                        "Edit",
                        style: poppinsMediumBold(fontSize: 18)
                            .copyWith(decoration: TextDecoration.underline),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  Row(
                    children: [
                      Text(
                        createAdvertisementController.titleController.text,
                        style: poppinsRegularBold(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 10,
              color: ColorRes.white,
            ),

            ///Location
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Get.width * 0.0853, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(Strings.location,
                          style: poppinsMediumBold(fontSize: 18)),
                      const Spacer(),
                      Text(
                        Strings.edit,
                        style: poppinsMediumBold(fontSize: 18)
                            .copyWith(decoration: TextDecoration.underline),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${Strings.country} : ${createAdvertisementController.addCountry!}",
                        style: poppinsRegularBold(
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "${Strings.street} :${createAdvertisementController.streetController.text}",
                        style: poppinsRegularBold(
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "${Strings.city}:${createAdvertisementController.cityController.text}",
                        style: poppinsRegularBold(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 10,
              color: ColorRes.white,
            ),

            ///Province
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Get.width * 0.0853, vertical: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("Province", style: poppinsMediumBold(fontSize: 18)),
                      const Spacer(),
                      Text(
                        "Edit",
                        style: poppinsMediumBold(fontSize: 18)
                            .copyWith(decoration: TextDecoration.underline),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  Row(
                    children: [
                      Text(
                        createAdvertisementController.preovinceController.text,
                        style: poppinsRegularBold(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 10,
              color: ColorRes.white,
            ),

            ///Postal code
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Get.width * 0.0853, vertical: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("Postal code",
                          style: poppinsMediumBold(fontSize: 18)),
                      const Spacer(),
                      Text(
                        "Edit",
                        style: poppinsMediumBold(fontSize: 18)
                            .copyWith(decoration: TextDecoration.underline),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  Row(
                    children: [
                      Text(
                        createAdvertisementController.postalCodeController.text,
                        style: poppinsRegularBold(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 10,
              color: ColorRes.white,
            ),

            ///Date
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Get.width * 0.0853, vertical: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("Date", style: poppinsMediumBold(fontSize: 18)),
                      const Spacer(),
                      Text(
                        "Edit",
                        style: poppinsMediumBold(fontSize: 18)
                            .copyWith(decoration: TextDecoration.underline),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  Row(
                    children: [
                      Text(
                        createAdvertisementController.dateController.text,
                        style: poppinsRegularBold(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 10,
              color: ColorRes.white,
            ),

            ///Description
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Get.width * 0.0853, vertical: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("Description",
                          style: poppinsMediumBold(fontSize: 18)),
                      const Spacer(),
                      Text(
                        "Edit",
                        style: poppinsMediumBold(fontSize: 18)
                            .copyWith(decoration: TextDecoration.underline),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  Row(
                    children: [
                      Text(
                        createAdvertisementController.titleController.text,
                        style: poppinsRegularBold(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 10,
              color: ColorRes.white,
            ),

            ///Call to Action
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Get.width * 0.0853, vertical: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("Call to Action",
                          style: poppinsMediumBold(fontSize: 18)),
                      const Spacer(),
                      Text(
                        "Edit",
                        style: poppinsMediumBold(fontSize: 18)
                            .copyWith(decoration: TextDecoration.underline),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  Row(
                    children: [
                      Text(
                        createAdvertisementController
                            .callToActionController.text,
                        style: poppinsRegularBold(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 10,
              color: ColorRes.white,
            ),

            ///Title
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Get.width * 0.0853, vertical: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("URL Link", style: poppinsMediumBold(fontSize: 18)),
                      const Spacer(),
                      Text(
                        "Edit",
                        style: poppinsMediumBold(fontSize: 18)
                            .copyWith(decoration: TextDecoration.underline),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  Row(
                    children: [
                      Text(
                        createAdvertisementController.urlLinkController.text,
                        style: poppinsRegularBold(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const SubmitButton(
              text: Strings.postAdvertisement,
            ),
            const SizedBox(
              height: 41,
            )
          ],
        ),
      ),
    );
  }
}
