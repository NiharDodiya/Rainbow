import 'package:flutter/cupertino.dart';

/// Notify current stack index
class StoryStackController extends ValueNotifier<int> {
  StoryStackController({
    required this.storyLength,
    required this.onPageForward,
    required this.onPageBack,
    initialStoryIndex = 0,
  }) : super(initialStoryIndex);
  final int storyLength;
  final VoidCallback onPageForward;
  final VoidCallback onPageBack;

  int get limitIndex => storyLength - 1;

  //AnimationController? animationController;

  void increment(
      {VoidCallback? restartAnimation, VoidCallback? completeAnimation, Function(int)? onStoryChange}) {
    if (value == limitIndex) {
      completeAnimation?.call();
      onPageForward();
    } else {
      value++;
      restartAnimation?.call();
      if(onStoryChange != null){
        onStoryChange(value);
      }
    }
  }

  void decrement({Function(int)? onStoryChange}) {
    if (value == 0) {
      onPageBack();
    } else {
      value--;
    }
    if(onStoryChange != null){
      onStoryChange(value);
    }
  }
}
