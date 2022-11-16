import 'package:get/get.dart';
import 'package:rainbow/common/Widget/premiumPopUpBox/api/subscribe_popup_api.dart';
import 'package:rainbow/model/list_card_model.dart';
import 'package:rainbow/screens/advertisement/ad_payment/ad_payment_api/ad_payment_api.dart';
import 'package:rainbow/screens/dashboard/dash_board.dart';

class SubscriptionPaymentController extends GetxController {
  int index = 0;

  changeIndex(int id) {
    index = id;
    update(['sub']);
  }

  RxBool loader = false.obs;
  ListCardModel listCardModel = ListCardModel();

  listCardApi() async {
    try {
      loader.value = true;
      listCardModel = await ListCartApi.listCardsApi();
      update(['sub']);
      loader.value = false;
    } catch (e) {
      //errorToast("No internet connection");
      loader.value = false;
    }
  }

  onTapContinues() async {
    try {
      loader.value = true;
      await UserSubscriptionAddApi.userSubscriptionAddApi();
      loader.value = false;
      Get.offAll(()=> const Dashboard());
    } catch (e) {
      loader.value = false;
    }
  }
}
