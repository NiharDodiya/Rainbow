import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rainbow/common/Widget/buttons.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/common/popup.dart';
import 'package:rainbow/screens/Home/settings/support/support_controller.dart';

import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/color_res.dart';
import 'package:rainbow/utils/strings.dart';

class SupportCreateEndUserScreen extends StatelessWidget {
  String? com;
  String? code;
  String? profileImage;
  String? title;
  String? time;

  SupportCreateEndUserScreen(
      {Key? key, this.com, this.title, this.profileImage, this.code, this.time})
      : super(key: key);

  final SupportController controller = Get.put(SupportController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx((){
        return Stack(
          children: [
            Container(
              width: Get.width,
              height: Get.height,
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
                  SizedBox(
                    height: Get.height * 0.035,
                  ),
                  appBar(),
                  body(com.toString()),
                ],
              ),
            ),
            controller.loader.value? const Center(child: const CircularProgressIndicator(),):const SizedBox(),
          ],
        );
      })
    );
  }

  Widget body(String comp) {
    SupportController controller = Get.put(SupportController());
    return Expanded(
      child: ListView.builder(
        itemCount: controller.viewSupportTicketModel.data!.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.width * 0.08),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: Get.width * 0.01,
                      ),
                      Text(
                        code.toString(),
                        style: gilroyMediumTextStyle(fontSize: 16),
                      ),
                      const Spacer(),
                      Text(
                        com.toString(),
                        style: gilroySemiBoldTextStyle(
                            fontSize: 18, color: ColorRes.color_FFA620),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Get.height * 0.032,
                  ),
                  SizedBox(
                    height: Get.width * 0.144,
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.network(
                            controller.viewSupportTicketModel.data![index]
                                .userDetail!.profileImage
                                .toString(),
                            height: Get.width * 0.144,
                            width: Get.width * 0.144,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Image.asset(
                                AssetRes.posterProfile,
                                height: Get.width * 0.144,
                                width: Get.width * 0.144,
                              );
                            },
                          ),
                        ),
                        /* Container(
                          height: Get.width * 0.144,
                          width: Get.width * 0.144,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(AssetRes.account),
                            ),
                          ),
                        ),*/
                        SizedBox(
                          width: Get.width * 0.04,
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Spacer(),
                              Text(
                                controller.viewSupportTicketModel.data![index]
                                    .userDetail!.fullName
                                    .toString(),
                                style: gilroySemiBoldTextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(
                                height: Get.height * 0.0086,
                              ),
                              Text(
                                "${DateFormat().add_yMMMMd().format(controller.viewSupportTicketModel.data![index].createdAt!)}|${DateFormat().add_jm().format(controller.viewSupportTicketModel.data![index].createdAt!)}",
                                style: gilroySemiBoldTextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              // SizedBox(
                              //   height: Get.height * 0.0086,
                              // )
                            ]),

                        // const Spacer(),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.0233,
                  ),
                  Text(
                    controller.viewSupportTicketModel.data![index].description
                        .toString(),
                    style: gilroySemiBoldTextStyle(fontSize: 14),
                  ),
                  SizedBox(
                    height: Get.height * 0.0184,
                  ),
                  Container(
                    height: Get.height * 0.07279,
                    width: Get.width * 0.354666,
                    padding: const EdgeInsets.only(right: 5),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: ColorRes.white,
                        width: 2,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(9),
                      ),
                    ),
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller
                              .viewSupportTicketModel.data![index].itmeList!.length,
                          itemBuilder: (context, index1) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SizedBox(
                                  height: 42.98,
                                  width: 42.98,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      controller.viewSupportTicketModel.data![index]
                                          .itmeList![index1].image
                                          .toString(),
                                      fit: BoxFit.cover,
                                      errorBuilder: (context, error, stackTrace) {
                                        return Image.asset(
                                          AssetRes.portrait_placeholder,
                                          fit: BoxFit.cover,
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                    width: 5
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: Get.height * 0.015),
                                  child: InkWell(
                                      onTap: (){
                                        print( controller.save(controller
                                            .viewSupportTicketModel
                                            .data![index]
                                            .itmeList![index1]
                                            .image
                                            .toString()));
                                        controller.save(controller
                                            .viewSupportTicketModel
                                            .data![index]
                                            .itmeList![index1]
                                            .image
                                            .toString());
                                        // (controller.imgIdList.length==0)
                                        //     ?  errorToast("Image is not found")
                                        //     : (controller.imgIdList.length == 1)
                                        //        ?controller.save(controller
                                        //     .viewSupportTicketModel
                                        //     .data![index]
                                        //     .itmeList![0]
                                        //     .image
                                        //     .toString())
                                        //     :Column(
                                        //   children: [
                                        //     controller.save(controller
                                        //         .viewSupportTicketModel
                                        //         .data![index]
                                        //         .itmeList![0]
                                        //         .image
                                        //         .toString()),
                                        //     controller.save(controller
                                        //         .viewSupportTicketModel
                                        //         .data![index]
                                        //         .itmeList![1]
                                        //         .image
                                        //         .toString()),
                                        //   ],
                                        // );

                                      },
                                      child: Image.asset(AssetRes.downlode)),
                                ),
                              ],
                            );
                          },
                        ),
                        // Padding(
                        //   padding: EdgeInsets.symmetric(
                        //       vertical: Get.height * 0.015),
                        //   child: InkWell(
                        //       onTap: (){
                        //         print( controller.save(controller
                        //             .viewSupportTicketModel
                        //             .data![index]
                        //             .itmeList![0]
                        //             .image
                        //             .toString()));
                        //         controller.save(controller
                        //             .viewSupportTicketModel
                        //             .data![index]
                        //             .itmeList![0]
                        //             .image
                        //             .toString());
                        //         // (controller.imgIdList.length==0)
                        //         //     ?  errorToast("Image is not found")
                        //         //     : (controller.imgIdList.length == 1)
                        //         //        ?controller.save(controller
                        //         //     .viewSupportTicketModel
                        //         //     .data![index]
                        //         //     .itmeList![0]
                        //         //     .image
                        //         //     .toString())
                        //         //     :Column(
                        //         //   children: [
                        //         //     controller.save(controller
                        //         //         .viewSupportTicketModel
                        //         //         .data![index]
                        //         //         .itmeList![0]
                        //         //         .image
                        //         //         .toString()),
                        //         //     controller.save(controller
                        //         //         .viewSupportTicketModel
                        //         //         .data![index]
                        //         //         .itmeList![1]
                        //         //         .image
                        //         //         .toString()),
                        //         //   ],
                        //         // );
                        //
                        //       },
                        //       child: Image.asset(AssetRes.downlode)),
                        // ),
                      ],
                    ),

                  ),
                  SizedBox(
                    height: Get.height * 0.0300,
                  ),
                  SizedBox(
                    height: Get.width * 0.144,
                    child: Row(
                      children: [
                        Container(
                          height: Get.width * 0.144,
                          width: Get.width * 0.144,
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
                            child: Container(
                              height: Get.width * 0.11,
                              width: Get.width * 0.11,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                image: AssetImage(AssetRes.duck),
                              )),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: Get.width * 0.04,
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Spacer(),
                              Text(
                                "Rainbow Admin",
                                style: gilroySemiBoldTextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(
                                height: Get.height * 0.0086,
                              ),
                              Text(
                                "${DateFormat().add_yMMMMd().format(controller.viewSupportTicketModel.data![index].createdAt!)}|${DateFormat().add_jm().format(controller.viewSupportTicketModel.data![index].createdAt!)}",
                                style: gilroySemiBoldTextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              // SizedBox(
                              //   height: Get.height * 0.0086,
                              // )
                            ]),

                        // const Spacer(),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.0233,
                  ),
                  Text(
                    Strings.thankYouForSending,
                    style: gilroySemiBoldTextStyle(fontSize: 14),
                  ),
                  SizedBox(
                    height: Get.height * 0.0246,
                  ),
                  Text(
                    Strings.yourMessage,
                    style: gilroySemiBoldTextStyle(fontSize: 14),
                  ),
                  SizedBox(
                    height: Get.height * 0.005,
                  ),
                  Container(
                    height: Get.height * 0.29679,
                    width: Get.width * 0.89333,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: ColorRes.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextField(
                      onChanged: (value) {},
                      maxLines: 7,
                      controller: controller.yourMsgSendController,
                      style: textFieldText,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(top: 0),
                        border: InputBorder.none,
                        hintStyle: gilroyMediumTextStyle(
                            fontSize: 18,
                            color: ColorRes.black.withOpacity(0.3)),
                        hintText: Strings.writeSomethings,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.01477,
                  ),
                  //pic Image
                  GetBuilder<SupportController>(
                      id: "createStory",
                      builder: (controller) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            controller.image.isEmpty
                                ? const SizedBox()
                                : Container(
                              height: Get.height / 12,
                              width: Get.width / 5,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: FileImage(controller.image[0]),
                                      fit: BoxFit.cover
                                  ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            const SizedBox(width: 20,),
                            (controller.image.length == 2)
                                ? Container(
                              height: Get.height / 12,
                              width: Get.width / 5,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                      image: FileImage(controller.image[1]),
                                      fit: BoxFit.cover)),
                            )
                                :  Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                    onTap: () {
                                      showModalBottomSheet(
                                          elevation: 10,
                                          barrierColor: ColorRes.black.withOpacity(0.4),
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10.0),
                                            ),
                                          ),
                                          backgroundColor: ColorRes.color_4F359B,
                                          context: context,
                                          builder: (context) {
                                            return Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[
                                                GestureDetector(
                                                  onTap: controller.cameraImage,
                                                  child: const ListTile(
                                                    leading: Icon(Icons.camera),
                                                    title: Text(Strings.camera),
                                                  ),
                                                ),
                                                Container(
                                                  height: 0.5,
                                                  width: Get.width,
                                                  color: ColorRes.white,
                                                ),
                                                GestureDetector(
                                                  onTap: controller.galleryImage,
                                                  child: const ListTile(
                                                    leading: Icon(Icons
                                                        .photo_size_select_actual_outlined),
                                                    title: Text(Strings.gallery),
                                                  ),
                                                ),
                                              ],
                                            );
                                          });
                                    },
                                    child: SizedBox(
                                      height: Get.height * 0.0474,
                                      child: const Image(
                                        image: AssetImage(AssetRes.cameraPic),
                                      ),
                                    ),
                                ),
                                SizedBox(
                                  height: Get.height * 0.0190
                                ),
                                Center(
                                  child: Text(
                                    Strings.attachImage,
                                    style: gilroyMediumTextStyle(fontSize: 14),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      }),
                  SizedBox(
                    height: Get.height * 0.05,
                  ),
                  SubmitButton(
                    onTap: () {
                      controller.valid();
                      controller.sendSupportApiData(controller
                          .viewSupportTicketModel.data![index].id
                          .toString());
                    },
                    child: Text(
                      Strings.sendMessage,
                      style: gilroyBoldTextStyle(
                          color: Colors.black, fontSize: 16),
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.05,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

Widget appBar() {
  return SizedBox(
    width: Get.width,
    child: Column(
      children: [
        SizedBox(
          height: Get.height * 0.03,
        ),
        Row(
          children: [
            SizedBox(
              width: Get.width * 0.05,
            ),
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Image.asset(
                AssetRes.backIcon,
                height: 16,
                width: 16,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: Get.width * 0.32,
            ),
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Text(
                Strings.support,
                style: gilroyBoldTextStyle(),
              ),
            ),
            SizedBox(
              width: Get.width * 0.05,
            ),
          ],
        ),
        SizedBox(
          height: Get.height * 0.04,
        ),
      ],
    ),
  );
}

// Widget downloadButton(int i){
//    SupportController controller = Get.put(SupportController());
//   return Padding(
//     padding: EdgeInsets.symmetric(
//         vertical: Get.height * 0.015),
//     child: InkWell(
//         onTap: () {
//           controller.save(controller
//               .viewSupportTicketModel
//               .data![i]
//               .itmeList![0]
//               .image
//               .toString());
//           controller.save(controller
//               .viewSupportTicketModel
//               .data![i]
//               .itmeList![1]
//               .image
//               .toString());
//         },
//         child: Image.asset(AssetRes.downlode)),
//   );
// }
