import 'dart:io';

import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/buttons.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/screens/Profile/widget/profile_appbar.dart';
import 'package:rainbow/screens/advertisement/ad_home/screen/edit_advertisement/edit_advertisement_screen.dart';
import 'package:rainbow/screens/advertisement/ad_home/screen/setup_date/setup_date_screen.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/color_res.dart';
import 'package:rainbow/utils/strings.dart';
import 'package:readmore/readmore.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../ad_home_controller.dart';
import '../create_advertisement/create_advertisement_controller.dart';
import '../edit_advertisement/edit_advertisement_controller.dart';

class AdvertisementDeatailScreen extends StatelessWidget {
  AdvertisementDeatailScreen({Key? key}) : super(key: key);
  CreateAdvertisementController createAdvertisementController =
      Get.put(CreateAdvertisementController());



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<CreateAdvertisementController>(
        id: "img",
          builder: (controller){
        return  SafeArea(
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
                top(controller),
                Expanded(
                  child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(), child: bottom()),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget bottom() {
    CreateAdvertisementController createAdvertisementController = Get.put(CreateAdvertisementController());
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Get.width * 0.08533),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 26,
          ),
          Row(
            children: [
              Text(
                createAdvertisementController.titleController.text,
                style: gilroySemiBoldTextStyle(
                  fontSize: 18,
                ),
              ),
              const Spacer(),
              Text(
                Strings.summary,
                style: gilroySemiBoldTextStyle(
                    fontSize: 18, color: ColorRes.color_EED82F),
              ),
            ],
          ),

          const SizedBox(
            height: 20,
          ),
      ReadMoreText(
        createAdvertisementController.descriptoionController.text,
        trimLines: 3,
        trimMode: TrimMode.Line,
        style: gilroyMediumTextStyle(fontSize: 14),
        trimCollapsedText: 'see more',
        lessStyle: gilroyMediumTextStyle(fontSize: 14,color: Colors.white.withOpacity(0.5)),
        trimExpandedText: '...see less',
        moreStyle: gilroyMediumTextStyle(
          fontSize: 14,color: Colors.white.withOpacity(0.5)
        ),
      ),
          const SizedBox(
            height: 24,
          ),
          Row(
            children: [
              Text(
                Strings.tags,
                style: gilroySemiBoldTextStyle(
                  fontSize: 14,
                ),
              ),
              const Spacer(),
              SizedBox(
                width: Get.width * 0.496,
                height: 25,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: createAdvertisementController.tags.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                              fontSize: 12, color: ColorRes.color_696D6D),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Text(
            Strings.callToAction,
            style: gilroyMediumTextStyle(fontSize: 18),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            createAdvertisementController.callToAction.toString(),
            style: gilroyRegularTextStyle(fontSize: 14),
          ),
          const SizedBox(
            height: 25,
          ),
          Text(
            Strings.urlLink,
            style: gilroyMediumTextStyle(fontSize: 18),
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(

           onTap: () async{
             final Uri _url = Uri.parse('https://${createAdvertisementController.urlLinkController.text}');

             if (await launchUrl(_url)) {
             await launchUrl(_url);
             } else {
             throw 'Could not launch $_url';
             }
           },
            child: Text(
              createAdvertisementController.urlLinkController.text.toString(),
              style: gilroyRegularTextStyle(fontSize: 14),
            ),
          ),
          const SizedBox(
            height: 87,
          ),
          SubmitButton(
            onTap: () {
              Get.to(() => SetupDateScreen());
            },
            child: Text(
              Strings.next,
              style: gilroyBoldTextStyle(fontSize: 16, color: ColorRes.black),
            ),
          ),
          const SizedBox(
            height: 42.01,
          ),
        ],
      ),
    );
  }

// f
  Widget top(CreateAdvertisementController controller) {
    return Column(
      children: [
        Container(
          width: Get.width,
          height: 202,
          child: Stack(
            children: [
              PageView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.imagePath.length,
                  onPageChanged: (index){
                    controller.pageIndex = index;
                    controller.update(["img"]);
                  },
                  itemBuilder: (context, index1){
                    return Container(
                      width: Get.width,
                      child: FadeInImage(
                        placeholder: const AssetImage(AssetRes.placeholderImage),
                        image: FileImage(
                            controller.imagePath[index1]),
                        width: Get.width - 60,
                        fit: BoxFit.cover,
                      ),
                    );
                  }

              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 46),
                  Padding(
                    padding: EdgeInsets.only(
                        left: Get.width * 0.0853, right: Get.width * 0.0373),
                    child: InkWell(
                      onTap: () {
                        controller.tags.length = 0;
                        Get.back();
                      },
                      child: Container(
                        height: 32,
                        width: 34,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                            color: ColorRes.white),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 12),
                          child: Image.asset(
                            AssetRes.backIcon,
                            color: ColorRes.color_50369C,
                          ),
                        ),
                      ),
                    ),
                  ),
                  (controller.imagePath.length == 1)
                      ?const SizedBox()
                      :Padding(
                    padding: const EdgeInsets.only(top: 100),
                    child: Align(
                      alignment: Alignment.center,
                      child: CarouselIndicator(
                        cornerRadius: 30,
                        height: 6,
                        width: 6,
                        count: controller.imagePath.length,
                        index: controller.pageIndex,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }



}
