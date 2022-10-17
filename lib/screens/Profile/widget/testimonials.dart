import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/utils/asset_res.dart';

/*Widget testimonials({required bool testimonials, String? id}) {
  return Padding(
    padding: const EdgeInsets.only(left: 30, right: 30),
    child: SizedBox(
      // height: 435,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                Strings.testimonials,
                style: beVietnamProBoldTextStyle(fontSize: 18),
              ),
              const Spacer(),
              testimonials == false
                  ? const SizedBox()
                  : InkWell(
                      onTap: () {
                        Get.to(() => PostTestimonialScreen(
                              id: id.toString(),
                            ));
                      },
                      child: Text(
                        "Add",
                        style: beVietnamProBoldTextStyle(fontSize: 18),
                      ),
                    ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              Strings.noTestimonials,
              style: beVietnamProBoldTextStyle(
                  color: ColorRes.white.withOpacity(0.70), fontSize: 16),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ListView.separated(
            padding: const EdgeInsets.only(top: 15),
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return  listOfTestimonials(
                  title: controller.viewProfile.data!
                      .testimonialsList![index].userSender!.fullName.toString(),
                  subtitle: controller.viewProfile.data!
                      .testimonialsList![index].userSender!.userStatus.toString(),descriptions:controller.viewProfile.data!
                  .testimonialsList![index].testimonial.toString(),*/ /*date:DateFormat("Dd-MM-yyyy").format(controller.viewProfile.data!
                    .testimonialsList![index].userSender!.createdAt!)*/ /*profile:controller.viewProfile.data!
                  .testimonialsList![index].userSender!.profileImage.toString() );
            },
            separatorBuilder: (context, index) {
              return Divider(
                height: 24,
                color: ColorRes.white.withOpacity(0.7),
              );
            },
            itemCount: controller.viewProfile.data!.testimonialsList!.length,
            shrinkWrap: true,
          ),
          Divider(
            height: 25,
            color: ColorRes.white.withOpacity(0.7),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              iconForSlider(AssetRes.leftIcon),
              Container(
                height: 20,
                width: 30,
                margin: const EdgeInsets.only(bottom: 10, top: 5),
                alignment: Alignment.center,
                child: Text(
                  "1",
                  style: gilroyMediumTextStyle(fontSize: 14),
                ),
              ),
              iconForSlider(AssetRes.rightIcon),
            ],
          )
        ],
      ),
    ),
  );
}*/

Widget iconForSlider(String image) {
  return Container(
    height: 20,
    width: 20,
    margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 5),
    child: Image.asset(
      image,
      height: 20,
      width: 20,
    ),
  );
}

Widget listOfTestimonials(
    {String? title,
    String? subtitle,
    String? date,
    String? descriptions,
    String? profile}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          /*   profile.toString()==""? ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: SizedBox(   height: 50,
        width: 50,
        child:  Image.asset(AssetRes.portraitPlaceholder),

      )):*/
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.network(
              profile.toString(),
              height: 50,
              width: 50,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  AssetRes.portraitPlaceholder,
                  height: 50,
                  width: 50,
                );
              },
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: Get.width - 130,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        title ?? "Amber Davis",
                        overflow: TextOverflow.clip,
                        maxLines: 2,
                        style: gilroyRegularTextStyle(fontSize: 16),
                      ),
                    ),
                    Text(date ?? "7/28/2021",
                        style: gilroyRegularTextStyle(fontSize: 12)),
                  ],
                ),
              ),
              const SizedBox(height: 3),
              Text(
                subtitle ?? "SURROGATE MOM",
                style: gilroyRegularTextStyle(fontSize: 12),
              ),
            ],
          ),
        ],
      ),
      const SizedBox(height: 14),
      Text(
        descriptions.toString(),
        style: gilroyRegularTextStyle(fontSize: 14),
      ),
    ],
  );
}
