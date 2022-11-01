import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/buttons.dart';
import 'package:rainbow/screens/advertisement/ad_home/screen/create_advertisement/create_advertisement_controller.dart';
import 'package:rainbow/screens/advertisement/ad_home/screen/edit_advertisement/edit_advertisement_controller.dart';
import 'package:rainbow/screens/advertisement/ad_home/screen/update_advertisement/update_advertisement_screen.dart';
import 'package:rainbow/utils/strings.dart';
import 'package:readmore/readmore.dart';

import '../../../../../common/Widget/text_styles.dart';
import '../../../../../utils/asset_res.dart';
import '../../../../../utils/color_res.dart';

class EditAdvertisementscreen extends StatelessWidget {
  EditAdvertisementscreen({Key? key}) : super(key: key);

  final EditAdvertiesementController editAdvertiesementController =
      Get.put(EditAdvertiesementController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: Get.width,
          decoration:  const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                ColorRes.color_50369C,
                ColorRes.color_50369C,
                ColorRes.colorD18EEE,
                ColorRes.colorD18EEE,
                ColorRes.color_50369C,
                ColorRes.colorD18EEE,

              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                appBar(),
                body(),
              ],
            ),
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
                  width: 35,
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
                      editButton(),
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
                          itemCount: editAdvertiesementController
                                  .editAdvertisementModel
                                  .data
                                  ?.tagsList
                                  ?.length ??
                              0,
                          itemBuilder: (context, index) => Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: editAdvertiesementController
                                .editAdvertisementModel
                                .data
                                ?.tagsList![index]==" "?const SizedBox():Container(
                              height: 25,
                              width: 80,
                              decoration: const BoxDecoration(
                                color: ColorRes.colorECEFF0,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(4),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  editAdvertiesementController
                                          .editAdvertisementModel
                                          .data
                                          ?.tagsList![index]
                                          .toString() ??
                                      "",
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
                      editButton(),
                    ],
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: editAdvertiesementController
                              .editAdvertisementModel.data?.itemsList?.length ??
                          0,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            SizedBox(
                              height: 40,
                              width: Get.width - (Get.width * 0.0853 * 2),
                              child: Text(
                                editAdvertiesementController
                                        .editAdvertisementModel
                                        .data
                                        ?.itemsList![index]
                                        .toString() ??
                                    "",
                                style: poppinsRegularBold(
                                  fontSize: 14,
                                  color: ColorRes.color_3083FF,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        );
                      }),
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
                      editButton(),
                    ],
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  Row(
                    children: [
                      Text(
                        editAdvertiesementController
                                .editAdvertisementModel.data?.title
                                .toString() ??
                            "",
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
                      editButton(),
                    ],
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${Strings.country} : ${editAdvertiesementController.editAdvertisementModel.data?.country.toString() ?? ""}",
                        style: poppinsRegularBold(
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "${Strings.street} : ${editAdvertiesementController.editAdvertisementModel.data?.street.toString() ?? ""}",
                        style: poppinsRegularBold(
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "${Strings.city} : ${editAdvertiesementController.editAdvertisementModel.data?.location.toString() ?? ""}",
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
                      editButton(),
                    ],
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  Row(
                    children: [
                      Text(
                        editAdvertiesementController
                                .editAdvertisementModel.data?.province
                                .toString() ??
                            "",
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
                      editButton(),
                    ],
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  Row(
                    children: [
                      Text(
                        editAdvertiesementController
                                .editAdvertisementModel.data?.postalCode
                                .toString() ??
                            "",
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
                      editButton(),
                    ],
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  Row(
                    children: [
                      Text(
                        editAdvertiesementController
                                .editAdvertisementModel.data?.date
                                .toString()
                                .split(" ")[0] ??
                            "",
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
                      editButton(),
                    ],
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: ReadMoreText(
                      editAdvertiesementController
                              .editAdvertisementModel.data?.description
                              .toString() ??
                          "",
                      trimLines: 3,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: 'see more',
                      lessStyle: gilroyMediumTextStyle(
                          fontSize: 14, color: Colors.white.withOpacity(0.5)),
                      trimExpandedText: '...see less',
                      moreStyle: gilroyMediumTextStyle(
                          fontSize: 14, color: Colors.white.withOpacity(0.5)),
                    ),
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
                      editButton(),
                    ],
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  Row(
                    children: [
                      Text(
                        editAdvertiesementController
                                .editAdvertisementModel.data?.callAction
                                .toString() ??
                            "",
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
                      editButton(),
                    ],
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  Row(
                    children: [
                      Text(
                        editAdvertiesementController
                                .editAdvertisementModel.data?.urlLink
                                .toString() ??
                            "",
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

  Widget editButton() {
    return InkWell(
      onTap: () {
        Get.to(UpdateAdvertiseScreen(
            id: editAdvertiesementController.editAdvertisementModel.data?.id ??
                0));
      },
      child: Text(
        "Edit",
        style: poppinsMediumBold(fontSize: 18)
            .copyWith(decoration: TextDecoration.underline),
      ),
    );
  }
}
