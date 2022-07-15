import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/model/profile_model.dart';
import 'package:rainbow/screens/Home/settings/connections/connections_profile/connections_profile_controller.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialIcons extends StatelessWidget {
  final ConnectionsProfileController controller = Get.find();
  SocialIcons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProfileData? data = controller.profileModel.data;
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          InkWell(onTap: () async {
            await launchUrl(
                Uri.parse(data!.instagram.toString()));
            print("insta");
          },
            child:  data!.instagram.toString().isEmpty
                ? const SizedBox()
                :Container(
              height: 24,
              width: 24,
              margin: const EdgeInsets.only(
                left: 5,
                right: 5,
              ),
              child: Image.asset(
                AssetRes.instagram,
                height: 24,
                width: 24,
              ),
            ),
          ),
          InkWell(
              onTap: () async {
                await launchUrl(
                    Uri.parse(data.youtube.toString()));
                print("youtube");
              },
              child:  data.youtube.toString().isEmpty
                  ? const SizedBox()
                  :Container(
                height: 24,
                width: 24,
                margin: const EdgeInsets.only(
                  left: 5,
                  right: 5,
                ),
                child: Image.asset(
                  AssetRes.youtube,
                  height: 24,
                  width: 24,
                ),
              )
            /* mediaIcon(
                    controller.viewProfile.data!.youtube.toString() == ""
                        ? ""
                        : )*/),
          InkWell(
              onTap: () async {
                await launchUrl(Uri.parse(
                    data.facebook.toString()));

                print("facebook");
              },
              child: data.facebook.toString().isEmpty
                  ? const SizedBox()
                  :Container(
                height: 24,
                width: 24,
                margin: const EdgeInsets.only(
                  left: 5,
                  right: 5,
                ),
                child: Image.asset(
                  AssetRes.facebook1,
                  height: 24,
                  width: 24,
                ),
              )
            /*     mediaIcon()*/),
          InkWell(
              onTap: () async {
                await launchUrl(
                    Uri.parse(data.twitter.toString()));

                print("twitter");
              },
              child:
              data.twitter.toString().isEmpty
                  ? const SizedBox()
                  :Container(
                height: 24,
                width: 24,
                margin: const EdgeInsets.only(
                  left: 5,
                  right: 5,
                ),
                child: Image.asset(
                  AssetRes.twitter,
                  height: 24,
                  width: 24,
                ),
              )
            /* mediaIcon(
                    controller.viewProfile.data!.twitter.toString() == ""
                        ? ""
                        : )*/),
        ],
      ),
    );
  }
}
