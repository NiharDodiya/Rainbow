import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/screens/signIn/signIn_screen.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/color_res.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: Get.height * 0.79,
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
                          top: Get.height * 0.23,
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
                          padding: EdgeInsets.only(top: Get.height * 0.009),
                          child: Center(
                              child: Text(
                            "Help, Support & Solutions For Families",
                            style: textStyleFont18White,
                          )),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              right: 335, top: Get.height * 0.41),
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
                          padding: EdgeInsets.only(top: Get.height * 0.65),
                          child: Center(
                            child: Container(
                              height: 64,
                              width: 64,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.yellow),
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
                Padding(
                  padding: EdgeInsets.only(top: Get.height * 0.66),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: Get.height * 0.145,
                      width: Get.height * 0.145,
                      decoration: BoxDecoration(
                        border: Border.all(color: ColorRes.color_4F359B),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: Get.height * 0.65),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: GestureDetector(
                      onTap: () {
                        Get.to(const SignInScreen());
                      },
                      child: Container(
                        height: Get.height * 0.180,
                        width: Get.height * 0.180,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color(0XFF4F359B).withOpacity(0.3)),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width, 0);
    path_0.lineTo(0, 0);
    path_0.lineTo(0, size.height * 0.8992593);
    path_0.cubicTo(
        0,
        size.height * 0.9319867,
        size.width * 0.04775627,
        size.height * 0.9585185,
        size.width * 0.1066667,
        size.height * 0.9585185);
    path_0.lineTo(size.width * 0.3702427, size.height * 0.9585185);
    path_0.cubicTo(
        size.width * 0.3847840,
        size.height * 0.9606726,
        size.width * 0.3962053,
        size.height * 0.9672430,
        size.width * 0.4088827,
        size.height * 0.9745378);
    path_0.cubicTo(
        size.width * 0.4293653,
        size.height * 0.9863230,
        size.width * 0.4531360,
        size.height,
        size.width * 0.4986667,
        size.height);
    path_0.cubicTo(
        size.width * 0.5437307,
        size.height,
        size.width * 0.5667653,
        size.height * 0.9866030,
        size.width * 0.5868880,
        size.height * 0.9749022);
    path_0.cubicTo(
        size.width * 0.5996800,
        size.height * 0.9674622,
        size.width * 0.6112960,
        size.height * 0.9607081,
        size.width * 0.6266427,
        size.height * 0.9585185);
    path_0.lineTo(size.width * 0.8933333, size.height * 0.9585185);
    path_0.cubicTo(size.width * 0.9522427, size.height * 0.9585185, size.width,
        size.height * 0.9319867, size.width, size.height * 0.8992593);
    path_0.lineTo(size.width, 0);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = const Color(0xff4F359B).withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class CustomClipPath extends CustomClipper<Path> {
  var radius = 50.0;
  var corner = 50.0;

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width, 0);

    path.lineTo(size.width, size.height - radius - corner);
    path.quadraticBezierTo(
      size.width - (corner / 2) + 20,
      size.height - radius - (corner / 2) + 20,
      size.width - corner,
      size.height - radius,
    );
    path.lineTo(size.width / 2 + (radius / 2), size.height - radius);
    path.arcToPoint(Offset(size.width / 2, size.height),
        clockwise: true, radius: Radius.circular(radius / 1.5));
    path.arcToPoint(Offset(size.width / 2 - (radius / 2), size.height - radius),
        clockwise: true, radius: Radius.circular(radius / 1.5));
    path.lineTo(corner, size.height - radius);
    path.quadraticBezierTo(
        (corner / 2) - 20,
        size.height - radius - (corner / 2) + 20,
        0,
        size.height - radius - corner);

    /*path.quadraticBezierTo(
        size.width / 2, size.height, 0, size.height - radius);*/
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
