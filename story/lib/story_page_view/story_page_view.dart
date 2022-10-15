import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:provider/provider.dart';
import 'package:story/story_page_view/story_limit_controller.dart';
import 'package:story/story_page_view/story_stack_controller.dart';

import 'components/gestures.dart';
import 'components/indicators.dart';

typedef _StoryItemBuilder = Widget Function(
  BuildContext context,
  int pageIndex,
  int storyIndex,
);

typedef _StoryConfigFunction = int Function(int pageIndex);

enum IndicatorAnimationCommand { pause, resume }

/// PageView to implement story like UI
///
/// [itemBuilder], [storyLength], [pageLength] are required.
class StoryPageView extends StatefulWidget {
  const StoryPageView({
    Key? key,
    required this.itemBuilder,
    required this.storyLength,
    required this.pageLength,
    this.gestureItemBuilder,
    this.initialStoryIndex,
    this.initialPage = 0,
    this.onPageLimitReached,
    this.indicatorDuration = const Duration(seconds: 5),
    this.indicatorPadding =
        const EdgeInsets.symmetric(vertical: 32, horizontal: 8),
    this.backgroundColor = Colors.black,
    this.indicatorAnimationController,
    this.onPageChanged,
    this.color,
    this.bgColor,
    this.onStoryChange,
    this.loadImage,
  }) : super(key: key);

  /// Function to build story content
  final _StoryItemBuilder itemBuilder;

  /// Function to build story content
  /// Components with gesture actions are expected
  /// Placed above the story gestures.
  final _StoryItemBuilder? gestureItemBuilder;

  /// decides length of story for each page
  final _StoryConfigFunction storyLength;

  /// length of [StoryPageView]
  final int pageLength;

  /// Initial index of story for each page
  final _StoryConfigFunction? initialStoryIndex;

  /// padding of [Indicators]
  final EdgeInsetsGeometry indicatorPadding;

  /// duration of [Indicators]
  final Duration indicatorDuration;

  /// Called when the very last story is finished.
  ///
  /// Functions like "Navigator.pop(context)" is expected.
  final VoidCallback? onPageLimitReached;

  /// Called whenever the page in the center of the viewport changes.
  final void Function(int)? onPageChanged;

  /// initial index for [StoryPageView]
  final int initialPage;

  /// Color under the Stories which is visible when the cube transition is in progress
  final Color backgroundColor;
  final Color? bgColor;
  final Color? color;
  final Function(int)? onStoryChange;
  final Future<void> Function()? loadImage;

  /// A stream with [IndicatorAnimationCommand] to force pause or continue inticator animation
  /// Useful when you need to show any popup over the story
  final ValueNotifier<IndicatorAnimationCommand>? indicatorAnimationController;

  @override
  _StoryPageViewState createState() => _StoryPageViewState();
}

class _StoryPageViewState extends State<StoryPageView> {
  PageController? pageController;

