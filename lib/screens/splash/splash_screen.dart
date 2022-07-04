import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/screens/splash/splash_controller.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/color_res.dart';
import 'package:rainbow/utils/strings.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  final SplashController controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      id: "splash",
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              PageView(
                onPageChanged: controller.onChanged,
                controller: controller.pageController,
                children: <Widget>[
                  animation(),
                  animation(),
                  animation(),
                  animation(),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: Get.height * 0.8),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            left: 15,
                            top: Get.height * 0.1,
                          ),
                          child: InkWell(
                            onTap: controller.onNextBtnTap,
                            child: Text(
                              Strings.next,
                              style: textStyleFont12,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Padding(
                          padding: EdgeInsets.only(top: Get.height * 0.1),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: _buildIndicator(controller),
                          ),
                        ),
                        const Spacer(),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 15, top: Get.height * 0.1, right: 15),
                          child: InkWell(
                            onTap: controller.onSkipTap,
                            child: Text(
                              "Skip",
                              style: textStyleFont12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 6,
      width: isActive ? 6 : 6,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: isActive ? ColorRes.color_4F359B : ColorRes.color_656F85,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

  List<Widget> _buildIndicator(SplashController controller) {
    List<Widget> indicators = [];
    for (int i = 0; i < 4; i++) {
      if (controller.currentIndex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }

    return indicators;
  }

  Widget animation() {
    return Stack(
      children: [
        SizedBox(
          height: Get.height * 0.85,
          child: CustomPaint(
            size: Size(Get.width, (Get.width * 1.8).toDouble()),
            //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
            painter: RPSCustomPainter(),
            child: Stack(
              children: [
                Row(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Image(
                        image: const AssetImage(AssetRes.sp1),
                        height: Get.height * 0.35,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 90, top: Get.height * 0.1),
                      child: const Align(
                        alignment: Alignment.topCenter,
                        child: Image(
                          image: AssetImage(AssetRes.sp3),
                          height: 12,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Align(
                      alignment: Alignment.topRight,
                      child: Image(
                        image: const AssetImage(AssetRes.sp2),
                        height: Get.height * 0.27,
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: Get.height * 0.26,
                  left: 30,
                  child: Container(
                    height: Get.height * 0.120,
                    width: Get.width * 0.8,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(AssetRes.rainBowLogo),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: Get.height * 0.02),
                  child: Center(
                    child: Text(
                      "Help, Support & Solutions For Families",
                      style: textStyleFont18White,
                    ),
                  ),
                ),
                Positioned(
                  left: -19,
                  top: Get.height * 0.43,
                  child: Container(
                    height: 42,
                    width: 42,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorRes.white.withOpacity(0.4),
                    ),
                  ),
                ),
                Positioned(
                  right: -32,
                  top: Get.height * 0.55,
                  child: Container(
                    height: 59,
                    width: 59,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorRes.white,
                    ),
                  ),
                ),
                Positioned(
                  bottom: Get.height * 0.045,
                  left: 0,
                  right: 0,
                  child: InkWell(
                    onTap: controller.onNextBtnTap,
                    child: Center(
                      child: Container(
                        height: 64,
                        width: 64,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.yellow,
                        ),
                        child: const Icon(
                          Icons.arrow_forward_sharp,
                          color: Colors.black,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    paint0Stroke.color = const Color(0xff4F359B).withOpacity(1);
    canvas.drawCircle(Offset(size.width * 0.4986667, size.height * 0.8957143),
        size.width * 0.1560000, paint0Stroke);

    // Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
    // paint_0_fill.color = Color(0xff000000).withOpacity(1.0);
    // canvas.drawCircle(Offset(size.width*0.4986667,size.height*0.8957143),size.width*0.1560000,paint_0_fill);

    Paint paint1Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    paint1Stroke.color = const Color(0xff4F359B).withOpacity(0.5);
    canvas.drawCircle(Offset(size.width * 0.4986667, size.height * 0.8957143),
        size.width * 0.1933333, paint1Stroke);

    // Paint paint_1_fill = Paint()..style=PaintingStyle.fill;
    // paint_1_fill.color = Color(0xff000000).withOpacity(1.0);
    // canvas.drawCircle(Offset(size.width*0.4986667,size.height*0.8957143),size.width*0.1933333,paint_1_fill);

    Path path_2 = Path();
    path_2.moveTo(size.width, 0);
    path_2.lineTo(0, 0);
    path_2.lineTo(0, size.height * 0.8671429);
    path_2.cubicTo(
        0,
        size.height * 0.8987014,
        size.width * 0.04775627,
        size.height * 0.9242857,
        size.width * 0.1066667,
        size.height * 0.9242857);
    path_2.lineTo(size.width * 0.3702427, size.height * 0.9242857);
    path_2.cubicTo(
        size.width * 0.3847840,
        size.height * 0.9263629,
        size.width * 0.3962053,
        size.height * 0.9326986,
        size.width * 0.4088827,
        size.height * 0.9397329);
    path_2.cubicTo(
        size.width * 0.4293653,
        size.height * 0.9510971,
        size.width * 0.4531360,
        size.height * 0.9642857,
        size.width * 0.4986667,
        size.height * 0.9642857);
    path_2.cubicTo(
        size.width * 0.5437307,
        size.height * 0.9642857,
        size.width * 0.5667653,
        size.height * 0.9513671,
        size.width * 0.5868880,
        size.height * 0.9400843);
    path_2.cubicTo(
        size.width * 0.5996800,
        size.height * 0.9329100,
        size.width * 0.6112960,
        size.height * 0.9263971,
        size.width * 0.6266427,
        size.height * 0.9242857);
    path_2.lineTo(size.width * 0.8933333, size.height * 0.9242857);
    path_2.cubicTo(size.width * 0.9522427, size.height * 0.9242857, size.width,
        size.height * 0.8987014, size.width, size.height * 0.8671429);
    path_2.lineTo(size.width, 0);
    path_2.close();

    Paint paint2Fill = Paint()..style = PaintingStyle.fill;
    paint2Fill.color = const Color(0xff4F359B).withOpacity(1.0);
    canvas.drawPath(path_2, paint2Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
