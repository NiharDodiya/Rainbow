import 'package:rainbow/screens/auth/registerfor_adviser/listOfCountry/listOfCountry_json.dart';

ListCountryModel listCountryModel = ListCountryModel();
List<String> countryCity = [];
List<String> countryId = [];
void getCountry() {
  countryCity=[];
  countryId=[];
  for (int i = 0; i < listCountryModel.data!.length; i++) {
    countryCity.add(listCountryModel.data![i].name!);
    countryId.add(listCountryModel.data![i].id!.toString());
  }
  print(countryCity);
}