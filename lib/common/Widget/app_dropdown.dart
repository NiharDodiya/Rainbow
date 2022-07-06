import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/screens/auth/doctor_register/doctorRegister_controller.dart';
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
            minHeight: Get.height * 0.04,
            maxHeight: Get.height * 0.1,
          ),
          decoration: BoxDecoration(
            color: ColorRes.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
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
              return Column(
                children: [
                  InkWell(
                      onTap: () {
                        controller.statusController.text = paramList[index];
                        controller.martialStatusDropdown=false;
                        controller.update(['register_screen']);
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
            minHeight: Get.height * 0.04,
            maxHeight: Get.height * 0.1,
          ),
          decoration: BoxDecoration(
            color: ColorRes.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
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
          child:/*DropdownButton<String>(
            items: <String>['A', 'B', 'C', 'D'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (_) {

            },
          )*/
          ListView.builder(
            itemCount: paramList.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  InkWell(
                      onTap: () {
                        controller.ethnicityController.text = paramList[index];
                        controller.ethnicityDropdown=false;
                        controller.update(['register_screen']);
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
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
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
              return Column(
                children: [
                  InkWell(
                      onTap: () {
                        controller.kidsController.text = paramList[index];
                        controller.kidsDropdown=false;
                        controller.update(['register_screen']);
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
      id: 'IdVerification_screen',
      builder: (controller) {
        return Container(
          width: Get.width * 0.85,
          constraints: BoxConstraints(
            minHeight: Get.height * 0.07,
            maxHeight: Get.height * 0.1,
          ),
          decoration: BoxDecoration(
            color: ColorRes.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
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
              return Column(
                children: [
                  InkWell(
                      onTap: () {
                        controller.idType.text = paramList[index];
                        controller.idTypeDrop = false;
                        controller.update(['IdVerification_screen']);
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

class AppDropDownProfessionType extends StatelessWidget {
  const AppDropDownProfessionType({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DoctorRegisterController controller = Get.put(DoctorRegisterController());
    return GetBuilder<DoctorRegisterController>(
      id: 'register_screen',
      builder: (controller) {
        return Container(
          width: Get.width * 0.3,
          constraints: BoxConstraints(
            minHeight: Get.height * 0.04,
            maxHeight: Get.height * 0.1,
          ),
          decoration: BoxDecoration(
            color: ColorRes.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
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
          child:/*DropdownButton<String>(
            items: <String>['A', 'B', 'C', 'D'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (_) {

            },
          )*/
          ListView.builder(
            itemCount: controller.professionList.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  InkWell(
                      onTap: () {
                        controller.profession.text = controller.professionList[index];
                        controller.professions=false;
                        controller.update(['register_screen']);
                      },
                      child: Text(
                        controller.professionList[index],
                        style: textStyleFont14Black,
                      )),
                  (index + 1) == controller.professionList[index].length
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
