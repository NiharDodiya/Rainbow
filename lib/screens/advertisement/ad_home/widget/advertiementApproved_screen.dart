import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:charts_flutter/flutter.dart' as chart;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/loaders.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/screens/advertisement/ad_home/ad_home_controller.dart';
import 'package:rainbow/screens/advertisement/ad_home/screen/create_advertisement/create_advertisement_controller.dart';
import 'package:rainbow/screens/advertisement/ad_home/screen/edit_advertisement/edit_advertisement_controller.dart';
import 'package:rainbow/screens/advertisement/ad_home/screen/edit_advertisement/edit_advertisement_screen.dart';
import 'package:rainbow/screens/advertisement/ad_home/widget/advertisementApproved_screen.dart';
import 'package:rainbow/screens/advertisement/ad_home/widget/advertisermentRejected_Screen.dart';
import 'package:rainbow/screens/advertisement/ad_home/widget/charrr.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/color_res.dart';
import 'package:rainbow/utils/strings.dart';
import 'package:readmore/readmore.dart';
import 'package:url_launcher/url_launcher.dart';

class AdvertisementDetailsApprovedScreen extends StatelessWidget {
  int i;
  int id;

  AdvertisementDetailsApprovedScreen(
      {Key? key, required this.i, required this.id})
      : super(key: key);

  final List<DeveloperSeries> data = [
    // DeveloperSeries(
    //   year: "2017",
    //   developers: 40000,
    //   barColor: chart.ColorUtil.fromDartColor(Colors.green),
    // ),
    DeveloperSeries(
      year: "Week 1",
      developers: 180,
      barColor: chart.ColorUtil.fromDartColor(Colors.green),
    ),
    DeveloperSeries(
      year: "Week 2",
      developers: 215,
      barColor: chart.ColorUtil.fromDartColor(Colors.green),
    ),
    DeveloperSeries(
      year: "Week 3",
      developers: 160,
      barColor: chart.ColorUtil.fromDartColor(Colors.green),
    ),
    DeveloperSeries(
      year: "Week 4",
      developers: 225,
      barColor: chart.ColorUtil.fromDartColor(Colors.green),
    ),
  ];
  List<chart.Series<DeveloperSeries, String>> series = [];

  final CreateAdvertisementController createAdvertisementController =
      Get.put(CreateAdvertisementController());

  void init() {
    series = [
      chart.Series(
          id: "developers",
          data: data,
          domainFn: (DeveloperSeries series, _) => series.year,
          measureFn: (DeveloperSeries series, _) => series.developers,
          colorFn: (DeveloperSeries series, _) => series.barColor,
          fillColorFn: (DeveloperSeries series, _) => series.barColor),
    ];
  }

  EditAdvertiesementController editAdvertiesementController =
      Get.put(EditAdvertiesementController());