  var currentPageValue;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: widget.initialPage);

    currentPageValue = widget.initialPage.toDouble();

    pageController!.addListener(() {
      setState(() {
        currentPageValue = pageController!.page;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: widget.backgroundColor,
      child: PageView.builder(
        controller: pageController,
        itemCount: widget.pageLength,
        onPageChanged: widget.onPageChanged,
        itemBuilder: (context, index) {
          final isLeaving = (index - currentPageValue) <= 0;
          final t = (index - currentPageValue);
          final rotationY = lerpDouble(0, 30, t as double)!;
          const maxOpacity = 0.8;
          final num opacity =
              lerpDouble(0, maxOpacity, t.abs())!.clamp(0.0, maxOpacity);
          final isPaging = opacity != maxOpacity;
          final transform = Matrix4.identity();
          transform.setEntry(3, 2, 0.003);
          transform.rotateY(-rotationY * (pi / 180.0));
          return Transform(
            alignment: isLeaving ? Alignment.centerRight : Alignment.centerLeft,
            transform: transform,
            child: Stack(
              children: [
                _StoryPageFrame.wrapped(
                  pageLength: widget.pageLength,
                  storyLength: widget.storyLength(index),
                  initialStoryIndex: widget.initialStoryIndex?.call(index) ?? 0,
                  pageIndex: index,
                  animateToPage: (index) {
                    pageController!.animateToPage(index,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.ease);
                  },
                  isCurrentPage: currentPageValue == index,
                  isPaging: isPaging,
                  onPageLimitReached: widget.onPageLimitReached,
                  itemBuilder: widget.itemBuilder,
                  gestureItemBuilder: widget.gestureItemBuilder,
                  indicatorDuration: widget.indicatorDuration,
                  indicatorPadding: widget.indicatorPadding,
                  indicatorAnimationController:
                      widget.indicatorAnimationController,
                  color: widget.color,
                  bgColor: widget.bgColor,
                  onStoryChange: widget.onStoryChange,
                  loadImage: widget.loadImage,
                ),
                if (isPaging && !isLeaving)
                  Positioned.fill(
                    child: Opacity(
                      opacity: opacity as double,
                      child: const ColoredBox(
                        color: Colors.black87,
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _StoryPageFrame extends StatefulWidget {
  const _StoryPageFrame._({
    Key? key,
    required this.storyLength,
    required this.initialStoryIndex,
    required this.pageIndex,
    required this.isCurrentPage,
    required this.isPaging,
    required this.itemBuilder,
    required this.gestureItemBuilder,
    required this.indicatorDuration,
    required this.indicatorPadding,
    required this.indicatorAnimationController,
    required this.color,
    required this.bgColor,
    this.onStoryChange,
    this.loadImage,
  }) : super(key: key);
  final int storyLength;
  final int initialStoryIndex;
  final int pageIndex;
  final bool isCurrentPage;
  final bool isPaging;
  final _StoryItemBuilder itemBuilder;
  final _StoryItemBuilder? gestureItemBuilder;
  final Duration indicatorDuration;
  final EdgeInsetsGeometry indicatorPadding;
  final ValueNotifier<IndicatorAnimationCommand>? indicatorAnimationController;
  final Color? bgColor;
  final Color? color;
  final Function(int)? onStoryChange;
  final Future<void> Function()? loadImage;

  static Widget wrapped({
    required int pageIndex,
    required int pageLength,
    required ValueChanged<int> animateToPage,
    required int storyLength,
    required int initialStoryIndex,
    required bool isCurrentPage,
    required bool isPaging,
    required VoidCallback? onPageLimitReached,
    required _StoryItemBuilder itemBuilder,
    _StoryItemBuilder? gestureItemBuilder,
    required Duration indicatorDuration,
    required EdgeInsetsGeometry indicatorPadding,
    required ValueNotifier<IndicatorAnimationCommand>?
        indicatorAnimationController,
    Color? color,
    Color? bgColor,
    Function(int)? onStoryChange,
    Future<void> Function()? loadImage,
  }) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => StoryLimitController(),
        ),
        ChangeNotifierProvider(
          create: (context) => StoryStackController(
            storyLength: storyLength,
            onPageBack: () {
              if (pageIndex != 0) {
                animateToPage(pageIndex - 1);
              }
            },
            onPageForward: () {
              if (pageIndex == pageLength - 1) {
                context
                    .read<StoryLimitController>()
                    .onPageLimitReached(onPageLimitReached);
              } else {
                animateToPage(pageIndex + 1);
              }
            },
            initialStoryIndex: initialStoryIndex,
          ),
        ),
      ],
      child: _StoryPageFrame._(
        storyLength: storyLength,
        initialStoryIndex: initialStoryIndex,
        pageIndex: pageIndex,
        isCurrentPage: isCurrentPage,
        isPaging: isPaging,
        itemBuilder: itemBuilder,
        gestureItemBuilder: gestureItemBuilder,
        indicatorDuration: indicatorDuration,
        indicatorPadding: indicatorPadding,
        indicatorAnimationController: indicatorAnimationController,
        bgColor: bgColor,
        color: color,
        onStoryChange: onStoryChange,
        loadImage: loadImage,
      ),
    );
  }

  @override
  _StoryPageFrameState createState() => _StoryPageFrameState();
}

class _StoryPageFrameState extends State<_StoryPageFrame>
    with
        AutomaticKeepAliveClientMixin<_StoryPageFrame>,
        SingleTickerProviderStateMixin {
  late AnimationController animationController;

  late VoidCallback listener;
  bool isImageLoading = false;

  @override
  void initState() {
    super.initState();
    isImageLoading = false;
    listener = () {
      if (widget.isCurrentPage) {
        switch (widget.indicatorAnimationController?.value) {
          case IndicatorAnimationCommand.pause:
            animationController.stop();
            break;
          case IndicatorAnimationCommand.resume:
          default:
            animationController.forward();
            break;
        }
      }
    };
    animationController = AnimationController(
      vsync: this,
      duration: widget.indicatorDuration,
    )..addStatusListener(
        (status) {
          if (status == AnimationStatus.completed) {
            context.read<StoryStackController>().increment(
                  restartAnimation: () => animationController.forward(from: 0),
                  onStoryChange: widget.onStoryChange,
                );
            downloadImage();
          }
        },
      );
    widget.indicatorAnimationController?.addListener(listener);
    downloadImage();
    KeyboardVisibilityController().onChange.listen((bool visible) {
      if (visible) {
          animationController.stop();
      } else {
        if(isImageLoading == false){
          animationController.forward();
        }
      }
    });
  }

  Future<void> downloadImage() async {
    await Future.delayed(const Duration(milliseconds: 800));
    isImageLoading = true;
    animationController.stop();
    if(widget.loadImage != null){
      await widget.loadImage!();
    }
    isImageLoading = false;
    animationController.forward();
  }

  @override
  void dispose() {
    widget.indicatorAnimationController?.removeListener(listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Stack(
      fit: StackFit.loose,
      alignment: Alignment.topLeft,
      children: [
        Positioned.fill(
          child: ColoredBox(
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
        ),
        Positioned.fill(
          child: widget.itemBuilder(
            context,
            widget.pageIndex,
            context.watch<StoryStackController>().value,
          ),
        ),
        Container(
          height: 50,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 10,
                blurRadius: 20,
              ),
            ],
          ),
        ),
        Gestures(
          animationController: animationController,
          onStoryChange: widget.onStoryChange,
          loadImage: widget.loadImage,
        ),
        Positioned.fill(
          child: widget.gestureItemBuilder?.call(
                context,
                widget.pageIndex,
                context.watch<StoryStackController>().value,
              ) ??
              const SizedBox.shrink(),
        ),
        Indicators(
          storyLength: widget.storyLength,
          animationController: animationController,
          isCurrentPage: widget.isCurrentPage,
          isPaging: widget.isPaging,
          padding: widget.indicatorPadding,
          color: widget.color,
          bgColor: widget.bgColor,
        ),
        /*Positioned(
          right: 0,
          top: 100,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FloatingActionButton(
                onPressed: () {
                  animationController.stop();
                },
                child: const Icon(Icons.pause),
              ),
              FloatingActionButton(
                onPressed: () {
                  animationController.forward();
                },
                child: const Icon(Icons.play_arrow),
              ),
            ],
          ),
        )*/
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
