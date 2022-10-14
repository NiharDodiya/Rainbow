import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rainbow/model/edit_advertise_model.dart';
import 'package:rainbow/screens/advertisement/ad_home/myAdvertiser_api/myAdvertiser_api.dart';
import 'package:rainbow/screens/advertisement/ad_home/screen/update_advertisement/update_advertisement_controller.dart';

class EditAdvertiesementController extends GetxController {
  // CreateAdvertisementController createAdvertisementController =
  //     Get.find<CreateAdvertisementController>();
  // List imageList = [];
  // String imageName = '';
  //
  // getImagePath() {
  //   imageName = createAdvertisementController.imagePath.first.path;
  //   imageList = imageName.split("/");
  //   imageName = imageList.last;
  //   update(['edit']);
  // }
  UpdateAdvertiseController updateAdvertiseController =
      Get.put(UpdateAdvertiseController());
  RxBool loader = false.obs;
  EditAdvertisementModel editAdvertisementModel = EditAdvertisementModel();

  Future<void> myEditAdvertiserListData({required int id}) async {
    try {
      loader.value = true;
      editAdvertisementModel = await MyAdvertiserApi.editAdvertiserList(
          data: {"id_advertisement": id});
      updateAdvertiseController.tagsController.text = editAdvertisementModel
          .data!.tagsList
          .toString()
          .replaceAll("[", "")
          .replaceAll("]", "");

      updateAdvertiseController.address =
          editAdvertisementModel.data!.location.toString();
      updateAdvertiseController.titleController.text =
          editAdvertisementModel.data!.title.toString();

      updateAdvertiseController.selectedCity =
          editAdvertisementModel.data!.country!;
      updateAdvertiseController.countryController.text =
          editAdvertisementModel.data!.country.toString();

      updateAdvertiseController.codeId =
          editAdvertisementModel.data!.userDetail!.idCountry;
      updateAdvertiseController.streetController.text =
          editAdvertisementModel.data!.street.toString();
      updateAdvertiseController.cityController.text =
          editAdvertisementModel.data!.location.toString();
      updateAdvertiseController.provinceController.text =
          editAdvertisementModel.data!.province.toString();
      updateAdvertiseController.postalCodeController.text =
          editAdvertisementModel.data!.postalCode.toString();
/*updateAdvertiseController.dateController.text = DateFormat('dd/MM/yyyy').format(editAdvertisementModel.data!.date as DateTime);*/
      updateAdvertiseController.dateController.text = DateFormat('yyyy-MM-dd')
          .format(DateTime.parse(editAdvertisementModel.data!.date.toString()));
      updateAdvertiseController.descriptoionController.text =
          editAdvertisementModel.data!.description.toString();
      updateAdvertiseController.callToAction =
          editAdvertisementModel.data!.callAction.toString();
      updateAdvertiseController.callToActionController.text =
          editAdvertisementModel.data!.callAction.toString();
      updateAdvertiseController.urlLinkController.text =
          editAdvertisementModel.data!.urlLink.toString();
      /*   updateAdvertiseController.countryController.text =
          editAdvertisementModel.data!.userDetail!.idCountry.toString();
      updateAdvertiseController.selectedCity =
          editAdvertisementModel.data!.userDetail!.idCountry.toString();*/

      update(['more']);
      loader.value = false;
    } catch (e) {
      loader.value = false;


    }
  }
}
