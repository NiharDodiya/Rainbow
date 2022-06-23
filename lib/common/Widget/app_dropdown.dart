import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/utils/color_res.dart';

class AppDropdown extends StatelessWidget {
  final List<String> paramList;
  final Function(String) onTap;

  const AppDropdown({
    Key? key,
    required this.paramList,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      constraints: BoxConstraints(
        minHeight: Get.height * 0.0739,
        maxHeight: Get.height * 0.25,
      ),
      decoration: BoxDecoration(
        color: ColorRes.white,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
      child: ListView.builder(
        itemCount: paramList.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Text(paramList[index]),
              (index + 1) == paramList.length
                  ? const SizedBox()
                  : const Divider(),
            ],
          );
        },
      ),
    );
  }
}
