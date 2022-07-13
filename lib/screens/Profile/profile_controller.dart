import 'package:get/get.dart';
import 'package:rainbow/screens/Profile/profile_api/profile_api.dart';
import 'package:rainbow/screens/Profile/profile_api/profile_model.dart';
import 'package:rainbow/screens/Profile/widget/edit_profile/editProfile_contoller.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileController extends GetxController {

  RxBool loader = false.obs;
  bool seeMoreAndLess = false;
  String? url;
  List<String> image = [
    AssetRes.lt1,
    AssetRes.lt2,
    AssetRes.lt3,
    AssetRes.se,
    AssetRes.homePro,
    AssetRes.lt1,
  ];
  List<String> imageName = [
    "Amber Davis",
    "Lyka Keen",
    "Liz Mcguire",
    "Riku Tanida",
    "Natalie Nara ",
    "Sally Wilson",
  ];
  ViewProfile viewProfile = ViewProfile();
  @override
  void onInit() {
    init();
    viewProfileDetails();
    update(["profile"]);
    super.onInit();
  }

  Future<void> init() async {
    loader.value = true;
  }

  void onShowMoreTap(bool value) {
    seeMoreAndLess = value;
  }

  Future<void> viewProfileDetails() async {
    try {
      loader.value = true;
      viewProfile = await ViewProfileApi.postRegister();
      EditProfileController editProfileController =
          Get.put(EditProfileController());
        editProfileController.fullName.text = viewProfile.data!.fullName!;
        // editProfileController.status.text = viewProfile.data!.status!;
        editProfileController.age.text = viewProfile.data!.age.toString();
        editProfileController.city.text = viewProfile.data!.city!;
        editProfileController.height.text = viewProfile.data!.height!;
        editProfileController.weight.text = viewProfile.data!.weight!;
        editProfileController.ethnicity.text = viewProfile.data!.idEthnicity!;
        editProfileController.haveKids.text = viewProfile.data!.noKids!.toString();
        editProfileController.hobbies.text = viewProfile.data!.hobbiesAndInterest!.toString();
        // editProfileController.aboutMe.text = viewProfile.data!.aboutMe!.toString();
      // await PrefService.setValue(PrefKeys.registerToken, registerUser.token.toString());
      loader.value = false;
    } catch (e) {
      loader.value = false;
    }
  }
  void _launchUrl(String? url) async {
    if (!await launchUrl(Uri.parse(url!))) {
      throw 'Could not launch $url';
    }
  }
}
