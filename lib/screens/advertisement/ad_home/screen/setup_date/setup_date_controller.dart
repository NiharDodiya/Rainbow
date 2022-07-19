import 'package:country_picker/country_picker.dart';
import 'package:get/get.dart';

class SetupDateController extends GetxController {
  DateTime startTime = DateTime.now();
  DateTime endtime = DateTime.now();
  List<String> list = ["1", "2", "3"];
  String select = 'Caneda';


  rangSelect(start, end, range) {
    startTime = start;
    endtime = end;
    update(['range']);
  }

  drop(val) {
    select = val;
    update(['drop']);
  }
   void onCountryTap( context) {
    showCountryPicker(
      context: context,
      showPhoneCode: false,
      onSelect: ( country) {
        // countryModel = country;
        select =country.toString();

        update(['Phone']);
      },
    );
  }
}
