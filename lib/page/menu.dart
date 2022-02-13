import 'package:chuck_norris_app/const/AppRes.dart';
import 'package:chuck_norris_app/widget/button.dart';
import 'package:dio/dio.dart';
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
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Image.network(
                'https://api.chucknorris.io/img/chucknorris_logo_coloured_small.png'),
            const Text("HI"),
            ChuckButton(AppRes.randomJoke),
            ChuckButton(AppRes.categories),
            ChuckButton(AppRes.search),
          ],
        ),
      ),
    );
  }
}
