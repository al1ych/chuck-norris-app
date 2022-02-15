import 'dart:ui';

import 'package:bordered_text/bordered_text.dart';
import 'package:chuck_norris_app/page/search_result.dart';
import 'package:flutter/material.dart';

abstract class Utils {
  static void showJoke(context, String j) {
    final content = BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 25,
        sigmaY: 25,
      ),
      child: BorderedText(
        strokeWidth: 3,
        strokeColor: const Color(0xff000000),
        child: Text(
          j,
          style: const TextStyle(
            fontFamily: "Courier",
            fontSize: 12,
          ),
        ),
      ),
    );
    final int duration = (j.split(' ').length * .5).round();
    print("The text is there for $duration seconds");
    var snackBar = SnackBar(
      // margin: EdgeInsets.zero,
      elevation: 0,
      backgroundColor: Colors.transparent,
      padding: const EdgeInsets.all(16.0).copyWith(bottom: 20),
      content: content,
      duration: Duration(seconds: duration),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
