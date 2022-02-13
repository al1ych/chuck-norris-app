import 'package:flutter/material.dart';

class ChuckButton extends StatelessWidget {
  String text;
  var onPressed;

  ChuckButton(
    this.text, {
    Key? key,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        text,

      ),
    );
  }
}
