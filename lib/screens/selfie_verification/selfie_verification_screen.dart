import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/screens/selfie_verification/selfie_verification_controller.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/color_res.dart';
import 'package:rainbow/utils/strings.dart';

class SelfieVerificationScreen extends StatelessWidget {
  const SelfieVerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SelfieController controller = Get.put(SelfieController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Center(
                      child: Container(
                        /*    height: Get.height * 0.975369,*/
                        width: Get.width * 0.946666,
                        margin: EdgeInsets.all(Get.width * 0.02669),
                        decoration: BoxDecoration(
                            color: ColorRes.color_4F359B,
                            borderRadius: BorderRadius.circular(25)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(height: Get.height * 0.03),
                            GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: const Padding(
                                padding: EdgeInsets.only(left: 15),
                                child: Icon(
                                  Icons.arrow_back_ios_outlined,
                                  size: 16.72,
                                ),
                              ),
                            ),
                            SizedBox(height: Get.height * 0.03),
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Text(
                                Strings.selfie,
                                style: textStyleFont26WhiteBold,
                              ),
                            ),
                            SizedBox(height: Get.height * 0.01),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 29,
                                  width: 29,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: ColorRes.colorB279DB),
                                ),
                                Container(
                                  height: 5,
                                  width: Get.width * 0.25,
                                  color: ColorRes.colorB279DB,
                                ),
                                Container(
                                  height: 29,
                                  width: 29,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: ColorRes.colorB279DB,
                                  ),
                                ),
                                Container(
                                  height: 5,
                                  width: Get.width * 0.25,
                                  color: ColorRes.colorC4C4C4,
                                ),
                                Container(
                                  height: 29,
                                  width: 29,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: ColorRes.colorC4C4C4),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: Get.height * 0.04,
                            ),
                            Center(
                              child: SizedBox(
                                height: Get.height * 0.048,
                                width: Get.width * 0.836619,
                                child: Text(
                                  Strings.prepareScan,
                                  style: textStyleFont26WhiteBold,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: Get.height * 0.035,
                            ),
                            Center(
                              child: SizedBox(
                                  height: Get.height * 0.06060,
                                  width: Get.width * 0.901408,
                                  child: Text(
                                    Strings.makeSure,
                                    style: gilroyMediumTextStyle(fontSize: 16),
                                    textAlign: TextAlign.center,
                                  )),
                            ),
                            SizedBox(
                              height: Get.height * 0.01,
                            ),
                            Center(
                              child: CustomPaint(
                                painter: RPSCustomPainter(),
                                child: SizedBox(
                                  height: 313,
                                  width: 313,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: Get.width * 0.12,
                                        top: Get.height * 0.065,
                                        child: Container(
                                          height: 230,
                                          width: 230,
                                          decoration: const BoxDecoration(
                                              shape: BoxShape.circle),
                                          child: Container(
                                            height: Get.height * 0.2866,
                                            width: Get.width * 0.445014,
                                            decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        AssetRes.posterProfile),
                                                    fit: BoxFit.fitHeight),
                                                shape: BoxShape.circle),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: Get.height * 0.03,
                            ),
                            GestureDetector(
                              onTap: controller.onNextTap,
                              child: Center(
                                child: Container(
                                  width: Get.width * 0.84788,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: ColorRes.colorE7D01F,
                                    borderRadius: BorderRadius.circular(15),
                                    gradient: const LinearGradient(
                                      colors: [
                                        ColorRes.colorFFEC5C,
                                        ColorRes.colorDFC60B
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    ),
                                  ),
                                  child: Center(
                                      child: Text(
                                    Strings.next,
                                    style: gilroyBoldTextStyle(
                                        color: Colors.black, fontSize: 16),
                                  )),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: Get.height * 0.03,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.2165817, size.height * 0.8556221);
    path_0.cubicTo(
        size.width * 0.2611610,
        size.height * 0.8909041,
        size.width * 0.3110959,
        size.height * 0.9172820,
        size.width * 0.3653314,
        size.height * 0.9339012);
    path_0.cubicTo(
        size.width * 0.4237238,
        size.height * 0.9518634,
        size.width * 0.4840901,
        size.height * 0.9577355,
        size.width * 0.5453023,
        size.height * 0.9514680);
    path_0.lineTo(size.width * 0.5362064, size.height * 0.8625901);
    path_0.cubicTo(
        size.width * 0.4411250,
        size.height * 0.8723227,
        size.width * 0.3480610,
        size.height * 0.8452180,
        size.width * 0.2731154,
        size.height * 0.7863750);
    path_0.lineTo(size.width * 0.2165817, size.height * 0.8556221);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.shader = ui.Gradient.linear(
        Offset(size.width * 0.5358808, size.height * 0.9439215),
        Offset(size.width * 0.4827703, size.height * 0.7722006), [
      const Color(0xff593EA3).withOpacity(1),
      const Color(0xff9566C9).withOpacity(1)
    ], [
      0,
      0.966267
    ]);
    canvas.drawPath(path_0, paint_0_fill);

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.7915581, size.height * 0.1505974);
    path_1.lineTo(size.width * 0.7350262, size.height * 0.2198445);
    path_1.cubicTo(
        size.width * 0.8076541,
        size.height * 0.2811730,
        size.width * 0.8528924,
        size.height * 0.3668343,
        size.width * 0.8626076,
        size.height * 0.4617529);
    path_1.lineTo(size.width * 0.9514855, size.height * 0.4526570);
    path_1.cubicTo(
        size.width * 0.9452355,
        size.height * 0.3916017,
        size.width * 0.9272413,
        size.height * 0.3335174,
        size.width * 0.8978401,
        size.height * 0.2801360);
    path_1.cubicTo(
        size.width * 0.8705930,
        size.height * 0.2305497,
        size.width * 0.8349651,
        size.height * 0.1869625,
        size.width * 0.7915581,
        size.height * 0.1505974);
    path_1.close();

    Paint paint_1_fill = Paint()..style = PaintingStyle.fill;
    paint_1_fill.shader = ui.Gradient.linear(
        Offset(size.width * 0.9448924, size.height * 0.4392820),
        Offset(size.width * 0.7943605, size.height * 0.2208067), [
      const Color(0xff593EA3).withOpacity(1),
      const Color(0xff9566C9).withOpacity(1)
    ], [
      0,
      0.966267
    ]);
    canvas.drawPath(path_1, paint_1_fill);

    Path path_2 = Path();
    path_2.moveTo(size.width * 0.1470584, size.height * 0.5986134);
    path_2.lineTo(size.width * 0.06070930, size.height * 0.6214302);
    path_2.cubicTo(
        size.width * 0.07007471,
        size.height * 0.6548517,
        size.width * 0.08317442,
        size.height * 0.6870901,
        size.width * 0.09996017,
        size.height * 0.7176628);
    path_2.cubicTo(
        size.width * 0.1272227,
        size.height * 0.7674099,
        size.width * 0.1631701,
        size.height * 0.8109622,
        size.width * 0.2067503,
        size.height * 0.8474709);
    path_2.lineTo(size.width * 0.2631250, size.height * 0.7782413);
    path_2.cubicTo(
        size.width * 0.2066852,
        size.height * 0.7306773,
        size.width * 0.1667506,
        size.height * 0.6685727,
        size.width * 0.1470584,
        size.height * 0.5986134);
    path_2.close();

    Paint paint_2_fill = Paint()..style = PaintingStyle.fill;
    paint_2_fill.shader = ui.Gradient.linear(
        Offset(size.width * 0.2634122, size.height * 0.8304244),
        Offset(size.width * 0.1523029, size.height * 0.6398285), [
      const Color(0xff593EA3).withOpacity(1), 
      const Color(0xff9566C9).withOpacity(1)
    ], [
      0,
      0.966267
    ]);
    canvas.drawPath(path_2, paint_2_fill);

    Path path_3 = Path();
    path_3.moveTo(size.width * 0.1352084, size.height * 0.5362064);
    path_3.cubicTo(
        size.width * 0.1294477,
        size.height * 0.4799215,
        size.width * 0.1366017,
        size.height * 0.4242442,
        size.width * 0.1555977,
        size.height * 0.3728169);
    path_3.lineTo(size.width * 0.07244390, size.height * 0.3405203);
    path_3.cubicTo(
        size.width * 0.06942558,
        size.height * 0.3487006,
        size.width * 0.06658227,
        size.height * 0.3570233,
        size.width * 0.06391453,
        size.height * 0.3654913);
    path_3.cubicTo(
        size.width * 0.04593634,
        size.height * 0.4237238,
        size.width * 0.04008169,
        size.height * 0.4842471,
        size.width * 0.04633081,
        size.height * 0.5453023);
    path_3.cubicTo(
        size.width * 0.04856017,
        size.height * 0.5670843,
        size.width * 0.05234709,
        size.height * 0.5883866,
        size.width * 0.05753227,
        size.height * 0.6092238);
    path_3.lineTo(size.width * 0.1438814, size.height * 0.5864070);
    path_3.cubicTo(
        size.width * 0.1397878,
        size.height * 0.5699564,
        size.width * 0.1369497,
        size.height * 0.5532180,
        size.width * 0.1352084,
        size.height * 0.5362064);
    path_3.close();

    Paint paint_3_fill = Paint()..style = PaintingStyle.fill;
    paint_3_fill.shader = ui.Gradient.linear(
        Offset(size.width * 0.1739267, size.height * 0.5855233),
        Offset(size.width * 0.03803198, size.height * 0.4278285), [
      const Color(0xff593EA3).withOpacity(1),
      const Color(0xff9566C9).withOpacity(1)
    ], [
      0,
      0.966267
    ]);
    canvas.drawPath(path_3, paint_3_fill);

    Path path_4 = Path();
    path_4.moveTo(size.width * 0.1601497, size.height * 0.3607820);
    path_4.cubicTo(
        size.width * 0.1736384,
        size.height * 0.3277500,
        size.width * 0.1921244,
        size.height * 0.2964593,
        size.width * 0.2154044,
        size.height * 0.2680488);
    path_4.cubicTo(
        size.width * 0.2386677,
        size.height * 0.2394802,
        size.width * 0.2657096,
        size.height * 0.2148625,
        size.width * 0.2954826,
        size.height * 0.1949459);
    path_4.lineTo(size.width * 0.2471520, size.height * 0.1198840);
    path_4.cubicTo(
        size.width * 0.2090907,
        size.height * 0.1451474,
        size.width * 0.1752887,
        size.height * 0.1759195,
        size.width * 0.1461735,
        size.height * 0.2116741);
    path_4.cubicTo(
        size.width * 0.1172012,
        size.height * 0.2472535,
        size.width * 0.09405756,
        size.height * 0.2864134,
        size.width * 0.07699593,
        size.height * 0.3284855);
    path_4.lineTo(size.width * 0.1601497, size.height * 0.3607820);
    path_4.close();

    Paint paint_4_fill = Paint()..style = PaintingStyle.fill;
    paint_4_fill.shader = ui.Gradient.linear(
        Offset(size.width * 0.3036105, size.height * 0.3358634),
        Offset(size.width * 0.2179276, size.height * 0.1449753), [
      const Color(0xff593EA3).withOpacity(1),
      const Color(0xff9566C9).withOpacity(1)
    ], [
      0,
      0.966267
    ]);
    canvas.drawPath(path_4, paint_4_fill);

    Path path_5 = Path();
    path_5.moveTo(size.width * 0.5257471, size.height * 0.1341049);
    path_5.cubicTo(
        size.width * 0.5980843,
        size.height * 0.1392323,
        size.width * 0.6671686,
        size.height * 0.1659000,
        size.width * 0.7251948,
        size.height * 0.2116933);
    path_5.lineTo(size.width * 0.7817267, size.height * 0.1424465);
    path_5.cubicTo(
        size.width * 0.7369738,
        size.height * 0.1070227,
        size.width * 0.6868634,
        size.height * 0.08050145,
        size.width * 0.6324506,
        size.height * 0.06373895);
    path_5.cubicTo(
        size.width * 0.5992703,
        size.height * 0.05347936,
        size.width * 0.5652064,
        size.height * 0.04716541,
        size.width * 0.5309128,
        size.height * 0.04489157);
    path_5.lineTo(size.width * 0.5257471, size.height * 0.1341049);
    path_5.close();

    Paint paint_5_fill = Paint()..style = PaintingStyle.fill;
    paint_5_fill.shader = ui.Gradient.linear(
        Offset(size.width * 0.7804738, size.height * 0.1977991),
        Offset(size.width * 0.7229942, size.height * 0.03529186), [
      const Color(0xff593EA3).withOpacity(1),
      const Color(0xff9566C9).withOpacity(1)
    ], [
      0,
      0.966267
    ]);
    canvas.drawPath(path_5, paint_5_fill);

    Path path_6 = Path();
    path_6.moveTo(size.width * 0.3061831, size.height * 0.1880669);
    path_6.cubicTo(
        size.width * 0.3527122,
        size.height * 0.1592055,
        size.width * 0.4056279,
        size.height * 0.1409366,
        size.width * 0.4617529,
        size.height * 0.1351922);
    path_6.cubicTo(
        size.width * 0.4789244,
        size.height * 0.1334346,
        size.width * 0.4960669,
        size.height * 0.1329654,
        size.width * 0.5131483,
        size.height * 0.1334663);
    path_6.lineTo(size.width * 0.5181570, size.height * 0.04426919);
    path_6.cubicTo(
        size.width * 0.4963837,
        size.height * 0.04344535,
        size.width * 0.4745988,
        size.height * 0.04406860,
        size.width * 0.4526570,
        size.height * 0.04631424);
    path_6.cubicTo(
        size.width * 0.3916017,
        size.height * 0.05256337,
        size.width * 0.3335174,
        size.height * 0.07055785,
        size.width * 0.2801363,
        size.height * 0.09996017);
    path_6.cubicTo(
        size.width * 0.2725282,
        size.height * 0.1041125,
        size.width * 0.2652547,
        size.height * 0.1083916,
        size.width * 0.2578544,
        size.height * 0.1130049);
    path_6.lineTo(size.width * 0.3061831, size.height * 0.1880669);
    path_6.close();

    Paint paint_6_fill = Paint()..style = PaintingStyle.fill;
    paint_6_fill.shader = ui.Gradient.linear(
        Offset(size.width * 0.5227849, size.height * 0.1603049),
        Offset(size.width * 0.4924390, size.height * 0.04526453), [
      const Color(0xff593EA3).withOpacity(1),
      const Color(0xff9566C9).withOpacity(1)
    ], [
      0,
      0.966267
    ]);
    canvas.drawPath(path_6, paint_6_fill);

    Path path_7 = Path();
    path_7.moveTo(size.width * 0.8929767, size.height * 0.4586453);
    path_7.lineTo(size.width * 0.9211163, size.height * 0.4557645);
    path_7.cubicTo(
        size.width * 0.9326541,
        size.height * 0.5684913,
        size.width * 0.8996279,
        size.height * 0.6790320,
        size.width * 0.8279826,
        size.height * 0.7670174);
    path_7.cubicTo(
        size.width * 0.7564797,
        size.height * 0.8548256,
        size.width * 0.6549215,
        size.height * 0.9095640,
        size.width * 0.5421948,
        size.height * 0.9211017);
    path_7.lineTo(size.width * 0.5393140, size.height * 0.8929593);
    path_7.cubicTo(
        size.width * 0.6445669,
        size.height * 0.8821860,
        size.width * 0.7394215,
        size.height * 0.8310262,
        size.width * 0.8062151,
        size.height * 0.7490029);
    path_7.cubicTo(
        size.width * 0.8728488,
        size.height * 0.6669913,
        size.width * 0.9037471,
        size.height * 0.5638983,
        size.width * 0.8929767,
        size.height * 0.4586453);
    path_7.close();

    Paint paint_7_fill = Paint()..style = PaintingStyle.fill;
    paint_7_fill.shader = ui.Gradient.linear(
        Offset(size.width * 0.9509709, size.height * 0.8604419),
        Offset(size.width * 0.7933692, size.height * 0.5095233), [
      const Color(0xff593EA3).withOpacity(1),
      const Color(0xff9566C9).withOpacity(1)
    ], [
      0,
      0.966267
    ]);
    canvas.drawPath(path_7, paint_7_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
