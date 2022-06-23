import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/color_res.dart';
import 'package:rainbow/utils/strings.dart';

class IdVerificationScreen extends StatelessWidget {
  const IdVerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: Get.height,
                  width: Get.width,
                  margin: EdgeInsets.all(Get.width * 0.02669),
                  decoration: BoxDecoration(
                      color: ColorRes.color_4F359B,
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: Get.height * 0.05,
                        ),
                        const Icon(
                          Icons.arrow_back_ios_outlined,
                          size: 16.72,
                        ),
                        SizedBox(
                          height: Get.height * 0.02,
                        ),
                        Text(
                          Strings.idVerification,
                          style: textStyleFont26WhiteBold,
                        ),
                        SizedBox(height: Get.height * 0.03,),
                        Row(children: [
                          Container(
                            height: 29,
                            width: 29,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: ColorRes.color_B279DB),
                          ),
                          Container(height: 5,width: Get.width * 0.3,color: ColorRes.color_C4C4C4,),
                          Container(
                            height: 29,
                            width: 29,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: ColorRes.color_C4C4C4),
                          ),
                          Container(height: 5,width: Get.width * 0.3,color: ColorRes.color_C4C4C4,),

                          Container(
                            height: 29,
                            width: 29,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: ColorRes.color_C4C4C4),
                          ),
                        ]),
                        SizedBox(height: Get.height * 0.03,),
                        Text(
                          Strings.idType,
                          style: textStyleFont14WhiteBold,
                        ),   SizedBox(height: Get.height * 0.02,),
                        Center(
                          child: SizedBox(
                            height: 50,
                            width: Get.width * 0.85,
                            child: TextFormField(
                                decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.only(left: 12),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    filled: true,suffix: SizedBox(
                                    height: 15,
                                    child: Image.asset(AssetRes.down)),
                                    hintStyle: TextStyle(
                                        color: ColorRes.color_656F85..withOpacity(0.5),
                                        fontSize: 14,
                                        fontFamily: "Gilroy-Light",
                                        fontWeight: FontWeight.w500),
                                    hintText: Strings.permanentResident,
                                    fillColor: ColorRes.color_F7F7F7)),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
