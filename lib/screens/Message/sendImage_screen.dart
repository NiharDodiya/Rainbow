import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/utils/color_res.dart';

import 'message_controller.dart';

class SendImageScreen extends StatelessWidget {
   SendImageScreen({Key? key}) : super(key: key);

   MessageController messageController = Get.put(MessageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<MessageController>(
          builder: (messageController){
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 5),
              child: IconButton(onPressed: (){
                messageController.image = null;
              }, icon: Icon(Icons.cancel, size: 40,),),
            ),
            SizedBox(height: 20),
            Container(
              height: Get.height/1.4,
              width: Get.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: FileImage(messageController.image!),
                    fit: BoxFit.cover,
                  )
              ),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.only(right: 20),
                child: FloatingActionButton(
                  onPressed: (){},
                  child: Icon(Icons.send, color: Colors.white,),
                  backgroundColor: ColorRes.color_4F359B,
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
