import 'package:get/get.dart';

class SubscriptionPaymentController extends GetxController{
int index =1;
 changeIndex(int id) {
    index = id;
    update(['index']);
  }
}