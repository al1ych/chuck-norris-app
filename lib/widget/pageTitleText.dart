import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';

class PageTitleText extends StatelessWidget {
  final String text;

  const PageTitleText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BorderedText(
      strokeColor: Color(0xff151515),
      child: Text(
        text,
        style: const TextStyle(
          fontFamily: "Courier",
          fontSize: 22,
          fontWeight: FontWeight.w900,
          letterSpacing: 0.3,
          color: Color(0xffFFE1C6),
        ),
      ),
    );
  }
}
