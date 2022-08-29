import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/screens/advertisement/ad_home/ad_home_controller.dart';
import 'package:rainbow/screens/advertisement/ad_home/widget/advertiementApproved_screen.dart';
import 'package:rainbow/screens/advertisement/ad_home/widget/cancel_approve.dart';
import 'package:rainbow/screens/advertisement/ad_home/widget/delet_approve.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/color_res.dart';

Widget advertisementList() {
  AdHomeController controller = Get.put(AdHomeController());
  return Expanded(
    child: SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: ListView.builder(
        itemCount: controller.myAdvertiserModel.data?.length ?? 0,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Get.to(() => AdvertisementDetailsApprovedScreen());
            },
            child: Container(
              height: 202,
              width: Get.width - 60,
              padding: EdgeInsets.zero,
              margin:  const EdgeInsets.only(bottom: 14, left: 30, right: 30),
                 decoration:  BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ColorRes.white,
              ),
              child: Stack(
                children: [
                  ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: controller.myAdvertiserModel.data?[index]
                            .itemsList?.length ??
                        0,
                    itemBuilder: (context, index1) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: FadeInImage(
                          placeholder:
                              const AssetImage(AssetRes.placeholderImage),
                          image: NetworkImage(
                            controller.myAdvertiserModel.data![index]
                                .itemsList![index1]
                                .toString(),
                          ),width: Get.width - 60,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  ),
                  InkWell(
                    onTap: controller.onCloseMenu,
                    child: Column(
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
                                    controller.myAdvertiserModel.data?[index]
                                            .adminStatus ??
                                        "",
                                    style: gilroySemiBoldTextStyle(
                                        fontSize: 18,
                                        color: controller.myAdvertiserModel.data?[index]
                                            .adminStatus.toString() == "pending"?ColorRes.color_FFA620:ColorRes.color_49A510),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  controller.myAdvertiserModel.data?[index]
                                      .adminStatus.toString() == "pending"?SizedBox():Text(
                                    controller.myAdvertiserModel.data?[index]
                                            .status ??
                                        "",
                                    style: gilroyMediumTextStyle(
                                        fontSize: 10,
                                        color: ColorRes.color_F86666),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            InkWell(
                              onTap: () => controller.onTapMore(index),
                              child: Container(
                                margin: const EdgeInsets.only(
                                    top: 5, left: 10, right: 10, bottom: 10),
                                child: const Icon(
                                  Icons.more_horiz,
                                  color: ColorRes.white,
                                  shadows: [
                                    Shadow(
                                        color: ColorRes.black, blurRadius: 1.5)
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
                          padding: const EdgeInsets.only(left: 18, right: 18),
                          alignment: Alignment.center,
                          child: Row(
                            children: [
                              Text(
                                controller.myAdvertiserModel.data?[index].amount??"mom",
                                style: gilroySemiBoldTextStyle(
                                    fontSize: 14, color: ColorRes.black),
                              ),
                              const Spacer(),
                              Text(
                                controller.myAdvertiserModel.data?[index].amount??"\$",
                                style: gilroySemiBoldTextStyle(
                                    fontSize: 14, color: ColorRes.black),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 10,
                    top: 20,
                    child: GetBuilder<AdHomeController>(
                        id: 'more',
                        builder: (controller) {
                          return controller.moreOption[index] == true
                              ? (controller.myAdvertiserModel.data?[index].adminStatus == "approve")
                              ? Container(
                                  height: 115,
                                  width: Get.width * 0.40,
                                  color: ColorRes.color_50369C,
                                  child: ListView.separated(
                                    itemBuilder: (context, index) {
                                      return Container(
                                        padding: const EdgeInsets.all(9),
                                        child: InkWell(
                                          onTap: () {
                                            if (index == 0) {
                                              Get.to( DeletApprove(idAdvertiser: controller.myAdvertiserModel.data![index].id.toString(),));
                                            } else if (index == 2) {
                                              Get.to( CancelApprove(idAdvertiser: controller.myAdvertiserModel.data![index].id.toString(),));
                                            }
                                            print(index);
                                          },
                                          child: Row(
                                            children: [
                                              Container(
                                                height: 20,
                                                width: 35,
                                                padding:
                                                    const EdgeInsets.all(2.5),
                                                decoration: BoxDecoration(
                                                  color: index == 1
                                                      ? ColorRes.color_D18EEE
                                                      : ColorRes.color_F86666,
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(10)),
                                                ),
                                                child: Image.asset(
                                                  index == 0
                                                      ? AssetRes.deleteIcon
                                                      : index == 1
                                                          ? AssetRes
                                                              .calendarIcon
                                                          : AssetRes.blockIcon,
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
                                                style: gilroyMediumTextStyle(
                                                    fontSize: 14),
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                    separatorBuilder: (context, index) {
                                      return Divider(
                                        height: 0,
                                        color: ColorRes.white.withOpacity(0.5),
                                      );
                                    },
                                    itemCount: 3,
                                  ),
                                )
                              : Container(
                            height:80,
                            width: Get.width * 0.40,
                            color: ColorRes.color_50369C,
                            child: ListView.separated(
                              itemBuilder: (context, index) {
                                return Container(
                                  padding: const EdgeInsets.all(9),
                                  child: InkWell(
                                    onTap: () {
                                      if (index == 0) {
                                        Get.to( DeletApprove(idAdvertiser: controller.myAdvertiserModel.data![index].id.toString(),));
                                      }
                                      else if(index == 1){
                                       controller.followUpAdvertiser(controller.myAdvertiserModel.data![index].id.toString(), context);
                                      }
                                      print(index);
                                    },
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 20,
                                          width: 35,
                                          padding:
                                          const EdgeInsets.all(2.5),
                                          decoration: BoxDecoration(
                                            color: index == 0
                                                ? ColorRes.color_D18EEE
                                                : ColorRes.color_49A510,
                                            borderRadius:
                                            const BorderRadius.all(
                                                Radius.circular(10)),
                                          ),
                                          child: Image.asset(
                                            index == 0
                                                ? AssetRes.deleteIcon
                                                : AssetRes.calendarIcon,
                                            height: 15,
                                            width: 15,
                                          ),
                                        ),
                                        SizedBox(width: 3,),
                                        Text(
                                          index == 0
                                              ? " Delete"
                                              : " Follow Up",
                                          style: gilroyMediumTextStyle(
                                              fontSize: 14),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return Divider(
                                  height: 0,
                                  color: ColorRes.white.withOpacity(0.5),
                                );
                              },
                              itemCount: 2,
                            ),
                          )
                              :SizedBox();
                        }),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    ),
  );
}
