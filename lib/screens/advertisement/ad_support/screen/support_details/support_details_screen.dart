import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rainbow/common/popup.dart';
import 'package:rainbow/screens/advertisement/ad_support/ad_support_controller.dart';
import '../../../../../common/Widget/buttons.dart';
import '../../../../../common/Widget/text_styles.dart';
import '../../../../../utils/asset_res.dart';
import '../../../../../utils/color_res.dart';
import '../../../../../utils/strings.dart';

class SupportDetailsScreen extends StatelessWidget {
  String? com;
  String? code;
  String? profileImage;
  String? title;
  String? time;

  SupportDetailsScreen(
      {Key? key, this.com, this.title, this.profileImage, this.code, this.time})
      : super(key: key);

  final AdSupportController controller = Get.put(AdSupportController());

  @override
  Widget build(BuildContext context) {
    return  Scaffold(body: Obx(() {
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
          controller.loader.value
              ? Center(
            child: CircularProgressIndicator(),
          )
              : SizedBox(),
        ],
      );
    }));
  }
  Widget body(String comp) {
    AdSupportController controller = Get.put(AdSupportController());
    return Expanded(
      child: ListView.builder(
        itemCount:controller.viewSupportTicketModel.data==null?0: controller.viewSupportTicketModel.data!.length,
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
                                "${DateFormat().add_yMMMMd().format(controller.viewSupportTicketModel.data![index].createdAt!.toLocal())} | ${DateFormat().add_jm().format(controller.viewSupportTicketModel.data![index].createdAt!.toLocal())}",
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
                  //image
                  Container(
                    height: Get.height * 0.07279,
                    width: Get.width * 0.354666,
                    padding: EdgeInsets.only(right: 5, left: 5),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: ColorRes.white,
                        width: 2,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(9),
                      ),
                    ),
                    child:(controller.viewSupportTicketModel.data![index]
                        .itmeList!.length ==
                        1)
                        ? Stack(
                      alignment: Alignment.center,
                      children: [
                        ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.viewSupportTicketModel
                              .data![index].itmeList!.length,
                          itemBuilder: (context, index1) {
                            return Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceAround,
                              children: [
                                SizedBox(
                                  height: 42.98,
                                  width: 42.98,
                                  child: ClipRRect(
                                    borderRadius:
                                    BorderRadius.circular(10),
                                    child: Image.network(
                                      controller
                                          .viewSupportTicketModel
                                          .data![index]
                                          .itmeList![index1]
                                          .image
                                          .toString(),
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return Image.asset(
                                          AssetRes.portrait_placeholder,
                                          fit: BoxFit.cover,
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 5),
                              ],
                            );
                          },
                        ),
                        (controller.viewSupportTicketModel.data![index]
                            .itmeList!.isEmpty)
                            ? SizedBox()
                            : downloadButton1(index)
                      ],
                    )
                        : Stack(
                      alignment: Alignment.topRight,
                      children: [
                        ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.viewSupportTicketModel
                              .data![index].itmeList!.length,
                          itemBuilder: (context, index1) {
                            return Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceAround,
                              children: [
                                SizedBox(
                                  height: 42.98,
                                  width: 42.98,
                                  child: ClipRRect(
                                    borderRadius:
                                    BorderRadius.circular(10),
                                    child: Image.network(
                                      controller
                                          .viewSupportTicketModel
                                          .data![index]
                                          .itmeList![index1]
                                          .image
                                          .toString(),
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return Image.asset(
                                          AssetRes.portrait_placeholder,
                                          fit: BoxFit.cover,
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 5),
                              ],
                            );
                          },
                        ),
                        (controller.viewSupportTicketModel.data![index]
                            .itmeList!.isEmpty)
                            ? SizedBox()
                            : downloadButton2(index)
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
                                "${DateFormat().add_yMMMMd().format(controller.viewSupportTicketModel.data![index].createdAt!.toLocal())} | ${DateFormat().add_jm().format(controller.viewSupportTicketModel.data![index].createdAt!.toLocal())}",
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
                    height: Get.height * 0.06,
                  ),
                  Text(
                    Strings.yourMessage,
                    style: gilroySemiBoldTextStyle(fontSize: 14),
                  ),
                  SizedBox(
                    height: Get.height * 0.005,
                  ),
                  Container(
                    height: Get.height * 0.25679,
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
                  Padding(
                    padding: EdgeInsets.only(left: 25, top: 30),
                    child:  GetBuilder<AdSupportController>(
                        id: "img",
                        builder: (controller) {
                          return Column(
                            children: [
                              (controller.image.isEmpty)
                                  ?SizedBox()
                                  : (controller.image.length == 3)
                                  ?Row(
                                children: [
                                  Stack(
                                    alignment: Alignment(1.2, -1.3),
                                    children: [
                                      Container(
                                        height: Get.height / 12,
                                        width: Get.width / 5,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),
                                            image: DecorationImage(
                                                image:
                                                FileImage(controller.image[0]),
                                                fit: BoxFit.cover)),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          FocusScopeNode currentfocus =
                                          FocusScope.of(context);
                                          if (!currentfocus.hasPrimaryFocus) {
                                            currentfocus.unfocus();
                                          }
                                          controller.image.removeAt(0);
                                          controller.update(["img"]);
                                        },
                                        child: Container(
                                            decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.black),
                                            child: const Icon(
                                              Icons.clear,
                                              color: Colors.white,
                                            )),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 20),
                                  Stack(
                                    alignment: Alignment(1.2, -1.3),
                                    children: [
                                      Container(
                                        height: Get.height / 12,
                                        width: Get.width / 5,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),
                                            image: DecorationImage(
                                                image:
                                                FileImage(controller.image[1]),
                                                fit: BoxFit.cover)),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          FocusScopeNode currentfocus =
                                          FocusScope.of(context);
                                          if (!currentfocus.hasPrimaryFocus) {
                                            currentfocus.unfocus();
                                          }
                                          controller.image.removeAt(1);
                                          controller.update(["img"]);
                                        },
                                        child: Container(
                                            decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.black),
                                            child: const Icon(
                                              Icons.clear,
                                              color: Colors.white,
                                            )),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 20),
                                  Stack(
                                    alignment: Alignment(1.2, -1.3),
                                    children: [
                                      Container(
                                        height: Get.height / 12,
                                        width: Get.width / 5,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),
                                            image: DecorationImage(
                                                image:
                                                FileImage(controller.image[2]),
                                                fit: BoxFit.cover)),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          FocusScopeNode currentfocus =
                                          FocusScope.of(context);
                                          if (!currentfocus.hasPrimaryFocus) {
                                            currentfocus.unfocus();
                                          }
                                          controller.image.removeAt(2);
                                          controller.update(["img"]);
                                        },
                                        child: Container(
                                            decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.black),
                                            child: const Icon(
                                              Icons.clear,
                                              color: Colors.white,
                                            )),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                                  :(controller.image.length == 2)
                                  ?Row(
                                children: [
                                  Stack(
                                    alignment: Alignment(1.2, -1.3),
                                    children: [
                                      Container(
                                        height: Get.height / 12,
                                        width: Get.width / 5,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),
                                            image: DecorationImage(
                                                image:
                                                FileImage(controller.image[0]),
                                                fit: BoxFit.cover)),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          FocusScopeNode currentfocus =
                                          FocusScope.of(context);
                                          if (!currentfocus.hasPrimaryFocus) {
                                            currentfocus.unfocus();
                                          }
                                          controller.image.removeAt(0);
                                          controller.update(["img"]);
                                        },
                                        child: Container(
                                            decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.black),
                                            child: const Icon(
                                              Icons.clear,
                                              color: Colors.white,
                                            )),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 20),
                                  Stack(
                                    alignment: Alignment(1.2, -1.3),
                                    children: [
                                      Container(
                                        height: Get.height / 12,
                                        width: Get.width / 5,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),
                                            image: DecorationImage(
                                                image:
                                                FileImage(controller.image[1]),
                                                fit: BoxFit.cover)),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          FocusScopeNode currentfocus =
                                          FocusScope.of(context);
                                          if (!currentfocus.hasPrimaryFocus) {
                                            currentfocus.unfocus();
                                          }
                                          controller.image.removeAt(1);
                                          controller.update(["img"]);
                                        },
                                        child: Container(
                                            decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.black),
                                            child: const Icon(
                                              Icons.clear,
                                              color: Colors.white,
                                            )),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                                  :(controller.image.length==1)
                                  ?Stack(
                                alignment: Alignment(1.2, -1.3),
                                children: [
                                  Container(
                                    height: Get.height / 12,
                                    width: Get.width / 5,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        image: DecorationImage(
                                            image:
                                            FileImage(controller.image[0]),
                                            fit: BoxFit.cover)),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      FocusScopeNode currentfocus =
                                      FocusScope.of(context);
                                      if (!currentfocus.hasPrimaryFocus) {
                                        currentfocus.unfocus();
                                      }
                                      controller.image.removeAt(0);
                                      controller.update(["img"]);
                                    },
                                    child: Container(
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.black),
                                        child: const Icon(
                                          Icons.clear,
                                          color: Colors.white,
                                        )),
                                  ),
                                ],
                              )
                                  :Row(
                                children: [
                                  Stack(
                                    alignment: Alignment(1.2, -1.3),
                                    children: [
                                      Container(
                                        height: Get.height / 12,
                                        width: Get.width / 5,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),
                                            image: DecorationImage(
                                                image:
                                                FileImage(controller.image[0]),
                                                fit: BoxFit.cover)),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          FocusScopeNode currentfocus =
                                          FocusScope.of(context);
                                          if (!currentfocus.hasPrimaryFocus) {
                                            currentfocus.unfocus();
                                          }
                                          controller.image.removeAt(0);
                                          controller.update(["img"]);
                                        },
                                        child: Container(
                                            decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.black),
                                            child: const Icon(
                                              Icons.clear,
                                              color: Colors.white,
                                            )),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 20),
                                  Stack(
                                    alignment: Alignment(1.2, -1.3),
                                    children: [
                                      Container(
                                        height: Get.height / 12,
                                        width: Get.width / 5,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),
                                            image: DecorationImage(
                                                image:
                                                FileImage(controller.image[1]),
                                                fit: BoxFit.cover)),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          FocusScopeNode currentfocus =
                                          FocusScope.of(context);
                                          if (!currentfocus.hasPrimaryFocus) {
                                            currentfocus.unfocus();
                                          }
                                          controller.image.removeAt(1);
                                          controller.update(["img"]);
                                        },
                                        child: Container(
                                            decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.black),
                                            child: const Icon(
                                              Icons.clear,
                                              color: Colors.white,
                                            )),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 20),
                                  Stack(
                                    alignment: Alignment(1.2, -1.3),
                                    children: [
                                      Container(
                                        height: Get.height / 12,
                                        width: Get.width / 5,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),
                                            image: DecorationImage(
                                                image:
                                                FileImage(controller.image[2]),
                                                fit: BoxFit.cover)),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          FocusScopeNode currentfocus =
                                          FocusScope.of(context);
                                          if (!currentfocus.hasPrimaryFocus) {
                                            currentfocus.unfocus();
                                          }
                                          controller.image.removeAt(2);
                                          controller.update(["img"]);
                                        },
                                        child: Container(
                                            decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.black),
                                            child: const Icon(
                                              Icons.clear,
                                              color: Colors.white,
                                            )),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 20,),
                              Padding(
                                padding: EdgeInsets.only(right: 30),
                                child:   Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [

                                    InkWell(
                                      onTap: () {
                                        if(controller.image.length==3){
                                          errorToast("you can take only 3 images");
                                        }
                                        else{
                                          FocusScopeNode currentfocus =
                                          FocusScope.of(context);
                                          if (!currentfocus.hasPrimaryFocus) {
                                            currentfocus.unfocus();
                                          }
                                          showModalBottomSheet(
                                              elevation: 10,
                                              barrierColor:
                                              ColorRes.black.withOpacity(0.4),
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
                                                      onTap:
                                                      controller.cameraImage,
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
                                                      onTap:
                                                      controller.galleryImage,
                                                      child: const ListTile(
                                                        leading: Icon(Icons
                                                            .photo_size_select_actual_outlined),
                                                        title: Text(Strings.gallery),
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              });
                                        }
                                      },
                                      child: SizedBox(
                                        height: Get.height * 0.0474,
                                        child: const Image(
                                          image: AssetImage(AssetRes.cameraPic),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: Get.height * 0.0190,
                                    ),
                                    Center(
                                      child: Text(
                                        Strings.attachImage,
                                        style: gilroyMediumTextStyle(fontSize: 14),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        }),
                  ),
                  SizedBox(
                    height: Get.height * 0.05,
                  ),
                  SubmitButton(
                    onTap: () {

                      controller.onTapSendMessage(controller
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

Widget downloadButton2(int i) {
  AdSupportController controller = Get.put(AdSupportController());
  return Padding(
    padding: EdgeInsets.symmetric(vertical: Get.height * 0.015),
    child: InkWell(
        onTap: () {
          controller.save(controller
              .viewSupportTicketModel.data![i].itmeList![0].image
              .toString());
          controller.save(controller
              .viewSupportTicketModel.data![i].itmeList![1].image
              .toString());
          flutterToast("Image Save successFull");
          // (controller.loader.value == false)? flutterToast("Image Save successFull"):SizedBox();
        },
        child: Image.asset(AssetRes.downlode)),
  );
}

Widget downloadButton1(int i) {
  AdSupportController controller = Get.put(AdSupportController());
  return Padding(
    padding: EdgeInsets.symmetric(vertical: Get.height * 0.015),
    child: InkWell(
        onTap: () {
          controller.save(controller
              .viewSupportTicketModel.data![i].itmeList![0].image
              .toString());
          flutterToast("Image Save successFull");
          //controller.loader.value == false? flutterToast("Image Save successFull"):SizedBox();
        },
        child: Image.asset(AssetRes.downlode)),
  );
}
