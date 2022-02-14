import 'dart:developer';
import 'dart:ui';

import 'package:bordered_text/bordered_text.dart';
import 'package:chuck_norris_app/api/api.dart';
import 'package:chuck_norris_app/const/app_res.dart';
import 'package:chuck_norris_app/page/search.dart';
import 'package:chuck_norris_app/widget/aboutButton.dart';
import 'package:chuck_norris_app/widget/button.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../utils.dart';
import 'about.dart';
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
                  onPressed: _aboutCallback,
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
                    onPressed: _searchCallback,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _aboutCallback() async {
    await showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('About me!'),
          content: const AboutPage(),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _randomJokeCallback() async {
    final String joke = await Api.getRandomJoke();
    Utils.showJoke(context, joke);
  }

  void _categoriesCallback() async {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const CategoriesPage(),
      ),
    );
  }

  void _searchCallback() async {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SearchPage(),
      ),
    );
  }
}
