import 'package:chuck_norris_app/const/app_res.dart';
import 'package:chuck_norris_app/widget/aboutButton.dart';
import 'package:chuck_norris_app/widget/button.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  late Dio dio;

  @override
  void initState() {
    super.initState();
    dio = Dio();
  }

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
                    onPressed: () {
                      print("random joke fired");
                    },
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 64,
                  child: ChuckButton(
                    AppRes.categories,
                    onPressed: () {
                      print("categories fired");
                    },
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
}
