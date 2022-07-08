import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mentions/flutter_mentions.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:rainbow/screens/advertisement/ad_dashboard/ad_dashboard.dart';
import 'package:rainbow/screens/auth/auth_dashboard/auth_dashboard.dart';
import 'package:rainbow/screens/dashboard/dashBoard.dart';
import 'package:rainbow/screens/splash/splash_screen.dart';
import 'package:rainbow/service/pref_services.dart';
import 'package:rainbow/utils/color_res.dart';
import 'package:rainbow/utils/pref_keys.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await Firebase.initializeApp();
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
    return GetMaterialApp( builder: (_, child) => Portal(child: child!),
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: ColorRes.themeColor,
        colorScheme: const ColorScheme.dark().copyWith(
          primary: ColorRes.themeColor,
          secondary: ColorRes.themeColor,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const AdvertisementDashBord()
      // !PrefService.getBool(PrefKeys.skipBoardingScreen)
      //     ? SplashScreen()
      //     : PrefService.getBool(PrefKeys.isLogin)
      //     ? const Dashboard()
      //     : PrefService.getBool(PrefKeys.register)
      //     ? const Dashboard()
      //     : AuthDashboard()
    );
  }
}
