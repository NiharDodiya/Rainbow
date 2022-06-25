import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/screens/auth/auth_dashboard/auth_dashboard.dart';
import 'package:rainbow/screens/splash/splash_controller.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/color_res.dart';
import 'package:rainbow/utils/strings.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SplashController controller =Get.put(SplashController());
    return GetBuilder<SplashController>(id: "splash",builder: (controller) {
      return GestureDetector(
        onTap: () {
          Get.to(() => const AuthDashboard());
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          body:  SafeArea(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                PageView(
                  onPageChanged: (int page) {
                    /*   setState(() {
                      currentIndex = page;
                    });*/
                    controller.onChanged(page);
                  },
                  controller: controller.pageController,
                  children: <Widget>[
                    aniMation(),
                    aniMation(),
                    aniMation(),
                    aniMation(),

                  ],
                ),
                Padding(padding: const EdgeInsets.only(top: 550),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(padding: const EdgeInsets.only(left: 15,top: 30),
                              child: Text(Strings.next,style: textStyleFont12,)),
                          const Spacer(),

                          Padding(padding: const EdgeInsets.only(top: 30),
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: _buildIndicator(controller),
                              ),
                            ),
                          ),
                          const Spacer(),

                          Padding(padding: const EdgeInsets.only(left: 15,top: 30,right: 15),
                              child: Text("Skip",style: textStyleFont12,)),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
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
          color: isActive?ColorRes.color_4F359B:ColorRes.color_656F85,
          borderRadius: BorderRadius.circular(5)),
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
  Widget aniMation()
  {
    return  Stack(
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
                    Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Image(
                          image: const AssetImage(
                            AssetRes.sp1,
                          ),
                          height: Get.height * 0.35,
                        ),
                      ),
                    ),  Padding(
                      padding: EdgeInsets.only(left: 90,top: Get.height*0.1),
                      child: const Align(
                        alignment: Alignment.topCenter,
                        child: Image(
                          image: AssetImage(
                            AssetRes.sp3,
                          ),
                          height: 12,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Image(
                          image: const AssetImage(
                            AssetRes.sp2,
                          ),
                          height: Get.height * 0.27,
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: Get.height * 0.22,
                  left: 30,
                  child: Container(
                    height: Get.height * 0.120,
                    width: Get.width * 0.8,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(AssetRes.rainBowLogo))),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(bottom: Get.height * 0.1, ),
                  child: Center(
                    child: Text(
                      "Help, Support & Solutions For Families",
                      style: textStyleFont18White,
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(
                      right: 335, top: Get.height * 0.4),
                  child: const Align(
                    alignment: Alignment.topLeft,
                    child: Image(
                      image: AssetImage(
                        AssetRes.greyCircle,
                      ),
                      height: 42,
                      width: 42,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: 335, top: Get.height * 0.52),
                  child: const Align(
                    alignment: Alignment.topRight,
                    child: Image(
                      image: AssetImage(
                        AssetRes.whiteCircle,
                      ),
                      height: 59,
                      width: 59,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: Get.height * 0.62),
                  child: Center(
                    child: Container(
                      height: 64,
                      width: 64,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.yellow),
                      child: const Icon(
                        Icons.arrow_forward_sharp,
                        color: Colors.black,
                        size: 30,
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

    Paint paint_0_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=1;
    paint_0_stroke.color=const Color(0xff4F359B).withOpacity(1);
    canvas.drawCircle(Offset(size.width*0.4986667,size.height*0.8957143),size.width*0.1560000,paint_0_stroke);

    // Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
    // paint_0_fill.color = Color(0xff000000).withOpacity(1.0);
    // canvas.drawCircle(Offset(size.width*0.4986667,size.height*0.8957143),size.width*0.1560000,paint_0_fill);

    Paint paint_1_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=1;
    paint_1_stroke.color=const Color(0xff4F359B).withOpacity(0.5);
    canvas.drawCircle(Offset(size.width*0.4986667,size.height*0.8957143),size.width*0.1933333,paint_1_stroke);

    // Paint paint_1_fill = Paint()..style=PaintingStyle.fill;
    // paint_1_fill.color = Color(0xff000000).withOpacity(1.0);
    // canvas.drawCircle(Offset(size.width*0.4986667,size.height*0.8957143),size.width*0.1933333,paint_1_fill);

    Path path_2 = Path();
    path_2.moveTo(size.width,0);
    path_2.lineTo(0,0);
    path_2.lineTo(0,size.height*0.8671429);
    path_2.cubicTo(0,size.height*0.8987014,size.width*0.04775627,size.height*0.9242857,size.width*0.1066667,size.height*0.9242857);
    path_2.lineTo(size.width*0.3702427,size.height*0.9242857);
    path_2.cubicTo(size.width*0.3847840,size.height*0.9263629,size.width*0.3962053,size.height*0.9326986,size.width*0.4088827,size.height*0.9397329);
    path_2.cubicTo(size.width*0.4293653,size.height*0.9510971,size.width*0.4531360,size.height*0.9642857,size.width*0.4986667,size.height*0.9642857);
    path_2.cubicTo(size.width*0.5437307,size.height*0.9642857,size.width*0.5667653,size.height*0.9513671,size.width*0.5868880,size.height*0.9400843);
    path_2.cubicTo(size.width*0.5996800,size.height*0.9329100,size.width*0.6112960,size.height*0.9263971,size.width*0.6266427,size.height*0.9242857);
    path_2.lineTo(size.width*0.8933333,size.height*0.9242857);
    path_2.cubicTo(size.width*0.9522427,size.height*0.9242857,size.width,size.height*0.8987014,size.width,size.height*0.8671429);
    path_2.lineTo(size.width,0);
    path_2.close();

    Paint paint_2_fill = Paint()..style=PaintingStyle.fill;
    paint_2_fill.color = const Color(0xff4F359B).withOpacity(1.0);
    canvas.drawPath(path_2,paint_2_fill);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}
