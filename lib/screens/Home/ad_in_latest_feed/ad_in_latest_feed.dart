import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/screens/Home/ad_in_latest_feed/learn_more_details.dart';
import 'package:rainbow/screens/Home/home_controller.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/color_res.dart';
import 'package:readmore/readmore.dart';

HomeController homeController = Get.find();

Widget adInLatestFeed({int? index}) {
  return Padding(
    padding: const EdgeInsets.only(right: 5),
    child: Container(
      //height: Get.height * 0.49,
      width: Get.width * 0.92566,
      padding: const EdgeInsets.only(left: 9, top: 13, right: 15, bottom: 18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white),
        color: ColorRes.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              (homeController.advertisementListUserModel.data?[index!]
                              .userDetails?.profileImage ==
                          null ||
                      homeController.advertisementListUserModel.data?[index!]
                              .userDetails?.profileImage ==
                          "")
                  ? Container(
                      height: 40,
                      width: 40,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image:
                                  AssetImage(AssetRes.portrait_placeholder))),
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: SizedBox(
                        height: 40,
                        width: 40,
                        child: CachedNetworkImage(
                            imageUrl: homeController.advertisementListUserModel
                                    .data?[index!].userDetails?.profileImage ??
                                "",
                            placeholder: ((context, url) =>
                                Image.asset(AssetRes.portrait_placeholder)),
                            errorWidget: ((context, url, error) =>
                                Image.asset(AssetRes.portrait_placeholder)),
                            fit: BoxFit.cover),
                      ),
                    ),
              Padding(
                padding: const EdgeInsets.only(top: 9, left: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      homeController.advertisementListUserModel.data?[index!]
                              .userDetails?.fullName
                              .toString() ??
                          "",
                      style: gilroyBoldTextStyle(
                          fontSize: 16, color: ColorRes.black),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Row(
                      children: [
                        Text(
                          "Sponsored.",
                          style: gilroyBoldTextStyle(
                              fontSize: 16,
                              color: ColorRes.black.withOpacity(0.4)),
                        ),
                        Image.asset(
                          AssetRes.worldIcon,
                          height: 10,
                          width: 10,
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          GetBuilder<HomeController>(
              id: "img",
              builder: (controller) {
                return Container(
                  height: 180,
                  width: Get.width * 0.85333,
                  padding: const EdgeInsets.only(
                      left: 15, top: 10, bottom: 12, right: 6),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: Stack(
                      children: [
                        (homeController.advertisementListUserModel.data?[index!]
                                    .itemsList?.length ==
                                0)
                            ? Image.asset(
                                AssetRes.placeholderImage,
                                width: Get.width,
                                fit: BoxFit.cover,
                              )
                            : PageView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: homeController
                                    .advertisementListUserModel
                                    .data?[index!]
                                    .itemsList!
                                    .length,
                                onPageChanged: (index) {
                                  homeController.pageIndex = index;
                                  homeController.update(["img"]);
                                },
                                itemBuilder: (context, index1) {
                                  return SizedBox(
                                    width: Get.width,
                                    child: /*FadeInImage(
                                placeholder: const AssetImage(AssetRes.placeholderImage),
                                placeholderErrorBuilder: ((context, error, stackTrace) => Image.asset(AssetRes.placeholderImage)),
                                image: NetworkImage(
                                  homeController.advertisementListUserModel.data![index!]
                                      .itemsList![index1]
                                      .toString(),
                                ),
                                width: Get.width - 60,
                                fit: BoxFit.cover,
                              ),*/
                                        CachedNetworkImage(
                                      width: Get.width,
                                      fit: BoxFit.fitWidth,
                                      imageUrl: homeController
                                          .advertisementListUserModel
                                          .data![index!]
                                          .itemsList![index1]
                                          .toString(),
                                      errorWidget: (context, url, error) =>
                                          const CircularProgressIndicator(
                                        color: ColorRes.red,
                                      ),
                                      placeholder: (context, url) =>
                                          Image.asset(AssetRes.placeholderImage,
                                              fit: BoxFit.fitWidth),
                                    ),
                                  );
                                },
                              ),
                        Column(
                          children: [
                            const SizedBox(
                              height: 35,
                            ),
                            (homeController.advertisementListUserModel
                                            .data?[index!].itemsList!.length ==
                                        1 ||
                                    homeController.advertisementListUserModel
                                            .data?[index!].itemsList!.length ==
                                        0)
                                ? const SizedBox()
                                : Padding(
                                    padding: const EdgeInsets.only(top: 100),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: CarouselIndicator(
                                        cornerRadius: 30,
                                        height: 6,
                                        width: 6,
                                        count: homeController
                                            .advertisementListUserModel
                                            .data?[index!]
                                            .itemsList!
                                            .length,
                                        index: homeController.pageIndex,
                                      ),
                                    ),
                                  ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }),
          Container(
            padding: const EdgeInsets.only(
              left: 15,
            ),
            width: Get.width * 0.85333,
            height: 110,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /*  Text(
                      "${homeController.advertisementListUserModel.data?[index!].description ?? ""} ",
                      maxLines: 3,
                      style: beVietnamSemiBoldTextStyle(
                        color: ColorRes.darkBlue.withOpacity(0.6),
                        fontSize: 14,
                      ).copyWith(
                        letterSpacing: 0,
                        height: 1.5,),
                    ),*/
                  ReadMoreText(
                    homeController.advertisementListUserModel.data?[index!]
                            .description ??
                        "",
                    trimLines: 3,
                    trimLength: 5,
                    style: beVietnamSemiBoldTextStyle(
                      color: ColorRes.darkBlue.withOpacity(0.6),
                      fontSize: 14,
                    ).copyWith(
                      letterSpacing: 0,
                      height: 1.5,
                    ),
                    //style: gilroySemiBoldTextStyle(fontSize: 14, color: Colors.grey),
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'more',
                    lessStyle: gilroySemiBoldTextStyle(
                        fontSize: 14, color: Colors.grey.withOpacity(0.6)),
                    trimExpandedText: '...less',
                    moreStyle: gilroySemiBoldTextStyle(
                        fontSize: 14, color: Colors.grey.withOpacity(0.6)),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: InkWell(
              onTap: () {
                Get.to(() => LearnMoreDetails(index: index));
              },
              child: Container(
                height: 30,
                width: Get.width * 0.32,
                decoration: const BoxDecoration(
                  color: ColorRes.color_50369C,
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  "LEARN MORE",
                  style: beVietnamSemiBoldTextStyle(
                      color: ColorRes.white, fontSize: 14),
                ),
              ),
            ),
          ),

          /* Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    Get.to(() =>  LearnMoreDetails(index: index));
                  },
                  child: Container(
                    height: 30,
                    width: Get.width * 0.32,
                    decoration: const BoxDecoration(
                      color: ColorRes.color_50369C,
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "LEARN MORE",
                      style: beVietnamSemiBoldTextStyle(
                          color: ColorRes.white, fontSize: 14),
                    ),
                  ),
                ),
              ],
            ),*/
        ],
      ),
    ),
  );
}
