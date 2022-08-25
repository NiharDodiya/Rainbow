import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:rainbow/screens/advertisement/ad_dashboard/ad_dashboard.dart';
import 'package:rainbow/screens/auth/auth_dashboard/auth_dashboard.dart';
import 'package:rainbow/screens/dashboard/dashBoard.dart';
import 'package:rainbow/screens/scanyour_face/scanyourface_controller.dart';
import 'package:rainbow/screens/splash/splash_screen.dart';
import 'package:rainbow/screens/terms_conditions/terms_conditions_screen.dart';
import 'package:rainbow/service/notification_service.dart';
import 'package:rainbow/service/pref_services.dart';
import 'package:rainbow/utils/color_res.dart';
import 'package:rainbow/utils/pref_keys.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await Firebase.initializeApp();
  NotificationService.init();
  await FirebaseMessaging.instance.getToken().then((value) {
    if (kDebugMode) {
      print("FCM Token => $value");
    }
  });
  await PrefService.init();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: ColorRes.color_4F359B
          .withOpacity(0.3), //or set color with: Color(0xFF0000FF)
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<ScanYourFaceController>(() => ScanYourFaceController());
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: ColorRes.themeColor,
        colorScheme: const ColorScheme.dark().copyWith(
          primary: ColorRes.themeColor,
          secondary: ColorRes.themeColor,
        ),
      ),
      debugShowCheckedModeBanner: false,
      // home: ScanYourFaceScreen(),
      home: /*const GoogleMapScreen()*/ /*SupportDetailsScreen(com: "")*/ !PrefService
              .getBool(PrefKeys.skipBoardingScreen)
          ? SplashScreen()
          : (PrefService.getBool(PrefKeys.register))
              ? PrefService.getBool(PrefKeys.showTermsCondition)
                  ? TermsConditionsScreen(showBackBtn: false)
                  : PrefService.getString(PrefKeys.loginRole) == "end_user"
                      ? const Dashboard()
                      : PrefService.getString(PrefKeys.loginRole) == "advertisers"
                          ?AdvertisementDashBord()
                          :PrefService.getBool(PrefKeys.isLogin)==true? const Dashboard():AuthDashboard()
              : AuthDashboard(),
    );
  }
}
