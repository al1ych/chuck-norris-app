import 'dart:developer';
import 'dart:ui';

import 'package:bordered_text/bordered_text.dart';
import 'package:chuck_norris_app/api/api.dart';
import 'package:chuck_norris_app/const/app_res.dart';
import 'package:chuck_norris_app/widget/aboutButton.dart';
import 'package:chuck_norris_app/widget/button.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'categories.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    // var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                AboutButton(
                  onPressed: () {
                    print("about btn");
                  },
                ),
                Image.network(AppRes.logoUrl),
                const SizedBox(height: 30),
                SizedBox(
                  height: 64,
                  child: ChuckButton(
                    AppRes.randomJoke,
                    onPressed: _randomJokeCallback,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 64,
                  child: ChuckButton(
                    AppRes.categories,
                    onPressed: _categoriesCallback,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 64,
                  child: ChuckButton(
                    AppRes.search,
                    onPressed: () {
                      print("search fired");
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _randomJokeCallback() async {
    final String joke = await Api.getRandomJoke();
    _showJoke(joke);
  }

  void _showJoke(String j) {
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

  void _categoriesCallback() async {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const CategoriesPage(),
      ),
    );
  }
}
