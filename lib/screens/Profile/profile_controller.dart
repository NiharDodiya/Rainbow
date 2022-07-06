import 'package:get/get.dart';
import 'package:rainbow/utils/asset_res.dart';

class ProfileController extends GetxController
{
  RxBool loader = false.obs;
  bool seeMoreAndLess = false;
  List<String> image = [AssetRes.lt1,AssetRes.lt2,AssetRes.lt3,AssetRes.se,AssetRes.homePro,AssetRes.lt1,];
  List<String> imageName = ["Amber Davis","Lyka Keen","Liz Mcguire","Riku Tanida","Natalie Nara ","Sally Wilson",];


  @override
  void onInit()
  {
    init();
    super.onInit();
  }
  Future<void> init() async {
    loader.value = true;

  }
  void onShowMoreTap(bool value) {
    seeMoreAndLess = value;
  }

}