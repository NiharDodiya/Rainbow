library hashtagtext;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

///A Hash tag Text Widget .
///It will detect hash tags from string and will show in different color
///It is also customizable with normal text and hash tag text with TextStyle.

class HashTagText extends StatelessWidget {
  final String text;

  final TextStyle? normalTextStyle;
  final TextStyle? hashTagStyle;
  final Function(String) onHashTagClick;

  const HashTagText(
      {Key? key,
      required this.text,
      this.normalTextStyle,
      this.hashTagStyle,
      required this.onHashTagClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!HasTagUtils.hasTag(text)) {
      return Text(
        text,
        style: normalTextStyle ?? const TextStyle(color: Colors.black),
      );
    }

    return FutureBuilder(
      future: HasTagUtils.splitHashTag(text),
      builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
        if (!snapshot.hasData) {
          return Text(
            text,
            style: normalTextStyle ?? const TextStyle(color: Colors.black),
          );
        }

        final captions = snapshot.data;

        return RichText(
          text: TextSpan(
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  if (HasTagUtils.hasTag(captions![0])) {
                    onHashTagClick(captions[0]);
                  }
                },
              text: captions?[0],
              style: HasTagUtils.hasTag(captions![0])
                  ? hashTagStyle ??
                      const TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold)
                  : normalTextStyle ?? const TextStyle(color: Colors.black),
              children: captions
                  .sublist(1, captions.length - 1)
                  .map((e) => TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            if (HasTagUtils.hasTag(e)) {
                              onHashTagClick(e);
                            }
                          },
                        text: e,
                        style: HasTagUtils.hasTag(e)
                            ? hashTagStyle ??
                                const TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold)
                            : normalTextStyle ??
                                const TextStyle(color: Colors.black),
                      ))
                  .toList()),
        );
      },
    );
  }
}

class HasTagUtils {
  static Future<List<String>> splitHashTag(String captions) async {
    String s = "$captions ";

    List<String> list = [];

    while (s.contains("#")) {
      if (s.contains("#")) {
        String preHash = s.substring(0, s.indexOf("#"));
        s = s.substring(s.indexOf("#"));
        String hashTag = s;

        if (preHash.isNotEmpty) {
          list.add(preHash);
        }

        if (s.contains(' ')) {
          hashTag = s.substring(0, s.indexOf(' '));
          s = s.substring(s.indexOf(' '));

          hashTag.trim();
          if (hashTag.isNotEmpty) {
            list.add(hashTag);
          }
        }
      }
    }

    s.trim();
    if (s.isNotEmpty) {
      list.add(s);
    }

    debugPrint("$list");

    return list;
  }

  static bool hasTag(String s) {
    return s.contains("#");
  }
}