  @override
  Widget build(BuildContext context) {
    init();
    return Scaffold(
      body: Obx(
        () {
          return Stack(
            children: [
              GetBuilder<AdHomeController>(
                id: "add",
                builder: (controller) {
                  return SafeArea(
                    child: SingleChildScrollView(
                      child: Container(
                        width: Get.width,
                        height: 790,
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
                            top(i, context, id),
                            Expanded(
                                child: SingleChildScrollView(
                                    physics: const BouncingScrollPhysics(),
                                    child: bottom(context, i))),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
              editAdvertiesementController.loader.isTrue
                  ? const FullScreenLoader()
                  : const SizedBox(),
            ],
          );
        },
      ),
    );
  }

  Widget top(int index, context, int id) {
    AdHomeController adHomeController = Get.put(AdHomeController());
    EditAdvertiesementController editAdvertiesementController =
        Get.put(EditAdvertiesementController());
    return Column(
      children: [
        GetBuilder<CreateAdvertisementController>(
            id: "img",
            builder: (controller) {
              return SizedBox(
                width: Get.width,
                height: 202,
                child: Stack(
                  children: [
                    (adHomeController.myAdvertiserModel.data?[index].itemsList!
                                .length ==
                            0)
                        ? Image.asset(
                            AssetRes.placeholderImage,
                            width: Get.width,
                            fit: BoxFit.cover,
                          )
                        : PageView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: adHomeController.myAdvertiserModel
                                .data?[index].itemsList!.length,
                            onPageChanged: (index) {
                              createAdvertisementController.pageIndex = index;
                              createAdvertisementController.update(["img"]);
                            },
                            itemBuilder: (context, index1) {
                              return SizedBox(
                                width: Get.width,
                                child: FadeInImage(
                                  placeholder: const AssetImage(
                                      AssetRes.placeholderImage),
                                  image: NetworkImage(
                                    adHomeController.myAdvertiserModel
                                        .data![index].itemsList![index1]
                                        .toString(),
                                  ),
                                  width: Get.width - 60,
                                  fit: BoxFit.cover,
                                ),
                              );
                            },
                          ),
                    Column(
                      children: [
                        const SizedBox(height: 46),
                        Padding(
                          padding: EdgeInsets.only(
                              left: Get.width * 0.0853,
                              right: Get.width * 0.0373),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
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
                              const Spacer(),
                              (adHomeController.myAdvertiserModel.data?[index]
                                          .adminStatus
                                          .toString() ==
                                      'approve')
                                  ? const SizedBox()
                                  : InkWell(
                                      onTap: () async {
                                        await editAdvertiesementController
                                            .myEditAdvertiserListData(id: id);

                                        Get.to(EditAdvertisementscreen());
                                      },
                                      child: Container(
                                        height: 33.3,
                                        width: 33.3,
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: ColorRes.white),
                                        child: Padding(
                                          padding: const EdgeInsets.all(12),
                                          child: Image.asset(
                                            AssetRes.editicons,
                                            color: ColorRes.black,
                                          ),
                                        ),
                                      ),
                                    ),
                            ],
                          ),
                        ),
                        (adHomeController.myAdvertiserModel.data?[index]
                                        .itemsList!.length ==
                                    1 ||
                                adHomeController.myAdvertiserModel.data?[index]
                                        .itemsList!.length ==
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
                                    count: adHomeController.myAdvertiserModel
                                        .data?[index].itemsList!.length,
                                    index:
                                        createAdvertisementController.pageIndex,
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ],
                ),
              );
            }),
      ],
    );
  }

  Widget bottom(BuildContext context, int index) {
    AdHomeController adHomeController = Get.put(AdHomeController());
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
                adHomeController.myAdvertiserModel.data![index].title
                    .toString(),
                style: gilroySemiBoldTextStyle(
                  fontSize: 18,
                ),
              ),
              const Spacer(),
              (adHomeController.myAdvertiserModel.data?[index].adminStatus
                          .toString() ==
                      'approve')
                  ? InkWell(
                      onTap: () {
                        Get.to(() => const AdvertisementApprovedScreen());
                      },
                      child: Text(
                        Strings.approved,
                        style: gilroySemiBoldTextStyle(
                            fontSize: 18, color: ColorRes.color_49A510),
                      ),
                    )
                  : (adHomeController.myAdvertiserModel.data?[index].adminStatus
                              .toString() ==
                          'pending')
                      ? Text(
                          'Pending',
                          style: gilroySemiBoldTextStyle(
                              fontSize: 18, color: ColorRes.color_EED82F),
                        )
                      : InkWell(
                          onTap: () {
                            Get.to(() => const AdvertisermentRejectedScreen());
                          },
                          child: Text(
                            Strings.rejected,
                            style: gilroySemiBoldTextStyle(
                                fontSize: 18, color: Colors.red),
                          ),
                        ),
            ],
          ),

          const SizedBox(
            height: 20,
          ),
          ReadMoreText(
            adHomeController.myAdvertiserModel.data![index].description
                .toString(),
            trimLines: 3,
            style: gilroyMediumTextStyle(fontSize: 14),
            trimMode: TrimMode.Line,
            trimCollapsedText: 'see more',
            lessStyle: gilroyMediumTextStyle(
                fontSize: 14, color: Colors.white.withOpacity(0.5)),
            trimExpandedText: '...see less',
            moreStyle: gilroyMediumTextStyle(
                fontSize: 14, color: Colors.white.withOpacity(0.5)),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Text(
                "Tags",
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
                  itemCount: adHomeController
                      .myAdvertiserModel.data![index].tagsList!.length,
                  itemBuilder: (context, index1) => Padding(
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
                        child: Container(
                          width: 75,
                          alignment: Alignment.center,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Text(
                                  adHomeController.myAdvertiserModel
                                      .data![index].tagsList![index1]
                                      .toString(),
                                  style: gilroyMediumTextStyle(
                                      fontSize: 12,
                                      color: ColorRes.color_696D6D),
                                ),
                              ],
                            ),
                          ),
                        ), /*Text(
                          adHomeController
                              .myAdvertiserModel.data![index].tagsList![index1]
                              .toString(),
                          style: gilroyMediumTextStyle(
                              fontSize: 12, color: ColorRes.color_696D6D),
                        ),*/
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
            "Call to Action",
            style: gilroyMediumTextStyle(fontSize: 18),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            adHomeController.myAdvertiserModel.data![index].callAction
                .toString(),
            style: gilroyRegularTextStyle(fontSize: 14),
          ),
          const SizedBox(
            height: 25,
          ),
          Text(
            "URL Link",
            style: gilroyMediumTextStyle(fontSize: 18),
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () async {
              final Uri _url = Uri.parse(
                  'https://${adHomeController.myAdvertiserModel.data![index].urlLink.toString()}');
              await launchUrl(_url);
              /* if (await launchUrl(_url)) {
                await launchUrl(_url);
              } else {
                throw 'Could not launch $_url';
              }*/
            },
            child: Text(
              adHomeController.myAdvertiserModel.data![index].urlLink
                  .toString(),
              style: gilroyRegularTextStyle(fontSize: 14),
            ),
          ),

          const SizedBox(
            height: 20,
          ),

          // chart

          /* InkWell(
            onTap: () {
              showModalBottomSheet(
                  backgroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(10),
                    ),
                  ),
                  isScrollControlled: true,
                  context: context,
                  builder: (context) {
                    return GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text(
                              "Month",
                              style: gilroyRegularTextStyle(
                                  color: ColorRes.color_8B8B8B),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 25),
                            child: GetBuilder<AdHomeController>(
                              id: "add",
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
                                            "july",
                                            style: gilroyMediumTextStyle(
                                                fontSize: 16,
                                                color: ColorRes.black
                                                    .withOpacity(0.3)),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                    items: adHomeController.months
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
                                    value: adHomeController.selectedItem,
                                    onChanged: (value) {
                                      adHomeController.selectedItem =
                                      value as String?;
                                      adHomeController.update(["add"]);
                                    },
                                    icon: Image.asset(
                                      AssetRes.arrowDown,
                                      height: 17,
                                      color: Colors.black,
                                    ),
                                    iconSize: 14,
                                    iconEnabledColor: Colors.grey,
                                    iconDisabledColor: Colors.grey,
                                    buttonHeight: 60,
                                    buttonWidth: Get.width * 0.85,
                                    buttonPadding: const EdgeInsets.only(
                                        left: 14, right: 23),
                                    buttonDecoration: BoxDecoration(
                                      border: Border.all(
                                          color: ColorRes.color_E4E4EC),
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.white,
                                    ),
                                    buttonElevation: 0,
                                    itemHeight: 40,
                                    itemPadding: const EdgeInsets.only(
                                        left: 20, right: 14),
                                    dropdownMaxHeight: Get.height * 0.3,
                                    */ /* height: Get.height*0.19,*/ /*
                                    dropdownWidth: Get.width * 0.85,
                                    dropdownPadding: null,
                                    dropdownDecoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14),
                                      color: ColorRes.color_E4E4EC,
                                    ),
                                    // scrollbarRadius: const Radius.circular(40),
                                    scrollbarThickness: 6,
                                    scrollbarAlwaysShow: true,
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 25,
                              ),
                              Container(
                                height: 10,
                                width: 10,
                                decoration: const BoxDecoration(
                                    color: ColorRes.color_B180EF,
                                    shape: BoxShape.circle),
                              ),
                              Spacer(),
                              Text(
                                Strings.sun,
                                style: gilroyMediumTextStyle(
                                    color: ColorRes.color_C4C4C4, fontSize: 10),
                              ),
                              Spacer(),
                              Container(
                                height: 10,
                                width: 10,
                                decoration: const BoxDecoration(
                                    color: ColorRes.color_FF737D,
                                    shape: BoxShape.circle),
                              ),
                              Spacer(),
                              Text(
                                Strings.mon,
                                style: gilroyMediumTextStyle(
                                    color: ColorRes.color_C4C4C4, fontSize: 10),
                              ),
                              Spacer(),
                              Container(
                                height: 10,
                                width: 10,
                                decoration: const BoxDecoration(
                                    color: ColorRes.color_61BDFF,
                                    shape: BoxShape.circle),
                              ),
                              Spacer(),
                              Text(
                                Strings.tue,
                                style: gilroyMediumTextStyle(
                                    color: ColorRes.color_C4C4C4, fontSize: 10),
                              ),
                              Spacer(),
                              Container(
                                height: 10,
                                width: 10,
                                decoration: const BoxDecoration(
                                    color: ColorRes.color_3294DB,
                                    shape: BoxShape.circle),
                              ),
                              Spacer(),
                              Text(
                                Strings.wed,
                                style: gilroyMediumTextStyle(
                                    color: ColorRes.color_C4C4C4, fontSize: 10),
                              ),
                              Spacer(),
                              Container(
                                height: 10,
                                width: 10,
                                decoration: const BoxDecoration(
                                    color: ColorRes.color_73E6FF,
                                    shape: BoxShape.circle),
                              ),
                              Spacer(),
                              Text(
                                Strings.th,
                                style: gilroyMediumTextStyle(
                                    color: ColorRes.color_C4C4C4, fontSize: 10),
                              ),
                              Spacer(),
                              Container(
                                height: 10,
                                width: 10,
                                decoration: const BoxDecoration(
                                    color: ColorRes.color_4075FF,
                                    shape: BoxShape.circle),
                              ),
                              Spacer(),
                              Text(
                                Strings.fri,
                                style: gilroyMediumTextStyle(
                                    color: ColorRes.color_C4C4C4, fontSize: 10),
                              ),
                              Spacer(),
                              Container(
                                height: 10,
                                width: 10,
                                decoration: const BoxDecoration(
                                    color: ColorRes.color_FF61D3,
                                    shape: BoxShape.circle),
                              ),
                              Spacer(),
                              Text(
                                Strings.sat,
                                style: gilroyMediumTextStyle(
                                    color: ColorRes.color_C4C4C4, fontSize: 10),
                              ),
                              SizedBox(
                                width: 25,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Stack(
                            alignment: Alignment.topRight,
                            children: [
                              Container(
                                  child: SfCartesianChart(
                                      margin: const EdgeInsets.only(
                                          left: 20,
                                          top: 20,
                                          bottom: 20,
                                          right: 80),
                                      primaryXAxis: CategoryAxis(),
                                      //enableAxisAnimation: false,
                                      series: <ChartSeries>[
                                        StackedBarSeries<ChartData, String>(
                                          dataSource: chartData,
                                          xValueMapper: (ChartData data, _) =>
                                          data.x,
                                          yValueMapper: (ChartData data, _) =>
                                          data.y,
                                          color: ColorRes.color_B180EF,
                                        ),
                                        StackedBarSeries<ChartData, String>(
                                          dataSource: chartData,

                                          xValueMapper: (ChartData data, _) =>
                                          data.x,
                                          yValueMapper: (ChartData data, _) =>
                                          data.y,
                                          color: ColorRes.color_FF737D,
                                        ),
                                        StackedBarSeries<ChartData, String>(
                                          dataSource: chartData,
                                          xValueMapper: (ChartData data, _) =>
                                          data.x,
                                          yValueMapper: (ChartData data, _) =>
                                          data.y,
                                          color: ColorRes.color_61BDFF,
                                        ),
                                        StackedBarSeries<ChartData, String>(
                                          dataSource: chartData,
                                          xValueMapper: (ChartData data, _) =>
                                          data.x,
                                          yValueMapper: (ChartData data, _) =>
                                          data.y,
                                          color: ColorRes.color_3294DB,
                                        ),
                                        StackedBarSeries<ChartData, String>(
                                          dataSource: chartData,
                                          xValueMapper: (ChartData data, _) =>
                                          data.x,
                                          yValueMapper: (ChartData data, _) =>
                                          data.y,
                                          color: ColorRes.color_73E6FF,
                                        ),
                                        StackedBarSeries<ChartData, String>(
                                          dataSource: chartData,
                                          xValueMapper: (ChartData data, _) =>
                                          data.x,
                                          yValueMapper: (ChartData data, _) =>
                                          data.y,
                                          color: ColorRes.color_4075FF,
                                        ),
                                        StackedBarSeries<ChartData, String>(
                                          dataSource: chartData,
                                          xValueMapper: (ChartData data, _) =>
                                          data.x,
                                          yValueMapper: (ChartData data, _) =>
                                          data.y,
                                          color: ColorRes.color_FF61D3,
                                        )
                                      ])),

                              Padding(padding: EdgeInsets.only(right: 10),
                                child: Column(
                                  children: [
                                    SizedBox(height: 20,),
                                    Container(
                                      alignment: Alignment.center,
                                      height: 55,
                                      width: 55,
                                      decoration: BoxDecoration(
                                        color: ColorRes.white,
                                        borderRadius: BorderRadius.circular(40),
                                        border: Border.all(
                                            color: Colors.grey),
                                        boxShadow:  [
                                          BoxShadow(
                                              color: Colors.grey.shade300,
                                              offset: Offset(0, 5),
                                              blurRadius: 5,
                                              spreadRadius: 5
                                          ),
                                        ],),
                                      child: Text("225", style: TextStyle(fontWeight: FontWeight.w500, color: ColorRes.black),),
                                    ),
                                    SizedBox(height: 5,),
                                    Container(
                                      alignment: Alignment.center,
                                      height: 55,
                                      width: 55,
                                      decoration: BoxDecoration(
                                        color: ColorRes.white,
                                        borderRadius: BorderRadius.circular(40),
                                        border: Border.all(
                                            color: Colors.grey),
                                        boxShadow:  [
                                          BoxShadow(
                                              color: Colors.grey.shade300,
                                              offset: Offset(0, 5),
                                              blurRadius: 5,
                                              spreadRadius: 5
                                          ),
                                        ],),
                                      child: Text("60", style: TextStyle(fontWeight: FontWeight.w500, color: ColorRes.black),),
                                    ),
                                    SizedBox(height: 5,),
                                    Container(
                                      alignment: Alignment.center,
                                      height: 55,
                                      width: 55,
                                      decoration: BoxDecoration(
                                        color: ColorRes.white,
                                        borderRadius: BorderRadius.circular(40),
                                        border: Border.all(
                                            color: Colors.grey),
                                        boxShadow:  [
                                          BoxShadow(
                                              color: Colors.grey.shade300,
                                              offset: Offset(0, 5),
                                              blurRadius: 5,
                                              spreadRadius: 5
                                          ),
                                        ],),
                                      child: Text("198", style: TextStyle(fontWeight: FontWeight.w500, color: ColorRes.black),),
                                    ),
                                    SizedBox(height: 5,),
                                    Container(
                                      alignment: Alignment.center,
                                      height: 55,
                                      width: 55,
                                      decoration: BoxDecoration(
                                        color: ColorRes.white,
                                        borderRadius: BorderRadius.circular(40),
                                        border: Border.all(
                                            color: Colors.grey),
                                        boxShadow:  [
                                          BoxShadow(
                                              color: Colors.grey.shade300,
                                              offset: Offset(0, 5),
                                              blurRadius: 5,
                                              spreadRadius: 5
                                          ),
                                        ],),
                                      child: Text("80", style: TextStyle(fontWeight: FontWeight.w500, color: ColorRes.black),),
                                    ),
                                  ],
                                ),),
                            ],
                          ),
                        ],
                      ),
                    );
                  });
            },
            child: Row(
              children: [
                Image.asset(
                  AssetRes.advertiserViews,
                  height: 22,
                  width: 22,
                ),
                // Text(
                //   "563 views",
                //   style: gilroyRegularTextStyle(fontSize: 14),
                // )
              ],
            ),
          )*/

          /*        const SizedBox(
            height: 87,
          ),*/
          /*     SubmitButton(
            onTap: () {
              // Get.to(() => SetupDateScreen());
            },
            child: Text(
              "Next",
              style: gilroyBoldTextStyle(fontSize: 16, color: ColorRes.black),
            ),
          ),*/
          /*   const SizedBox(
            height: 42.01,
          ),*/
        ],
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);

  final String x;
  final double y;
}

final List<ChartData> chartData = [
  ChartData('week1', 80),
  ChartData('week2', 198),
  ChartData('week3', 60),
  ChartData('week4', 225),
];
