import 'dart:io';
import 'dart:math';

import 'package:custom_image_crop/custom_image_crop.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

class CircleImageCropper extends StatelessWidget {
  final Function(File file) onCropped;
  const CircleImageCropper({Key? key, required this.onCropped}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CustomImageCropController controller = CustomImageCropController();
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: CustomImageCrop(
              cropController: controller,
              image: const NetworkImage(
                  'https://upload.wikimedia.org/wikipedia/en/7/7d/Lenna_%28test_image%29.png'),
              shape: CustomCropShape.Circle,
            ),
          ),
          Row(
            children: [
              IconButton(
                  icon: const Icon(Icons.refresh), onPressed: controller.reset),
              IconButton(
                  icon: const Icon(Icons.zoom_in),
                  onPressed: () =>
                      controller.addTransition(CropImageData(scale: 1.33))),
              IconButton(
                  icon: const Icon(Icons.zoom_out),
                  onPressed: () =>
                      controller.addTransition(CropImageData(scale: 0.75))),
              IconButton(
                  icon: const Icon(Icons.rotate_left),
                  onPressed: () =>
                      controller.addTransition(CropImageData(angle: -pi / 4))),
              IconButton(
                  icon: const Icon(Icons.rotate_right),
                  onPressed: () =>
                      controller.addTransition(CropImageData(angle: pi / 4))),
              IconButton(
                icon: const Icon(Icons.crop),
                onPressed: () async {
                  final MemoryImage? image = await controller.onCropImage();
                  if (image != null) {
                    final Directory? directory = Platform.isIOS ? await getApplicationDocumentsDirectory() : await getExternalStorageDirectory();
                    File file = File("${directory!.path}/${DateTime.now().millisecondsSinceEpoch}.jpg");

                    await file.writeAsBytes(image.bytes);
                    return onCropped(file);
                  }
                },
              ),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).padding.bottom),
        ],
      ),
    );
  }
}
