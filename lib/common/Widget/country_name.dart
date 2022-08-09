import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/color_res.dart';

Widget dropdownButton({
  double? height,
  double? width,
  String? title,
  String? hintText,
  bool showtitle = true,
  String? selectedValue,
  Function(String)? onTap,
  List<String>? dropdownList,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      showtitle
          ? Text(
              title!,
              style: gilroySemiBoldTextStyle(fontSize: 14),
            )
          : SizedBox(),
      showtitle
          ? const SizedBox(
              height: 10,
            )
          : SizedBox(),
      DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          isExpanded: true,
          hint: Row(
            children: [
              const SizedBox(
                width: 4,
              ),
              Expanded(
                child: Text(
                  hintText!,
                  style: gilroyMediumTextStyle(
                    fontSize: 18,
                    color: ColorRes.black.withOpacity(0.3),
                  ),
                ),
              ),
            ],
          ),
          items: dropdownList!
              .map(
                (item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: gilroyMediumTextStyle(
                        fontSize: 16, color: ColorRes.black),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              )
              .toList(),
          value: selectedValue,
          onChanged: (value) => onTap!(value!),
          icon: Image.asset(AssetRes.arrowDown, height: 20),
          iconSize: 14,
          iconEnabledColor: Colors.grey,
          iconDisabledColor: Colors.grey,
          buttonHeight: 60,
          buttonPadding: const EdgeInsets.only(left: 14, right: 23),
          buttonDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          buttonElevation: 0,
          itemHeight: 40,
          itemPadding: const EdgeInsets.only(left: 20, right: 14),
          dropdownMaxHeight: height ?? 100,
          /* height: Get.height*0.19,*/
          dropdownWidth: width ?? Get.width * 0.8,
          dropdownPadding: null,
          dropdownDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: Colors.white,
          ),
          dropdownElevation: 8,
          scrollbarRadius: const Radius.circular(40),
          scrollbarThickness: 6,
          scrollbarAlwaysShow: true,
        ),
      ),
      const SizedBox(
        height: 10,
      ),
    ],
  );
}
