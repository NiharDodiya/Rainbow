import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/common/popup.dart';
import 'package:rainbow/model/payment_advertise.dart';
import 'package:rainbow/screens/Profile/widget/profile_appbar.dart';
import 'package:rainbow/screens/advertisement/ad_home/ad_home_controller.dart';
import 'package:rainbow/screens/advertisement/ad_home/screen/renewAdSetupDate/api/renewAd_api.dart';
import 'package:rainbow/screens/advertisement/ad_home/screen/renewAdSetupDate/renewSetUp_Screen.dart';

import 'package:rainbow/screens/advertisement/ad_home/widget/advertiementApproved_screen.dart';
import 'package:rainbow/screens/advertisement/ad_home/widget/cancel_approve.dart';
import 'package:rainbow/screens/advertisement/ad_home/widget/delet_approve.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/color_res.dart';

Widget advertisementList() {
  AdHomeController controller = Get.put(AdHomeController());

  return Expanded(
      child: RefreshIndicator(
        onRefresh: controller.onRefresh,
        child: GetBuilder<AdHomeController>(
          id: "more",
            builder: (controller){
          return ListView.builder(
            controller: controller.scrollController,
            itemCount: controller.myAdList.length, //controller.myAdvertiserModel.data?.length ?? 0,
            shrinkWrap: true,
            physics: const AlwaysScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () async{
                     PaymentAdvertiseModel paymentAdvertiseModel = PaymentAdvertiseModel();

                      paymentAdvertiseModel = await AdvPaymentApi.advPaymentApi(idAd: controller.myAdList[index].id ?? 0);

                     Get.to(AdvertisementDetailsApprovedScreen(
                       i: index,
                       id: controller.myAdList[index].id ?? 0, //controller.myAdvertiserModel.data?[index].id ?? 0,
                       traId: paymentAdvertiseModel.data?.transactionId ?? "",
                     ));
                    },
                    child: Container(
                      height: 202,
                      width: Get.width - 60,
                      padding: EdgeInsets.zero,
                      margin:
                      const EdgeInsets.only(bottom: 14, left: 30, right: 30),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ColorRes.white,
                      ),
                      child: GetBuilder<AdHomeController>(
                          id: "network",
                          builder: (adHomeController) {
                            adHomeController.checkUserConnection();
                            return InkWell(
                              onTap: adHomeController.activeConnection == false
                                  ? () {
                                errorToast("No internet connection");
                              }
                                  : () async{
                                PaymentAdvertiseModel paymentAdvertiseModel = PaymentAdvertiseModel();


                                paymentAdvertiseModel = await AdvPaymentApi.advPaymentApi(idAd: controller.myAdList[index].id ?? 0);


                                (controller.moreOption[index] == true)
                                    ? controller.onCloseMenu()
                                    : Get.to(
                                    AdvertisementDetailsApprovedScreen(
                                      i: index,
                                      id: controller.myAdList[index].id??0,//controller.myAdvertiserModel.data?[index].id ?? 0,
                                      traId: paymentAdvertiseModel.data?.transactionId ?? "",
                                    ));
                              },
                              child: Stack(
                                children: [
                                  (controller.myAdList[index]
                                      .itemsList!.length ==
                                      0)
                                      ? Container(
                                    width: Get.width - 60,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(10),
                                        image: const DecorationImage(
                                            image: AssetImage(
                                                AssetRes.placeholderImage),
                                            fit: BoxFit.cover)),
                                  )
                                      : PageView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: controller.myAdList[index].itemsList!.length,
                                    itemBuilder: (context, index1) {
                                      return Row(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                            BorderRadius.circular(10),
                                            child: Container(
                                              width: Get.width - 60,
                                              child: CachedNetworkImage(
                                                imageUrl: controller.myAdList[index]
                                                    .itemsList![index1]
                                                    .toString(),
                                                fit: BoxFit.cover,
                                                placeholder: ((context,
                                                    url) =>
                                                    Image.asset(
                                                      AssetRes
                                                          .placeholderImage,
                                                      width: Get.width - 60,
                                                      fit: BoxFit.cover,
                                                    )),
                                                errorWidget: ((context, url,
                                                    error) =>
                                                    Image.asset(
                                                      AssetRes
                                                          .placeholderImage,
                                                      width: Get.width - 60,
                                                      fit: BoxFit.cover,
                                                    )),
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                  Column(
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 101,
                                            alignment: Alignment.center,
                                            padding: const EdgeInsets.all(10),
                                            decoration: const BoxDecoration(
                                                color: ColorRes.white,
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(8),
                                                )),
                                            child: Column(
                                              children: [
                                                Text(
                                                  controller.myAdList[index]
                                                      .adminStatus ??
                                                      "",
                                                  style: gilroySemiBoldTextStyle(
                                                      fontSize: 18,
                                                      color: controller.myAdList[index]
                                                          .adminStatus
                                                          .toString() ==
                                                          "pending"
                                                          ? ColorRes.colorFFA620
                                                          : controller.myAdList[index]
                                                          .adminStatus
                                                          .toString() ==
                                                          "rejected"
                                                          ? const Color(
                                                          0xffFF3C3C)
                                                          : ColorRes
                                                          .color_49A510),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                (controller.myAdList[index]
                                                    .adminStatus
                                                    .toString() ==
                                                    "pending" ||
                                                    controller.myAdList[index]
                                                        .adminStatus
                                                        .toString() ==
                                                        "rejected")
                                                    ? const SizedBox()
                                                    : Text(
                                                  controller.myAdList[index]
                                                      .status ??
                                                      "",
                                                  style:
                                                  gilroyMediumTextStyle(
                                                      fontSize: 10,
                                                      color: ColorRes
                                                          .colorF86666),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const Spacer(),
                                          InkWell(
                                            onTap: () =>
                                                controller.onTapMore(index),
                                            child: Container(
                                              margin: const EdgeInsets.only(
                                                  top: 5,
                                                  left: 10,
                                                  right: 10,
                                                  bottom: 10),
                                              child: const Icon(
                                                Icons.more_horiz,
                                                color: ColorRes.white,
                                                shadows: [
                                                  Shadow(
                                                      color: ColorRes.black,
                                                      blurRadius: 1.5)
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      const Spacer(),
                                      Container(
                                        height: 52,
                                        decoration: const BoxDecoration(
                                          color: ColorRes.white,
                                          borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(8),
                                            bottomLeft: Radius.circular(8),
                                          ),
                                        ),
                                        padding: const EdgeInsets.only(
                                            left: 18, right: 18),
                                        alignment: Alignment.center,
                                        child: Row(
                                          children: [
                                            Text(
                                              controller.myAdList[index].title ??
                                                  "",
                                              style: gilroySemiBoldTextStyle(
                                                  fontSize: 14,
                                                  color: ColorRes.black),
                                            ),
                                            const Spacer(),
                                            Text(
                                              "£${controller.myAdList[index].amount ?? ""}",
                                              style: gilroySemiBoldTextStyle(
                                                  fontSize: 14,
                                                  color: ColorRes.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  GetBuilder<AdHomeController>(
                                      id: 'more',
                                      builder: (controller) {
                                        return controller.moreOption[index] == true
                                            ? (controller.myAdList[index].adminStatus ==
                                            "approve")
                                            ? Align(
                                          alignment: Alignment.topRight,
                                          child: Container(
                                            height: 115,
                                            width: Get.width * 0.40,
                                            color: ColorRes.color_50369C,
                                            child: ListView.separated(
                                              itemBuilder:
                                                  (context, index1) {
                                                return Container(
                                                  padding:
                                                  const EdgeInsets
                                                      .all(9),
                                                  child: InkWell(
                                                    onTap: adHomeController
                                                        .activeConnection ==
                                                        false
                                                        ? () {
                                                      errorToast(
                                                          "No internet connection");
                                                    }
                                                        : () {
                                                      if (index1 ==
                                                          0) {
                                                        Get.to(
                                                            DeleteApprove(
                                                              idAdvertiser: controller.myAdList[
                                                              index]
                                                                  .id
                                                                  .toString(),
                                                            ));
                                                      } else if (index1 ==
                                                          1) {
                                                        Get.to(RenewSetupScreen(idAdvertiser: controller.myAdList[index].id));
                                                      } else if (index1 ==
                                                          2) {
                                                        Get.to(
                                                            CancelApprove(
                                                              idAdvertiser: controller.myAdList[
                                                              index]
                                                                  .id
                                                                  .toString(),
                                                            ));
                                                      }
                                                    },
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          height: 20,
                                                          width: 35,
                                                          padding:
                                                          const EdgeInsets
                                                              .all(
                                                              2.5),
                                                          decoration:
                                                          BoxDecoration(
                                                            color: index1 ==
                                                                1
                                                                ? ColorRes
                                                                .colorD18EEE
                                                                : ColorRes
                                                                .colorF86666,
                                                            borderRadius: const BorderRadius
                                                                .all(
                                                                Radius.circular(
                                                                    10)),
                                                          ),
                                                          child:
                                                          Image.asset(
                                                            index1 == 0
                                                                ? AssetRes
                                                                .deleteIcon
                                                                : index1 ==
                                                                1
                                                                ? AssetRes
                                                                .calendarIcon
                                                                : AssetRes
                                                                .blockIcon,
                                                            height: 15,
                                                            width: 15,
                                                          ),
                                                        ),
                                                        Text(
                                                          index1== 0
                                                              ? " Delete"
                                                              : index1 == 1
                                                              ? " Renew Ads"
                                                              : " Cancel Ads",
                                                          style:
                                                          gilroyMediumTextStyle(
                                                              fontSize:
                                                              14),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                              separatorBuilder:
                                                  (context, index) {
                                                return Divider(
                                                  height: 0,
                                                  color: ColorRes.white
                                                      .withOpacity(0.5),
                                                );
                                              },
                                              itemCount: 3,
                                            ),
                                          ),
                                        )
                                            : Align(
                                          alignment: Alignment.topRight,
                                          child: Container(
                                            height: 80,
                                            width: Get.width * 0.40,
                                            color: ColorRes.color_50369C,
                                            child: ListView.separated(
                                              itemBuilder:
                                                  (context, index1) {
                                                return Container(
                                                  padding:
                                                  const EdgeInsets
                                                      .all(9),
                                                  child: InkWell(
                                                    onTap: () {
                                                      if (index1 == 0) {
                                                        Get.to(
                                                            DeleteApprove(
                                                              idAdvertiser: controller.myAdList[
                                                              index]
                                                                  .id
                                                                  .toString(),
                                                            ));
                                                      } else if (index1 ==
                                                          1) {
                                                        controller.followUpAdvertiser(
                                                            controller.myAdList[
                                                            index]
                                                                .id
                                                                .toString(),
                                                            context);
                                                      }
                                                    },
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          height: 20,
                                                          width: 35,
                                                          padding:
                                                          const EdgeInsets
                                                              .all(
                                                              2.5),
                                                          decoration:
                                                          BoxDecoration(
                                                            color: index1 ==
                                                                0
                                                                ? ColorRes
                                                                .colorD18EEE
                                                                : ColorRes
                                                                .color_49A510,
                                                            borderRadius: const BorderRadius
                                                                .all(
                                                                Radius.circular(
                                                                    10)),
                                                          ),
                                                          child:
                                                          Image.asset(
                                                            index1 == 0
                                                                ? AssetRes
                                                                .deleteIcon
                                                                : AssetRes
                                                                .calendarIcon,
                                                            height: 15,
                                                            width: 15,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 3,
                                                        ),
                                                        Text(
                                                          index1 == 0
                                                              ? " Delete"
                                                              : " Follow Up",
                                                          style:
                                                          gilroyMediumTextStyle(
                                                              fontSize:
                                                              14),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                              separatorBuilder:
                                                  (context, index) {
                                                return Divider(
                                                  height: 0,
                                                  color: ColorRes.white
                                                      .withOpacity(0.5),
                                                );
                                              },
                                              itemCount: 2,
                                            ),
                                          ),
                                        )
                                            : const SizedBox();
                                      }),
                                ],
                              ),
                            );
                          }),
                    ),
                  ),
                ],
              );
            },
          );
        })
      ),
  );
}

/*
RefreshIndicator(
        onRefresh: () => controller.onRefresh(),
        child: ListView.builder(
          itemCount: controller.myAdvertiserModel.data?.length ?? 0,
          shrinkWrap: true,
          physics: const AlwaysScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Get.to(AdvertisementDetailsApprovedScreen(
                      i: index,
                      id: controller.myAdvertiserModel.data?[index].id ?? 0,
                    ));
                  },
                  child: Container(
                    height: 202,
                    width: Get.width - 60,
                    padding: EdgeInsets.zero,
                    margin:
                    const EdgeInsets.only(bottom: 14, left: 30, right: 30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorRes.white,
                    ),
                    child: InkWell(
                      onTap: () {
                        (controller.moreOption[index] == true)
                            ? controller.onCloseMenu()
                            : Get.to(AdvertisementDetailsApprovedScreen(
                          i: index,
                          id: controller
                              .myAdvertiserModel.data?[index].id ??
                              0,
                        ));
                      },
                      child: Stack(
                        children: [
                          (controller.myAdvertiserModel.data?[index].itemsList!.length == 0)
                              ?Container(
                            width: Get.width - 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: const DecorationImage(
                                    image: AssetImage(
                                        AssetRes.placeholderImage
                                    ),
                                    fit: BoxFit.cover)),
                          )
                              :PageView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: controller
                                .myAdvertiserModel.data?[index].itemsList!.length,
                            itemBuilder: (context, index1) {
                              return Row(
                                children: [
                                  Container(
                                    width: Get.width - 60,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                              controller.myAdvertiserModel
                                                  .data![index].itemsList![index1]
                                                  .toString(),
                                            ),
                                            fit: BoxFit.cover)),
                                  ),
                                ],
                              );
                            },
                          ),
                          Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 101,
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.all(10),
                                    decoration: const BoxDecoration(
                                        color: ColorRes.white,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(8),
                                        )),
                                    child: Column(
                                      children: [
                                        Text(
                                          controller.myAdvertiserModel
                                              .data?[index].adminStatus ??
                                              "",
                                          style: gilroySemiBoldTextStyle(
                                              fontSize: 18,
                                              color: controller
                                                  .myAdvertiserModel
                                                  .data?[index]
                                                  .adminStatus
                                                  .toString() == "pending"
                                                  ? ColorRes.colorFFA620
                                                  : controller
                                                  .myAdvertiserModel
                                                  .data?[index]
                                                  .adminStatus
                                                  .toString() == "rejected"
                                                  ?const Color(0xffFF3C3C)
                                                  :ColorRes.color_49A510
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        (controller.myAdvertiserModel.data?[index]
                                            .adminStatus
                                            .toString() ==
                                            "pending" || controller.myAdvertiserModel.data?[index]
                                            .adminStatus
                                            .toString() ==
                                            "rejected")
                                            ? const SizedBox()
                                            : Text(
                                          controller.myAdvertiserModel
                                              .data?[index].status ??
                                              "",
                                          style: gilroyMediumTextStyle(
                                              fontSize: 10,
                                              color: ColorRes.colorF86666),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                  InkWell(
                                    onTap: () => controller.onTapMore(index),
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                          top: 5,
                                          left: 10,
                                          right: 10,
                                          bottom: 10),
                                      child: const Icon(
                                        Icons.more_horiz,
                                        color: ColorRes.white,
                                        shadows: [
                                          Shadow(
                                              color: ColorRes.black,
                                              blurRadius: 1.5)
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              const Spacer(),
                              Container(
                                height: 52,
                                decoration: const BoxDecoration(
                                  color: ColorRes.white,
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(8),
                                    bottomLeft: Radius.circular(8),
                                  ),
                                ),
                                padding:
                                const EdgeInsets.only(left: 18, right: 18),
                                alignment: Alignment.center,
                                child: Row(
                                  children: [
                                    Text(
                                      controller.myAdvertiserModel.data?[index]
                                          .title ??
                                          "",
                                      style: gilroySemiBoldTextStyle(
                                          fontSize: 14, color: ColorRes.black),
                                    ),
                                    const Spacer(),
                                    Text(
                                      controller.myAdvertiserModel.data?[index]
                                          .amount ??
                                          "\$",
                                      style: gilroySemiBoldTextStyle(
                                          fontSize: 14, color: ColorRes.black),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          GetBuilder<AdHomeController>(
                              id: 'more',
                              builder: (controller) {
                                return controller.moreOption[index] == true
                                    ? (controller.myAdvertiserModel.data?[index]
                                    .adminStatus ==
                                    "approve")
                                    ? Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                    height: 115,
                                    width: Get.width * 0.40,
                                    color: ColorRes.color_50369C,
                                    child: ListView.separated(
                                      itemBuilder: (context, index) {
                                        return Container(
                                          padding:
                                          const EdgeInsets.all(9),
                                          child: InkWell(
                                            onTap: () {
                                              if (index == 0) {
                                                Get.to(DeleteApprove(
                                                  idAdvertiser: controller
                                                      .myAdvertiserModel
                                                      .data![index]
                                                      .id
                                                      .toString(),
                                                ));
                                              } else if (index == 2) {
                                                Get.to(CancelApprove(
                                                  idAdvertiser: controller
                                                      .myAdvertiserModel
                                                      .data![1]
                                                      .id
                                                      .toString(),
                                                ));
                                              }
                                              else{

                                              }
                                              print(index);
                                            },
                                            child: Row(
                                              children: [
                                                Container(
                                                  height: 20,
                                                  width: 35,
                                                  padding:
                                                  const EdgeInsets
                                                      .all(2.5),
                                                  decoration:
                                                  BoxDecoration(
                                                    color: index == 1
                                                        ? ColorRes
                                                        .colorD18EEE
                                                        : ColorRes
                                                        .colorF86666,
                                                    borderRadius:
                                                    const BorderRadius
                                                        .all(
                                                        Radius
                                                            .circular(
                                                            10)),
                                                  ),
                                                  child: Image.asset(
                                                    index == 0
                                                        ? AssetRes
                                                        .deleteIcon
                                                        : index == 1
                                                        ? AssetRes
                                                        .calendarIcon
                                                        : AssetRes
                                                        .blockIcon,
                                                    height: 15,
                                                    width: 15,
                                                  ),
                                                ),
                                                Text(
                                                  index == 0
                                                      ? " Delete"
                                                      : index == 1
                                                      ? " Renew Ads"
                                                      : " Cancel Ads",
                                                  style:
                                                  gilroyMediumTextStyle(
                                                      fontSize: 14),
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                      separatorBuilder:
                                          (context, index) {
                                        return Divider(
                                          height: 0,
                                          color: ColorRes.white
                                              .withOpacity(0.5),
                                        );
                                      },
                                      itemCount: 3,
                                    ),
                                  ),
                                )
                                    : Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                    height: 80,
                                    width: Get.width * 0.40,
                                    color: ColorRes.color_50369C,
                                    child: ListView.separated(
                                      itemBuilder: (context, index1) {
                                        return Container(
                                          padding:
                                          const EdgeInsets.all(9),
                                          child: InkWell(
                                            onTap: () {
                                              if (index1 == 0) {
                                                Get.to(DeleteApprove(
                                                  idAdvertiser: controller
                                                      .myAdvertiserModel
                                                      .data![index]
                                                      .id
                                                      .toString(),
                                                ));
                                              } else if (index1 == 1) {
                                                controller
                                                    .followUpAdvertiser(
                                                    controller
                                                        .myAdvertiserModel
                                                        .data![
                                                    index]
                                                        .id
                                                        .toString(),
                                                    context);
                                              }
                                              print(index1);
                                            },
                                            child: Row(
                                              children: [
                                                Container(
                                                  height: 20,
                                                  width: 35,
                                                  padding:
                                                  const EdgeInsets
                                                      .all(2.5),
                                                  decoration:
                                                  BoxDecoration(
                                                    color: index1 == 0
                                                        ? ColorRes
                                                        .colorD18EEE
                                                        : ColorRes
                                                        .color_49A510,
                                                    borderRadius:
                                                    const BorderRadius
                                                        .all(
                                                        Radius
                                                            .circular(
                                                            10)),
                                                  ),
                                                  child: Image.asset(
                                                    index1 == 0
                                                        ? AssetRes
                                                        .deleteIcon
                                                        : AssetRes
                                                        .calendarIcon,
                                                    height: 15,
                                                    width: 15,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 3,
                                                ),
                                                Text(
                                                  index1 == 0
                                                      ? " Delete"
                                                      : " Follow Up",
                                                  style:
                                                  gilroyMediumTextStyle(
                                                      fontSize: 14),
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                      separatorBuilder:
                                          (context, index) {
                                        return Divider(
                                          height: 0,
                                          color: ColorRes.white
                                              .withOpacity(0.5),
                                        );
                                      },
                                      itemCount: 2,
                                    ),
                                  ),
                                )
                                    : const SizedBox();
                              }),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
 */
