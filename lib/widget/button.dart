import 'package:bordered_text/bordered_text.dart';
import 'package:chuck_norris_app/const/app_res.dart';
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
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 5,
          primary: Theme.of(context).primaryColor,
          shape: const StadiumBorder(
            side: BorderSide(
              width: 3,
              color: Colors.black,
            ),
          ),
        ),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BorderedText(
            strokeWidth: 3,
            strokeColor: Color(0xff401A07),
            child: Text(
              text,
              style: const TextStyle(
                fontFamily: "Courier",
                fontSize: 18,
                fontWeight: FontWeight.w900,
                letterSpacing: 0.3,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
