import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/utils/asset_res.dart';

Widget profileImage(
    /*ProfileController controller*/ String? profileImage, String? bgImage) {
  return SizedBox(
    height: Get.height*0.415,
    width: Get.width,
    child: Stack(
      children: [
        Padding(padding: const EdgeInsets.only(left: 15,right: 15),
          child: SizedBox(
            height: Get.height * 0.2857,
            width: Get.width,
            child: CachedNetworkImage(
              imageUrl: bgImage.toString(),
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,),
                ),
              ),
              // placeholder: (context, url) => const Center(child:CircularProgressIndicator(),),
              errorWidget: (context, url, error) =>
                  Container(
                    height: Get.height * 0.2857,
                    width: Get.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                            image: AssetImage(AssetRes.overlay),
                            fit: BoxFit.cover)),
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
            child: CachedNetworkImage(
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
              errorWidget: (context, url, error) =>
                  Image.asset(AssetRes.se_profile),
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
