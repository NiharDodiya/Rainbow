import 'package:get/get.dart';

class SetupDateController extends GetxController {
  DateTime startTime = DateTime.now();
  DateTime endtime = DateTime.now();
  List<String> list = ["1", "2", "3"];
  String select = '';

  rangSelect(start, end, range) {
    startTime = start;
    endtime = end;
    update(['range']);
  }

  drop(val) {
    select = val;
    update(['drop']);
  }
}
