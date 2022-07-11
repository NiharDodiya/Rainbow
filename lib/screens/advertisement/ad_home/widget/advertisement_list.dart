import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/screens/advertisement/ad_home/ad_home_controller.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/color_res.dart';

Widget advertisementList() {
  AdHomeController controller = Get.find<AdHomeController>();
  return Expanded(
    child: SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: ListView.builder(
        itemCount: controller.imageList.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => Container(
          height: 202,
          width: Get.width - 60,
          padding: EdgeInsets.zero,
          margin: const EdgeInsets.only(bottom: 14, left: 30, right: 30),
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                controller.imageList[index],
              ),
            ),
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            color: ColorRes.white,
          ),
          child: Stack(
            children: [
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
                        child: Column(children: [
                          Text(
                            "Approve",
                            style: gilroySemiBoldTextStyle(
                                fontSize: 18, color: ColorRes.color_49A510),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Not Active",
                            style: gilroyMediumTextStyle(
                                fontSize: 10, color: ColorRes.color_F86666),
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
                              Shadow(color: ColorRes.black, blurRadius: 1.5)
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
                        )),
                    padding: const EdgeInsets.only(left: 18, right: 18),
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        Text(
                          controller.stringList[index],
                          style: gilroySemiBoldTextStyle(
                              fontSize: 14, color: ColorRes.black),
                        ),
                        const Spacer(),
                        Text(
                          '\$200',
                          style: gilroySemiBoldTextStyle(
                              fontSize: 14, color: ColorRes.black),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                right: 10,
                top: 20,
                child: GetBuilder<AdHomeController>(
                    id: 'more',
                    builder: (controller) => controller.moreOption[index]
                        ? Container(
                            height: 115,
                            width: Get.width * 0.40,
                            color: ColorRes.color_50369C,
                            child: ListView.separated(
                              itemBuilder: (context, index) {
                                return Container(
                                  padding: EdgeInsets.all(9),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 20,
                                        width: 35,
                                        padding: EdgeInsets.all(2.5),
                                        decoration: BoxDecoration(
                                          color: index == 1
                                              ? ColorRes.color_D18EEE
                                              : ColorRes.color_F86666,
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10)),
                                        ),
                                        child: Image.asset(
                                          index == 0
                                              ? AssetRes.deleteIcon
                                              : index == 1
                                                  ? AssetRes.calendarIcon
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
                                        style:
                                            gilroyMediumTextStyle(fontSize: 14),
                                      )
                                    ],
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
                        : SizedBox()),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
