import 'package:get/get.dart';
import 'package:flutter_share/flutter_share.dart';

class SettingsController extends GetxController
{
  void onInit()
  {
    super.onInit();
    update();
  }
  bool isSwitched = false;
  Future<void> share() async {
    await FlutterShare.share(
        title: 'Example share',
        text: 'Example share text',
        linkUrl: 'https://flutter.dev/',
        chooserTitle: 'Example Chooser Title'
    );
  }

}