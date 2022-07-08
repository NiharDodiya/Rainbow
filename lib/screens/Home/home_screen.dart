import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/screens/Home/Story/story_screen.dart';
import 'package:rainbow/screens/Home/home_controller.dart';
import 'package:rainbow/screens/Home/settings/connections/connections_screen.dart';
import 'package:rainbow/screens/Home/settings/settings_screen.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/color_res.dart';
import 'package:rainbow/utils/strings.dart';
import 'package:story_view/story_view.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Row(
            children: [
              SizedBox(
                width: Get.width * 0.02,
              ),
              const Image(
                image: AssetImage(AssetRes.locate),
                height: 19.25,
                width: 19.25,
              ),
              SizedBox(
                width: Get.width * 0.02,
              ),
              Text(
                "Bexley, London",
                style: gilroyBoldTextStyle(color: Colors.black, fontSize: 16),
              ),
              SizedBox(
                width: Get.width * 0.37,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => SettingsScreen());
                },
                child: const Image(
                  image: AssetImage(
                    AssetRes.settings,
                  ),
                  height: 19.25,
                  width: 19.25,
                ),
              ),
              SizedBox(
                width: Get.width * 0.04,
              ),
              InkWell(
                onTap: () {},
                child: const Image(
                  image: AssetImage(AssetRes.notify),
                  height: 20,
                  width: 20,
                ),
              ),
              SizedBox(
                width: Get.width * 0.05,
              ),
            ],
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [discover(), seeAll(), latestFeed()],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Image.asset(
          AssetRes.add,
          height: 24,
          width: 24,
        ),
        onPressed: () {
          Get.to(() => StoryScreen());
        },
      ),
    );
  }

  Widget discover() {
    return Container(
      height: Get.width * 0.52,
      // height: 195,
      width: Get.width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            ColorRes.color_6753A3,
            ColorRes.color_B9A2FD,
            ColorRes.color_6753A3,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: Get.height * 0.02,
          ),
          Padding(
            padding: EdgeInsets.only(left: Get.width * 0.05),
            child: Text(
              Strings.discover,
              style: gilroyBoldTextStyle(fontSize: 20),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(
                  width: Get.width * 0.03,
                ),
                SizedBox(
                  height: 129,
                  child: Column(
                    children: [
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      InkWell(
                        onTap: controller.myStoryOnTap,
                        child: Stack(
                          children: [
                            Container(
                              height: 56,
                              width: 78,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image:
                                          AssetImage(AssetRes.selfiePicture))),
                            ),
                            Positioned(
                                top: Get.height * 0.04,
                                left: Get.width * 0.141,
                                child: const Image(
                                  image: AssetImage(AssetRes.plusIcons),
                                  height: 24,
                                  width: 24,
                                )),
                            Positioned(
                              top: Get.height * 0.04,
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: ColorRes.color_B9A2FD
                                          .withOpacity(0.3),
                                      spreadRadius: 1,
                                      blurRadius: 10,
                                      offset: const Offset(4, 5),
                                    ),
                                  ],
                                  gradient: LinearGradient(
                                    colors: [
                                      ColorRes.color_B9A2FD.withOpacity(0.1),
                                      ColorRes.color_B9A2FD.withOpacity(0.1),
                                      ColorRes.color_B9A2FD.withOpacity(0.1),
                                      ColorRes.color_B9A2FD.withOpacity(0.1),
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        Strings.myStory,
                        style: textStyleFont14WhiteBold,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: Get.width * 0.01,
                ),
                SizedBox(
                  height: 129,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 25,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                SizedBox(
                                  height: Get.height * 0.02,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    // Get.to(()=> StoryScreen());
                                    Get.to(() => const MoreStories());
                                  },
                                  child: Container(
                                    height: 56,
                                    width: 56,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image:
                                                AssetImage(AssetRes.homePro))),
                                  ),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  "Scott",
                                  style: gilroyMediumTextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget seeAll() {
    return SizedBox(
      height: 169,
      width: Get.width,
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Align(
              alignment: Alignment.bottomRight,
              child: InkWell(
                onTap: () {
                  Get.to(()=>ConnectionsScreen());
                },
              child: Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: Text(
                  Strings.seeAll,
                  style: gilroyBoldTextStyle(fontSize: 12,color:  ColorRes.color_9597A1),
                ),
              ),),),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 139,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: 2,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, bottom: 14),
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(AssetRes.selfiePicture),
                          ),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Amber J Santiago",
                          style: montserratRegularTextStyle(
                              color: Colors.black, fontSize: 16),
                        ),
                        Text(
                          "Surrogate MoM",
                          style: montserratRegularTextStyle(
                              color: Colors.black, fontSize: 12),
                        ),
                        SizedBox(
                          height: Get.height * 0.03,
                        )
                      ],
                    ),
                    SizedBox(
                      width: Get.width * 0.11,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 20.0),
                      child: SizedBox(
                        height: 40,
                        width: 40,
                        child: Image(
                          image: AssetImage(AssetRes.profilep),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: Get.width * 0.04,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 20.0),
                      child: SizedBox(
                          height: 40,
                          width: 40,
                          child: Image(image: AssetImage(AssetRes.delete))),
                    ),
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget latestFeed() {
    return Container(
      width: Get.width,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              Strings.latestFeed,
              style: gilroyBoldTextStyle(fontSize: 20),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 22.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        height: 253,
                        width: Get.width * 0.92266,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.white)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15.0, top: 20),
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: AssetImage(
                                                AssetRes.selfiePicture))),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 20.0, left: 12),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Sally Wilson",
                                        style: gilroyBoldTextStyle(fontSize: 16),
                                      ),
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        "30 minutes ago",
                                        style: textStyleFont12White400,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: Get.height * 0.02,
                            ),
                            Center(
                              child: SizedBox(
                                  width: Get.width * 0.85333,
                                  height: 96,
                                  child: Text(
                                    Strings.latestFeedDes,
                                    style: textStyleFont16WhitLight,
                                  )),
                            ),
                            SizedBox(
                              height: Get.height * 0.025,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: SizedBox(
                                height: 32,
                                width: 134,
                                child: Stack(
                                  children: [
                                    Container(
                                      height: 32,
                                      width: 32,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.white, width: 2),
                                          shape: BoxShape.circle,
                                          image: const DecorationImage(
                                              image: AssetImage(AssetRes.lt2))),
                                    ),
                                    Positioned(
                                      left: 24,
                                      child: Container(
                                        height: 32,
                                        width: 32,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.white, width: 2),
                                            shape: BoxShape.circle,
                                            image: const DecorationImage(
                                                image:
                                                    AssetImage(AssetRes.lt1))),
                                      ),
                                    ),
                                    Positioned(
                                      left: 48,
                                      child: Container(
                                        height: 32,
                                        width: 32,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.white, width: 2),
                                            shape: BoxShape.circle,
                                            image: const DecorationImage(
                                                image:
                                                    AssetImage(AssetRes.lt3))),
                                      ),
                                    ),
                                    Positioned(
                                        left: Get.width * 0.24,
                                        top: Get.height * 0.01,
                                        child: Text(
                                          "+8 likes",
                                          style: textStyleFont14White,
                                        ))
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Row(
                                children: [
                                  const SizedBox(
                                      height: 16,
                                      width: 16,
                                      child: Image(
                                          image: AssetImage(AssetRes.eye))),
                                  Text(
                                    "23",
                                    style: gilroyMediumTextStyle(fontSize: 10),
                                  ),
                                  const Spacer(),
                                  const SizedBox(
                                      height: 16,
                                      width: 16,
                                      child: Image(
                                          image: AssetImage(AssetRes.vector))),
                                  const SizedBox(
                                    width: 2,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 2.0),
                                    child: Text(
                                      "7",
                                      style:
                                          gilroyMediumTextStyle(fontSize: 10),
                                    ),
                                  ),
                                  SizedBox(
                                    width: Get.width * 0.05,
                                  ),
                                  const SizedBox(
                                      height: 16,
                                      width: 16,
                                      child: Image(
                                        image: AssetImage(AssetRes.comment),
                                        color: Colors.white,
                                      )),
                                  const SizedBox(
                                    width: 2,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 2.0),
                                    child: Text(
                                      "5",
                                      style:
                                          gilroyMediumTextStyle(fontSize: 10),
                                    ),
                                  ),
                                  SizedBox(
                                    width: Get.width * 0.05,
                                  ),
                                  const SizedBox(
                                      height: 16,
                                      width: 16,
                                      child: Image(
                                          image: AssetImage(AssetRes.thumbs))),
                                  const SizedBox(
                                    width: 2,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5.0),
                                    child: Text(
                                      "8",
                                      style:
                                          gilroyMediumTextStyle(fontSize: 10),
                                    ),
                                  ),
                                  SizedBox(
                                    width: Get.width * 0.05,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class MoreStories extends StatefulWidget {
  const MoreStories({Key? key}) : super(key: key);

  @override
  _MoreStoriesState createState() => _MoreStoriesState();
}

class _MoreStoriesState extends State<MoreStories> {
  final storyController = StoryController();

  @override
  void dispose() {
    storyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: Get.height * 1,
          child: StoryView(
            storyItems: [
             /* StoryItem.text(
                title:
                    "I guess you'd love to see more of our food. That's great.",
                backgroundColor: Colors.blue,
              ),*/
              StoryItem.text(
                title: "Tap to continue.",
                backgroundColor: Colors.red,
                textStyle: const TextStyle(
                  fontFamily: 'Dancing',
                  fontSize: 40,
                ),
              ),
              /*   StoryItem.pageImage(
                url: "https://media.giphy.com/media/5GoVLqeAOo6PK/giphy.gif",
                caption: "Still sampling",
                controller: storyController,
              ),*/
              /*   StoryItem.pageImage(
                  url: "https://media.giphy.com/media/5GoVLqeAOo6PK/giphy.gif",
                  caption: "Working with gifs",
                  controller: storyController),*/
              /*  StoryItem.pageImage(
                url: "https://media.giphy.com/media/XcA8krYsrEAYXKf4UQ/giphy.gif",
                caption: "Hello, from the other side",
                controller: storyController,
              ),
              StoryItem.pageImage(
                url: "https://media.giphy.com/media/XcA8krYsrEAYXKf4UQ/giphy.gif",
                caption: "Hello, from the other side2",
                controller: storyController,
              ),*/
            ],
            onStoryShow: (s) {},
            onComplete: () {},
            progressPosition: ProgressPosition.top,
            repeat: false,
            controller: storyController,
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              SizedBox(
                  height: Get.height * 0.07,
                  width: Get.width * 0.7,
                  child: TextFormField(
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(left: 15),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        hintStyle: const TextStyle(fontSize: 14),
                        hintText: "Send message"),
                  )),
              SizedBox(
                width: Get.width * 0.04,
              ),
              const SizedBox(
                  height: 20,
                  width: 20,
                  child: Image(
                    image: AssetImage(AssetRes.heart),
                    color: Colors.white,
                  )),
              SizedBox(
                width: Get.width * 0.05,
              ),
              const SizedBox(
                  height: 20,
                  width: 20,
                  child: Image(image: AssetImage(AssetRes.sendInsta))),
            ],
          ),
        ),
      ),
    );
  }
}
