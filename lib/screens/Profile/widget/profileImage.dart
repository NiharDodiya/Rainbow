import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/color_res.dart';

Widget profileImage(/*ProfileController controller*/ String? profileImage,
    String? bgImage, bool? showImages) {
  return SizedBox(
    height: Get.height * 0.415,
    width: Get.width,
    child: Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: SizedBox(
            height: Get.height * 0.2857,
            width: Get.width,
            child: showImages == false
                ? Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorRes.black.withOpacity(0.2),
                    ),
                    child: Image.asset(
                      AssetRes.rainBowLogo,
                      fit: BoxFit.fitWidth,
                    ),
                  )
                : CachedNetworkImage(
                    imageUrl: bgImage.toString(),
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    // placeholder: (context, url) => const Center(child:CircularProgressIndicator(),),
                    errorWidget: (context, url, error) => Container(
                      height: Get.height * 0.2857,
                      width: Get.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                          image: AssetImage(AssetRes.placeholderImage),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
          ),
        ),
        Positioned(
          top: Get.height * 0.11,
          left: Get.width * 0.30,
          child: SizedBox(
            height: Get.height * 0.38666,
            width: Get.width * 0.38666,
            child: showImages == false
                ? Container(
                    padding: EdgeInsets.all(Get.width * 0.11),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [
                          ColorRes.color_50369C,
                          ColorRes.color_D18EEE,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: Center(
                      child: Image.asset(AssetRes.duck),
                    ),
                  )
                : CachedNetworkImage(
                    imageUrl: profileImage.toString(),
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    // placeholder: (context, url) => const Center(child:CircularProgressIndicator(),),
                    errorWidget: (context, url, error) => Container(
                        decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(AssetRes.portrait_placeholder),
                      ),
                    )),
                  ),
          ),
        ),
        Positioned(
          top: Get.height * 0.35,
          left: Get.width * 0.599,
          child: Container(
            height: 30,
            width: 30,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(AssetRes.checkMark),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
