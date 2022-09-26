import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/premiumPopUpBox/PremiumPopUpBox.dart';
import 'package:rainbow/common/Widget/loaders.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/screens/Home/home_controller.dart';
import 'package:rainbow/screens/Home/settings/connections/connections_controller.dart';
import 'package:rainbow/screens/Home/settings/connections/connections_screen.dart';
import 'package:rainbow/screens/Home/settings/payment/payment_screen.dart';
import 'package:rainbow/screens/Home/settings/settings_controller.dart';
import 'package:rainbow/screens/Home/settings/subscription/subscription_screen.dart';
import 'package:rainbow/screens/Message/message_screen.dart';
import 'package:rainbow/screens/Profile/profile_controller.dart';
import 'package:rainbow/screens/Profile/profile_screen.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/color_res.dart';
import 'package:rainbow/utils/strings.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({Key? key}) : super(key: key);
  SettingsController controller = Get.put(SettingsController());
  ProfileController profileController = Get.put(ProfileController());
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
/*    controller.notification();*/
    controller.getRefferralsCode();
    return Scaffold(
      body: GetBuilder<SettingsController>(
        id: "settings",
        builder: (controller) {
          return Obx(() {
            return SafeArea(
              child: Container(
                width: Get.width,
                padding: EdgeInsets.only(bottom: 50),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      ColorRes.color_50369C,
                      ColorRes.color_D18EEE,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        appBar(context),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                profile(),
                                settingsProperties(context: context),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    controller.loader.isTrue
                        ? const FullScreenLoader()
                        : const SizedBox()
                  ],
                ),
              ),
            );
          });
        },
      ),
    );
  }

  Widget appBar(BuildContext context) {
    return Container(
      width: Get.width,
      color: ColorRes.color_4F359B,
      child: Column(
        children: [
          SizedBox(
            height: Get.height * 0.03,
          ),
          Stack(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: EdgeInsets.only(left: Get.width * 0.05),
                  child: Container(
                    height: 15,
                    width: 35,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage(
                        AssetRes.backIcon,
                      ),
                    )),
                  ),
                ),
              ),
              Center(
                child: Text(
                  Strings.others,
                  style: gilroyBoldTextStyle(),
                ),
              ),
            ],
          ),
          SizedBox(
            height: Get.height * 0.04,
          ),
        ],
      ),
    );
  }

  Widget profile() {
    return Container(
      height: 97,
      width: Get.width,
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(
            height: Get.height * 0.02,
          ),
          Padding(
            padding: EdgeInsets.only(left: Get.width * 0.08),
            child: Row(
              children: [
                (profileController.viewProfile.data?.profileImage?.toString() ??
                            "")
                        .isEmpty
                    ? Container(
                        height: 56,
                        width: 56,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image:
                                    AssetImage(AssetRes.portrait_placeholder))),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: FadeInImage(
                          placeholder: const AssetImage(
                            AssetRes.portrait_placeholder,
                          ),
                          image: NetworkImage(profileController
                              .viewProfile.data!.profileImage!
                              .toString()),
                          height: 56,
                          width: 56,
                          fit: BoxFit.cover,
                        ),
                      ),
                const SizedBox(
                  width: 20,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          profileController.viewProfile.data?.fullName ?? "",
                          style: gilroyBoldTextStyle(
                              color: Colors.black, fontSize: 26),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(() => ProfileScreen(
                                      i: 2,
                                    ))!
                                .then((value) async {
                              await profileController.viewProfileDetails();
                            });
                          },
                          child: Row(
                            children: [
                              SizedBox(
                                height: 15.35,
                                width: 15.35,
                                child: Image.asset(
                                  AssetRes.profileSettinges,
                                  color: ColorRes.color_4F359B,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                Strings.viewProfile,
                                style: gilroyBoldTextStyle(
                                    fontSize: 15, color: ColorRes.color_4F359B),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget settingsProperties({context}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: Get.height * 0.025,
        ),
        //Messages
        InkWell(
          onTap: (){
            /*homeController.viewProfile.data!.userType == "free"
                ? premiumPopUpBox(context: context)
                : Get.to(() => MessageScreen());*/
          },
          child: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Row(
              children: [
                SizedBox(
                  width: Get.width * 0.08,
                ),
                SizedBox(
                    height: 18.98,
                    width: 20.83,
                    child: Image.asset(AssetRes.messages)),
                SizedBox(
                  width: Get.width * 0.06,
                ),
                Text(
                  Strings.messages,
                  style: textStyleFont15White,
                ),
                SizedBox(
                  width: Get.width * 0.555,
                ),
                SizedBox(height: 10, width: 6, child: Image.asset(AssetRes.next))
              ],
            ),
          ),
        ),
        Divider(
          thickness: 1,
          color: ColorRes.color_4F359B.withOpacity(0.4),
        ),
        //Connections
        InkWell(
          onTap: () {
            ConnectionsController connectionController =
                Get.put(ConnectionsController());
            connectionController.init();
            homeController.viewProfile.data!.userType == "free"
                ? premiumPopUpBox(context: context)
                : Get.to(() => ConnectionsScreen());
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 5),
            child: Row(
              children: [
                SizedBox(
                  width: Get.width * 0.08,
                ),
                SizedBox(
                    height: 18.98,
                    width: 20.83,
                    child: Image.asset(AssetRes.connections)),
                SizedBox(
                  width: Get.width * 0.06,
                ),
                Text(
                  Strings.connections,
                  style: textStyleFont15White,
                ),
                SizedBox(
                  width: Get.width * 0.5,
                ),
                SizedBox(
                    height: 10, width: 6, child: Image.asset(AssetRes.next))
              ],
            ),
          ),
        ),
        Divider(
          thickness: 1,
          color: ColorRes.color_4F359B.withOpacity(0.4),
        ),
        //Support
        InkWell(
          onTap: () {
            homeController.viewProfile.data!.userType == "free"
                ? premiumPopUpBox(context: context)
                : controller.onTapSupport();
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 5),
            child: Row(
              children: [
                SizedBox(
                  width: Get.width * 0.08,
                ),
                SizedBox(
                    height: 18.98,
                    width: 20.83,
                    child: Image.asset(AssetRes.support)),
                SizedBox(
                  width: Get.width * 0.06,
                ),
                Text(
                  Strings.support,
                  style: textStyleFont15White,
                ),
                SizedBox(
                  width: Get.width * 0.59,
                ),
                SizedBox(
                    height: 10, width: 6, child: Image.asset(AssetRes.next))
              ],
            ),
          ),
        ),
        Divider(
          thickness: 1,
          color: ColorRes.color_4F359B.withOpacity(0.4),
        ),
        //payment
        InkWell(
          onTap: () {
            Get.to(() => PaymentScreen());
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 5),
            child: Row(
              children: [
                SizedBox(
                  width: Get.width * 0.08,
                ),
                SizedBox(
                    height: 18.98,
                    width: 20.83,
                    child: Image.asset(AssetRes.payment)),
                SizedBox(
                  width: Get.width * 0.06,
                ),
                Text(
                  Strings.payment,
                  style: textStyleFont15White,
                ),
                SizedBox(
                  width: Get.width * 0.57,
                ),
                SizedBox(
                  height: 10,
                  width: 6,
                  child: Image.asset(AssetRes.next),
                ),
              ],
            ),
          ),
        ),
        Divider(
          thickness: 1,
          color: ColorRes.color_4F359B.withOpacity(0.4),
        ),
        //Privacy
        InkWell(
          onTap: controller.onPrivacyScreenTap,
          child: Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 5),
            child: Row(
              children: [
                SizedBox(
                  width: Get.width * 0.08,
                ),
                SizedBox(
                    height: 18.98,
                    width: 20.83,
                    child: Image.asset(
                      AssetRes.profileSettinges,
                      color: Colors.yellow,
                    )),
                SizedBox(
                  width: Get.width * 0.06,
                ),
                Text(
                  Strings.privacy,
                  style: textStyleFont15White,
                ),
                SizedBox(
                  width: Get.width * 0.6,
                ),
                SizedBox(
                    height: 10, width: 6, child: Image.asset(AssetRes.next))
              ],
            ),
          ),
        ),
        Divider(
          thickness: 1,
          color: ColorRes.color_4F359B.withOpacity(0.4),
        ),
        //notification
        Row(
          children: [
            SizedBox(
              width: Get.width * 0.08,
            ),
            SizedBox(
                height: 18.98,
                width: 20.83,
                child: Image.asset(
                  AssetRes.notify,
                  color: Colors.yellow,
                )),
            SizedBox(
              width: Get.width * 0.06,
            ),
            Text(
              Strings.notifications,
              style: textStyleFont15White,
            ),
            SizedBox(
              width: Get.width * 0.395,
            ),

            //notification
            GetBuilder<SettingsController>(
              id: "switch",
              builder: (controller) {
                return Transform.scale(
                  scale: 0.7,
                  child: CupertinoSwitch(
                    value: controller.isSwitched!,
                    onChanged: (value) {
                      controller.isSwitched = value;
                      controller.notificationOnOffApi();
                      controller.update(["switch"]);
                    },
                    activeColor: Colors.yellow,
                    trackColor: Colors.white,
                  ),
                );
              },
            ),
          ],
        ),

        //Subscription
        /* InkWell(
            onTap: () {
              Get.to(() => SubscriptionScreen());
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 5),
              child: Row(
                children: [
                  SizedBox(
                    width: Get.width * 0.08,
                  ),
                  SizedBox(
                      height: 18.98,
                      width: 20.83,
                      child: Image.asset(
                        AssetRes.profileSettinges,
                        color: Colors.yellow,
                      )),
                  SizedBox(
                    width: Get.width * 0.06,
                  ),
                  Text(
                    Strings.subscription,
                    style: textStyleFont15White,
                  ),
                  SizedBox(
                    width: Get.width * 0.5,
                  ),
                  SizedBox(
                      height: 10, width: 6, child: Image.asset(AssetRes.next))
                ],
              ),
            ),
          ),
          SizedBox(
            height: Get.height * 0.03,
          ),*/
        /*Text(
            Strings.yourReferralCode,
            style: textStyleFont15White,
          ),
          SizedBox(
            height: Get.height * 0.01,
          ),
          Text(
            controller.refferalCode.toString(),
            style: gilroyBoldTextStyle(fontSize: 32),
          ),
          SizedBox(
            height: Get.height * 0.02,
          ),
          InkWell(
            onTap: () {
              controller.share();
            },
            child: Container(
              height: 44.43,
              width: Get.width * 0.312,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13.67),
                  color: ColorRes.color_6306B2),
              child: Center(
                  child: Text(
                Strings.inviteNow,
                style: gilroyBoldTextStyle(fontSize: 11.9619),
              )),
            ),
          ),*/
        SizedBox(
          height: Get.height * 0.045,
        ),
        GestureDetector(
          onTap: () async {
            controller.logOutDetails();
          },
          child: Container(
            height: 60,
            width: Get.width * 0.8,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13.67),
                color: ColorRes.color_FFEC5C),
            child: Center(
                child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    height: 15, width: 15, child: Image.asset(AssetRes.logout)),
                const SizedBox(
                  width: 11,
                ),
                Text(Strings.logout,
                    style: gilroyMediumTextStyle(
                        color: Colors.black, fontSize: 16)),
              ],
            )),
          ),
        ),
      ],
    );
  }
}
