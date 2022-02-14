import 'dart:ui';

import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';

abstract class Utils {
  static void showJoke(context, String j) {
    final content = BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 25,
        sigmaY: 25,
      ),
      child: BorderedText(
        strokeWidth: 5,
        strokeColor: Color(0xff000000),
        child: Text(
          j,
          style: const TextStyle(
            fontFamily: "Courier",
            fontSize: 24,
          ),
        ),
      ),
    );
    final int duration = (j.split(' ').length * .35).round();
    print("The text is there for $duration seconds");
    var snackBar = SnackBar(
      content: content,
      duration: Duration(seconds: duration),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    // todo https://pub.dev/packages/rflutter_alert
  }
}