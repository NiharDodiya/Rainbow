import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/screens/auth/register/register_controller.dart';
import 'package:rainbow/screens/idVerification/idverification_controller.dart';
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
    RegisterController controller = Get.put(RegisterController());
    return GetBuilder<RegisterController>(
      id: 'register_screen',
      builder: (controller) {
        return Container(
          width: Get.width * 0.3,
          constraints: BoxConstraints(
            minHeight: Get.height * 0.0739,
            maxHeight: Get.height * 0.18,
          ),
          decoration: BoxDecoration(
            color: ColorRes.white,
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: ListView.builder(
            itemCount: paramList.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  InkWell(
                      onTap: () {
                        controller.statusController.text = paramList[index];
                      },
                      child: Text(
                        paramList[index],
                        style: textStyleFont14Black,
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

class AppDropDownEthnicity extends StatelessWidget {
  final List<String> paramList;
  final Function(String) onTap;

  const AppDropDownEthnicity({
    Key? key,
    required this.paramList,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RegisterController controller = Get.put(RegisterController());
    return GetBuilder<RegisterController>(
      id: 'register_screen',
      builder: (controller) {
        return Container(
          width: Get.width * 0.3,
          constraints: BoxConstraints(
            minHeight: Get.height * 0.0739,
            maxHeight: Get.height * 0.18,
          ),
          decoration: BoxDecoration(
            color: ColorRes.white,
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: ListView.builder(
            itemCount: paramList.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  InkWell(
                      onTap: () {
                        controller.ethnicityController.text = paramList[index];
                      },
                      child: Text(
                        paramList[index],
                        style: textStyleFont14Black,
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

class AppDropDownNoOfKids extends StatelessWidget {
  final List<String> paramList;
  final Function(String) onTap;

  const AppDropDownNoOfKids({
    Key? key,
    required this.paramList,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RegisterController controller = Get.put(RegisterController());
    return GetBuilder<RegisterController>(
      id: RegisterController,
      builder: (controller) {
        return Container(
          width: Get.width * 0.2,
          constraints: BoxConstraints(
            minHeight: Get.height * 0.0739,
            maxHeight: Get.height * 0.18,
          ),
          decoration: BoxDecoration(
            color: ColorRes.white,
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: ListView.builder(
            itemCount: paramList.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  InkWell(
                      onTap: () {
                        controller.kidsController.text = paramList[index];
                      },
                      child: Text(
                        paramList[index],
                        style: textStyleFont14Black,
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

class AppDroDownIdType extends StatelessWidget {
  final List<String> paramList;
  final Function(String) onTap;

  const AppDroDownIdType({
    Key? key,
    required this.paramList,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    IdVerificationController controller = Get.put(IdVerificationController());
    return GetBuilder<IdVerificationController>(
      id: 'register_screen',
      builder: (controller) {
        return Container(
          width: Get.width * 0.3,
          constraints: BoxConstraints(
            minHeight: Get.height * 0.0739,
            maxHeight: Get.height * 0.18,
          ),
          decoration: BoxDecoration(
            color: ColorRes.white,
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: ListView.builder(
            itemCount: paramList.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  InkWell(
                      onTap: () {
                        controller.idType.text = paramList[index];
                      },
                      child: Text(
                        paramList[index],
                        style: textStyleFont14Black,
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
