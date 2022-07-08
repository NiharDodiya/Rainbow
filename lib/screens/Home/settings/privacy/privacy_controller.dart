import 'package:get/get.dart';

class PrivacyController extends GetxController {
  bool displayPhoto = true;
  bool basicInformation = false;
  bool socialMeadiam = false;
  bool aboutMe = false;
  bool hobbiesAndInterest = false;
  bool testimonials = false;
  bool visitors = false;

  onchange(String? value) {
    // if (displayPhoto) {
    //   displayPhoto = false;
    // } else {
    //   displayPhoto = true;
    // }

    for (int i = 0; tital.length < i; i++) {
      //tital[i] = value!;
      if(tital[i]==value){
        if(values[i]){
          values[i] = true;
        }
        else{
          values[i] = false;
        }
      }

      // if (values[i] == true) {
      //   values[i] = false;
      // } else {
      //   values[i] = true;
      // }
    }
    update(["check"]);
  }

  List<String> tital = [
    "displayPhoto",
    "basicInformation",
    "socialMeadiam",
    "aboutMe",
    "hobbiesAndInterest",
    "testimonials",
    "visitors"
  ];
  List<bool> values = [false, false, false, false, false, false, false];
}
