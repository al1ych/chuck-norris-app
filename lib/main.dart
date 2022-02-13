import 'package:chuck_norris_app/page/menu.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chuck Norris App',
      theme: ThemeData(
        primaryColor: const Color(0xffF15A24),
        backgroundColor: const Color(0xff2B2B2B),
        accentColor: const Color(0xff29ABE2),
      ),
      home: const MenuPage(),
      // routes: {
      //   '/home': MaterialPageRoute(fullscreenDialog: true),
      // },
    );
  }
}
