import 'package:country_picker/country_picker.dart';
import 'package:get/get.dart';
import 'package:rainbow/utils/asset_res.dart';

class SetupDateController extends GetxController {
  DateTime startTime = DateTime.now();
  DateTime endtime = DateTime.now();
  String flag = AssetRes.flag01;
  bool showDropDown = false;
  List<String> flagList = [AssetRes.flag01, AssetRes.flag02];
  List<String> list = ["Caneda", "India"];
  String currency = "\$";
  List<String> currencyList = ["\$", "₹"];
  String select = 'Caneda';

  rangSelect(start, end, range) {
    startTime = start;
    endtime = end;
    update(['range']);
  }

  showDrop() {
    showDropDown = true;
    update(['selectC']);
  }

  selectContry(index) {
    showDropDown = false;
    select = list[index];
    flag = flagList[index];
    currency = currencyList[index];
    update(['selectC']);
  }

  drop(val) {
    select = val;
    update(['drop']);
  }

  void onCountryTap(context) {
    showCountryPicker(
      context: context,
      showPhoneCode: false,
      onSelect: (country) {
        // countryModel = country;
        select = country.toString();

        update(['Phone']);
      },
    );
  }
}
