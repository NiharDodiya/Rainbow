import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/color_res.dart';
import 'package:rainbow/utils/strings.dart';

class LearnMoreDetails extends StatelessWidget {
  const LearnMoreDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorRes.white,
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.chevron_left_outlined,
            color: ColorRes.black,
            size: 25,
          ),
        ),
        title: Text(
          "Details",
          style: beVietnamProBoldTextStyle(
            color: ColorRes.black,
            fontSize: 16,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          height: Get.height,
          width: Get.width,
          color: ColorRes.white,
          padding: const EdgeInsets.only(left: 19, right: 19),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage(AssetRes.selfiePicture))),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 9),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "My Company",
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
                const SizedBox(
                  height: 12,
                ),
                SizedBox(
                  height: Get.width * 0.43,
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: Image.asset(
                      AssetRes.adsDetail,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 19,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Surrogate Mom",
                        style: beVietnamProBoldTextStyle(
                          color: ColorRes.black,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 19,
                      ),
                      Text(
                        Strings.myCompanyDes +
                            Strings.myCompanyDes +
                            Strings.myCompanyDes,
                        style: beVietnamSemiBoldTextStyle(
                          color: ColorRes.darkBlue.withOpacity(0.6),
                          fontSize: 14,
                        ).copyWith(
                          letterSpacing: 0,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
