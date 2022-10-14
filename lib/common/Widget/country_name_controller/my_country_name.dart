import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/country_name_controller/country_name_controller.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/common/helper.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/color_res.dart';

CountryNameController countryNameController = Get.put(CountryNameController());

Widget dropdownButtonCountry() {
  TextEditingController countryController = TextEditingController();
  return Column(
    children: [
      GetBuilder<CountryNameController>(
          id: "drop",
          builder: (controller) {
            return Container(
              width: Get.width / 1.24,
              height: 60,
              decoration: BoxDecoration(
                color: ColorRes.white,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.only(left: 20, top: 5),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 14,
                        child: InkWell(
                          child: TextField(
                            controller: countryController,
                            style: textFieldText,
                            obscuringCharacter: "•",
                            onChanged: (value) {
                              controller.serching(value);
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: gilroyMediumTextStyle(
                                  fontSize: 18,
                                  color: ColorRes.black.withOpacity(0.3)),
                              hintText: "Canada",
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: controller.dropDownBox,
                        icon: Image.asset(AssetRes.arrowDown, height: 20),
                      ),
                      const SizedBox(width: 5),
                    ],
                  ),
                ],
              ),
            );
          }),
      GetBuilder<CountryNameController>(
          id: "drop",
          builder: (controller) {
            return (controller.countryBox == true)
                ? Container(
                    height: 160,
                    width: 390,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: (countryController.text.isEmpty)
                            ? listNationalities.data!.map((e) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, top: 7, bottom: 7),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: InkWell(
                                      onTap: () {
                                        countryController.text = e.name!;
                                        controller.countryBox = false;
                                        controller.update(["drop"]);
                                      },
                                      child: Text(
                                        e.name!,
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 16),
                                      ),
                                    ),
                                  ),
                                );
                              }).toList()
                            : controller.filterList.map((e) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, top: 7, bottom: 7),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: InkWell(
                                      onTap: () {
                                        countryController.text = e.name!;
                                        controller.countryBox = false;
                                        controller.update(["drop"]);
                                      },
                                      child: Text(
                                        e.name!,
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 16),
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                      ),
                    ),
                  )
                : const SizedBox();
          }),
      const SizedBox(
        height: 10,
      ),
    ],
  );
}

/*class dropdownButtonCountry extends StatelessWidget {

  TextEditingController? countryController;

  dropdownButtonCountry({required this.countryController, Key? key}) : super(key: key);

  CountryNameController countryNameController = Get.put(CountryNameController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GetBuilder<CountryNameController>(
            id: "drop",
            builder: (controller){
              return  Container(
                width: Get.width/1.24,
                height: 60,
                decoration: BoxDecoration(
                  color: ColorRes.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.only(left: 20, top: 5),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 14,
                          child: InkWell(
                            child: TextField(
                              controller: countryController,
                              style: textFieldText,
                              obscuringCharacter: "•",
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintStyle: gilroyMediumTextStyle(
                                    fontSize: 18,
                                    color: ColorRes.black.withOpacity(0.3)),
                                hintText: "Canada",
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: controller.dropDownBox,
                          icon: Image.asset(AssetRes.arrowDown, height: 20),)
                      ],
                    ),

                  ],
                ),
              );
            }),
        GetBuilder<CountryNameController>(
            id: "drop",
            builder: (controller){
              return  (controller.countryBox == true)
                  ?Container(
                height: 150,
                width: 390,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: SingleChildScrollView(

                  child: Column(
                    children: countryCity.map((e) {
                      return Padding(
                        padding: EdgeInsets.only(left: 20, top: 7, bottom: 7),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: InkWell(
                            onTap: (){
                              countryController!.text = e;
                              controller.update(["drop"]);
                            },
                            child: Text(e, style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              )
                  :SizedBox();
            }),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}*/
