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
        return Container(height: Get.height*0.15,
          width: Get.width * 0.3,

          decoration: BoxDecoration(
            color: ColorRes.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow:  [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                offset: const Offset(
                  2.0,
                  2.0,
                ),
                blurRadius: 10.0,
                spreadRadius: 2.0,
              ), //BoxShadow
              const BoxShadow(
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
                        controller.statusController.text = paramList[index];
                        controller.martialStatusDropdown=false;
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
          height: Get.height*0.19,
          width: Get.width * 0.3,
          decoration: BoxDecoration(
            color: ColorRes.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow:  [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                offset: const Offset(
                  2.0,
                  2.0,
                ),
                blurRadius: 10.0,
                spreadRadius: 2.0,
              ), //BoxShadow
              const BoxShadow(
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
              return Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                      onTap: () {
                        controller.ethnicityController.text = paramList[index];
                        controller.ethnicityDropdown=false;
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
          height: Get.height*0.3,
          width: Get.width * 0.3,
          decoration: BoxDecoration(
            color: ColorRes.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow:  [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                offset: const Offset(
                  2.0,
                  2.0,
                ),
                blurRadius: 10.0,
                spreadRadius: 2.0,
              ), //BoxShadow
              const BoxShadow(
                color: Colors.white,
                offset: const Offset(0.0, 0.0),
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
                        controller.kidsController.text = paramList[index];
                        controller.kidsDropdown=false;
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
        return Container(height: Get.height *0.12,
          width: Get.width * 0.85,
          decoration: BoxDecoration(
            color: ColorRes.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow:  [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                offset: const Offset(
                  2.0,
                  2.0,
                ),
                blurRadius: 10.0,
                spreadRadius: 2.0,
              ), //BoxShadow
              const BoxShadow(
                color: Colors.white,
                offset: const Offset(0.0, 0.0),
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
                        controller.idType.text = paramList[index];
                        controller.idTypeDrop = false;
                        controller.update(['IdVerification_screen']);
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

class AppDropDownProfessionType extends StatelessWidget {
  final List<String> paramList;
  final Function(String) onTap;

  const AppDropDownProfessionType({
    Key? key,
    required this.paramList,
    required this.onTap,
  }) : super(key: key);

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
            borderRadius: BorderRadius.circular(15),
            boxShadow:  [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                offset: const Offset(
                  2.0,
                  2.0,
                ),
                blurRadius: 10.0,
                spreadRadius: 2.0,
              ), //BoxShadow
              const BoxShadow(
                color: Colors.white,
                offset: const Offset(0.0, 0.0),
                blurRadius: 0.0,
                spreadRadius: 0.0,
              ), //BoxShadow
            ],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: /*DropdownButton<String>(
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
              return Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                      onTap: () {
                        controller.profession.text = paramList[index];
                        controller.professions = false;
                        controller.update(['doctor']);
                      },
                      child: Text(
                        paramList[index],
                        style: gilroyMediumTextStyle(
                            color: Colors.black, fontSize: 16),
                      )),
                  (index + 1) == paramList[index].length
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
