import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/screens/auth/registerfor_adviser/registeradviser_controller.dart';
import 'package:rainbow/utils/color_res.dart';



class AppDropDownAdviser extends StatelessWidget {
  final List<String> paramList;
  final Function(String) onTap;

  const AppDropDownAdviser({
    Key? key,
    required this.paramList,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AdviserRegisterController controller = Get.put(AdviserRegisterController());
    return GetBuilder<AdviserRegisterController>(
      id: 'register_screen',
      builder: (controller) {
        return Container(height: Get.height*0.15,
          width: Get.width * 0.3,

          decoration: BoxDecoration(
            color: ColorRes.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow:  [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                offset: Offset(
                  2.0,
                  2.0,
                ),
                blurRadius: 10.0,
                spreadRadius: 2.0,
              ), //BoxShadow
              BoxShadow(
                color: Colors.white,
                offset: Offset(0.0, 0.0),
                blurRadius: 0.0,
                spreadRadius: 0.0,
              ), //BoxShadow
            ],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: ListView.builder(
            itemCount: paramList.length,
            itemBuilder: (context, index) {
              return Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                      onTap: () {
                        controller.country.text = paramList[index];
                        controller.countryCityDropdown=false;
                        controller.update(['register_screen']);
                      },
                      child: Text(
                        paramList[index],
                        style: gilroyMediumTextStyle(color: Colors.black,fontSize: 16),
                      )),
                  (index + 1) == paramList.length
                      ? const SizedBox()
                      : const Divider(),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
