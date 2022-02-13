import 'package:bordered_text/bordered_text.dart';
import 'package:chuck_norris_app/const/app_res.dart';
import 'package:flutter/material.dart';

class AboutButton extends StatelessWidget {
  var onPressed;

  AboutButton({
    Key? key,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double dim = 28;
    return SizedBox.square(
      dimension: dim,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 5,
              primary: Theme.of(context).accentColor,
              shape: const RoundedRectangleBorder(
                side: BorderSide(
                  color: Colors.black,
                  width: 3,
                ),
              ),
            ),
            onPressed: onPressed,
            child: const SizedBox.shrink(),
          ),
          IgnorePointer(
            child: BorderedText(
              strokeWidth: 2,
              strokeColor: Color(0xff401A07),
              child: const Text(
                "i",
                style: TextStyle(
                  color: Color(0xffFFE1C6),
                  fontFamily: "Courier",
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
