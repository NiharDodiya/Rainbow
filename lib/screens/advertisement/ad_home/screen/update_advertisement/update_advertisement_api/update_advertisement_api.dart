// import 'dart:convert';
//
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:rainbow/common/popup.dart';
// import 'package:rainbow/service/pref_services.dart';
// import 'package:rainbow/utils/end_points.dart';
// import 'package:rainbow/utils/pref_keys.dart';
//
//
// class UpdateAdvertiseAPI {
//
//   //static final UpdateAdvertiseAPI updateAdvertiseAPI = UpdateAdvertiseAPI._();
//
//   updatePostAdvertiseAPI({required Map<String, dynamic> data}) async {
//     Uri url = Uri.parse(EndPoints.updateAdvertiser);
//
//     http.Response response =
//     await http.post(url, body: jsonEncode(data), headers: {
//       "Content-Type": "application/json",
//       "x-access-token": PrefService.getString(PrefKeys.registerToken)
//     });
//
//     if (response.statusCode == 200) {
//       print("========= ${response.statusCode} ==============");
//       print(PrefService.getString(PrefKeys.registerToken));
//
//       //Map<String, dynamic> allData = jsonDecode(response.body);
//
//       jsonDecode(response.body);
//
//       flutterToast(jsonDecode(response.body)["message"]);
//
//       return response.statusCode;
//     } else {
//       print("============ ${response.statusCode} ==============");
//       return response.statusCode;
//     }
//   }
// }
