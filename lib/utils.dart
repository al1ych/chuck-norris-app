import 'dart:ui';

import 'package:bordered_text/bordered_text.dart';
import 'package:chuck_norris_app/page/search_result.dart';
import 'package:flutter/material.dart';

abstract class Utils {
  static void showJoke(context, String j) {
    final content = BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 20,
        sigmaY: 20,
      ),
      child: Text(
        j,
        style: const TextStyle(
          fontFamily: "Courier",
          fontSize: 13,
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
    final int duration = (j.split(' ').length * .4).round();
    print("The text is there for $duration seconds");
    var snackBar = SnackBar(
      // margin: EdgeInsets.zero,
      elevation: 0,
      backgroundColor: const Color.fromARGB(60, 196, 196, 196),
      padding: const EdgeInsets.symmetric(horizontal: 48.0, vertical: 20.0),
      content: content,
      duration: Duration(seconds: duration),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
