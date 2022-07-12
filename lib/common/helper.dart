import 'package:rainbow/screens/auth/register/list_nationalites/list_nationalitesJson.dart';
import 'package:rainbow/screens/auth/registerfor_adviser/listOfCountry/listOfCountry_json.dart';

ListCountryModel listCountryModel = ListCountryModel();
ListNationalities listNationalities = ListNationalities();
List<String> countryCity = [];
List<String> countryId = [];
List<String> countryNationCity = [];
List<String> countryNationId = [];

void getCountry() {
  countryCity=[];
  countryId=[];
  for (int i = 0; i < listCountryModel.data!.length; i++) {
    countryCity.add(listCountryModel.data![i].name!);
    countryId.add(listCountryModel.data![i].id!.toString());
  }
  print(countryCity);
  print(countryId);
}


void getCountryNation() {
  countryNationCity= [];
  countryNationId= [];
  for (int i = 0; i < listNationalities.data!.length; i++) {
    countryNationCity.add(listNationalities.data![i].name!);
    countryNationId.add(listNationalities.data![i].id!.toString());
  }
  print("countryNationCity => $countryNationCity");
  print("countryNationCity => $countryNationId");
}