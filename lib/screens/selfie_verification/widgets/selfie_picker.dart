import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/loaders.dart';
import 'package:rainbow/utils/color_res.dart';

class SelfiePicker extends StatefulWidget {
  final Function(File file) onCapture;

  const SelfiePicker({Key? key, required this.onCapture}) : super(key: key);

  @override
  State<SelfiePicker> createState() => _SelfiePickerState();
}

class _SelfiePickerState extends State<SelfiePicker> {
  CameraController? controller;

  @override
  void initState() {
    super.initState();
    setCamera();
  }

  Future<void> setCamera() async {
    final cameras = await availableCameras();
    final frontCam = cameras[1];
    controller = CameraController(frontCam, ResolutionPreset.max);
    controller!.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':

            break;
          default:

            break;
        }
      }
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: controller != null && controller!.value.isInitialized
              ? Center(
                  child: CameraPreview(
                    controller!,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () async {
                            XFile xFile = await controller!.takePicture();
                            widget.onCapture(File(xFile.path));
                            Get.back();
                          },
                          child: Container(
                            height: 75,
                            width: 75,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: ColorRes.white.withOpacity(0.5),
                            ),
                            child: Center(
                              child: Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: ColorRes.white.withOpacity(0.7),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: Get.height * 0.03),
                      ],
                    ),
                  ),
                )
              : const FullScreenLoader()),
    );
  }
}
