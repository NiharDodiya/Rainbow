import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../story_stack_controller.dart';

class Gestures extends StatelessWidget {
  const Gestures({
    Key? key,
    required this.animationController,
    this.onStoryChange,
    this.loadImage,
  }) : super(key: key);

  final AnimationController? animationController;
  final Function(int)? onStoryChange;
  final Future<void> Function()? loadImage;

  Future<void> downloadImage() async {
    await Future.delayed(const Duration(milliseconds: 800));

    animationController!.stop();
    if(loadImage != null){
      await loadImage!();
    }
    animationController!.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            color: Colors.transparent,
            child: GestureDetector(
              onTap: () {
                animationController!.forward(from: 0);
                context.read<StoryStackController>().decrement(onStoryChange: onStoryChange);
                downloadImage();
              },
              onLongPress: () {
                animationController!.stop();
              },
              onLongPressUp: () {
                animationController!.forward();
              },

            ),
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.transparent,
            child: GestureDetector(
              onTap: () {
                context.read<StoryStackController>().increment(
                      restartAnimation: () =>
                          animationController!.forward(from: 0),
                      completeAnimation: () => animationController!.value = 1,
                      onStoryChange: onStoryChange,
                    );
                downloadImage();
              },
              onLongPress: () {
                animationController!.stop();
              },
              onLongPressUp: () {
                animationController!.forward();
              },
            ),
          ),
        ),
      ],
    );
  }
}
