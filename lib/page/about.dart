import 'package:chuck_norris_app/const/app_res.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(AppRes.aboutText);
  }
}
