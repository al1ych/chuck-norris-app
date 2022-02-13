import 'dart:developer';

import 'package:chuck_norris_app/api/api.dart';
import 'package:chuck_norris_app/widget/button.dart';
import 'package:flutter/material.dart';

import '../functionality.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: FutureBuilder(
        future: Api.getCategories(),
        initialData: const ["Loading..."],
        builder: (context, snapshot) {
          var data = snapshot.data as List<String>;
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              String categoryTitle = data[index];
              return ChuckButton(
                categoryTitle,
                onPressed: () async {
                  print("tapped $categoryTitle");
                  final String joke = await Api.getRandomJoke(category: categoryTitle);
                  Functionality.showJoke(context, joke);
                },
              );
            },
          );
        },
      ),
    );
  }
}
