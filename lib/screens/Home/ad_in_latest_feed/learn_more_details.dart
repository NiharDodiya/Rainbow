import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/screens/Home/home_controller.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/color_res.dart';
import 'package:rainbow/utils/strings.dart';

class LearnMoreDetails extends StatelessWidget {
  int? index;
   LearnMoreDetails({required this.index,Key? key}) : super(key: key);

  HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorRes.white,
        elevation: 0,
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
      body: Container(
        height: Get.height,
        width: Get.width,
        color: ColorRes.white,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const Divider(
                thickness: 1,
                color: Colors.grey,
              ),
              const SizedBox(
                height: 20,
              ),
             Padding(
               padding: EdgeInsets.only(left: 15, right: 15),
               child:  Row(
                 children: [
                   (homeController.advertisementListUserModel.data?[index!].userDetails?.profileImage == null || homeController.advertisementListUserModel.data?[index!].userDetails?.profileImage == "")
                       ?Container(
                     height: 40,
                     width: 40,
                     decoration:  BoxDecoration(
                         shape: BoxShape.circle,
                         image: DecorationImage(
                             image: AssetImage(AssetRes.portrait_placeholder))),
                   )
                       :Container(
                     height: 40,
                     width: 40,
                     decoration:  BoxDecoration(
                         shape: BoxShape.circle,
                         image: DecorationImage(
                             image: NetworkImage(homeController.advertisementListUserModel.data?[index!].userDetails?.profileImage ?? ""))),
                   ),
                   SizedBox(width: 10),
                   Padding(
                     padding: const EdgeInsets.only(top: 9),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text(
                           homeController.advertisementListUserModel.data?[index!].userDetails?.fullName.toString() ?? "",
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
             ),
              const SizedBox(
                height: 12,
              ),
              GetBuilder<HomeController>(
                  id: "img",
                  builder: (controller){
                    return  Container(
                      height: Get.width * 0.51,
                      //width: Get.width * 0.98833,
                      padding: const EdgeInsets.only(
                           top: 10, bottom: 12, left: 15, right: 15),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                        child:  Stack(
                          children: [
                            (homeController.advertisementListUserModel.data?[index!].itemsList!.length == 0)
                                ? Image.asset(
                              AssetRes.placeholderImage,
                              width: Get.width ,
                              fit: BoxFit.cover,
                            )
                                : PageView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: homeController
                                  .advertisementListUserModel.data?[index!].itemsList!.length,
                              onPageChanged: (index) {
                                homeController.pageIndex = index;
                                homeController.update(["img"]);
                              },
                              itemBuilder: (context, index1) {
                                return SizedBox(
                                  width: Get.width,
                                  child: FadeInImage(
                                    placeholder:
                                    const AssetImage(AssetRes.placeholderImage),
                                    image: NetworkImage(
                                      homeController.advertisementListUserModel.data![index!]
                                          .itemsList![index1]
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
                                SizedBox(height: 40,),
                                (homeController.advertisementListUserModel.data?[index!].itemsList!.length == 1 || homeController.advertisementListUserModel.data?[index!].itemsList!.length == 0)
                                    ? const SizedBox()
                                    : Padding(
                                  padding: const EdgeInsets.only(top: 100),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: CarouselIndicator(
                                      cornerRadius: 30,
                                      height: 6,
                                      width: 6,
                                      count: homeController.advertisementListUserModel
                                          .data?[index!].itemsList!.length,
                                      index:
                                      homeController.pageIndex,
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
              const SizedBox(
                height: 19,
              ),
             Padding(
               padding: EdgeInsets.only(left: 15, right: 15),
               child:  SizedBox(
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
                       homeController.advertisementListUserModel.data?[index!].description ?? "",
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
             ),
            ],
          ),
        ),
      ),
    );
  }
}
