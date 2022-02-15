import 'dart:ui';

import 'package:bordered_text/bordered_text.dart';
import 'package:chuck_norris_app/page/content.dart';
import 'package:flutter/material.dart';

abstract class Utils {
  static void showJoke(context, String j) {
    final content = BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 25,
        sigmaY: 25,
      ),
      // child: SearchResultPage([j]),
      child: BorderedText(
        strokeWidth: 5,
        strokeColor: const Color(0xff000000),
        child: Text(
          j,
          style: const TextStyle(
            fontFamily: "Courier",
            fontSize: 24,
          ),
        ),
      ),
    );
    final int duration = (j.split(' ').length * .4).round();
    print("The text is there for $duration seconds");
    var snackBar = SnackBar(
      // margin: EdgeInsets.zero,
      elevation: 0,
      backgroundColor: Colors.transparent,
      padding: const EdgeInsets.all(16.0).copyWith(bottom: 24),
      content: content,
      duration: Duration(seconds: duration),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
