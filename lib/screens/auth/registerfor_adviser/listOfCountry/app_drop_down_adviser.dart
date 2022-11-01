// class AppDropDownAdviser extends StatelessWidget {
//   final List<String> paramList;
//   final Function(String) onTap;
//
//   const AppDropDownAdviser({
//     Key? key,
//     required this.paramList,
//     required this.onTap,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     AdviserRegisterController controller = Get.put(AdviserRegisterController());
//     return GetBuilder<AdviserRegisterController>(
//       id: 'register_screen',
//       builder: (controller) {
//         return Container(height: Get.height*0.15,
//           width: Get.width * 0.3,
//
//           decoration: BoxDecoration(
//             color: ColorRes.white,
//             borderRadius: BorderRadius.circular(20),
//             boxShadow: const [
//               BoxShadow(
//                 color: Colors.grey,
//                 offset: Offset(
//                   2.0,
//                   2.0,
//                 ),
//                 blurRadius: 10.0,
//                 spreadRadius: 2.0,
//               ), //BoxShadow
//               BoxShadow(
//                 color: Colors.white,
//                 offset: Offset(0.0, 0.0),
//                 blurRadius: 0.0,
//                 spreadRadius: 0.0,
//               ), //BoxShadow
//             ],
//           ),
//           padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//           child: ListView.builder(
//             itemCount: paramList.length,
//             itemBuilder: (context, index) {
//               return Column(
//                 children: [
//                   InkWell(
//                       onTap: () {
//                         controller.country.text = paramList[index];
//                         controller.countryCityDropdown=false;
//                         controller.update(['register_screen']);
//                       },
//                       child: Text(
//                         paramList[index],
//                         style: gilroyMediumTextStyle(color: Colors.black,fontSize: 14),
//                       )),
//                   (index + 1) == paramList.length
//                       ? const SizedBox()
//                       : const Divider(),
//                 ],
//               );
//             },
//           ),
//         );
//       },
//     );
//   }
// }
