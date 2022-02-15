import 'dart:developer';

import 'package:chuck_norris_app/api/api.dart';
import 'package:chuck_norris_app/widget/button.dart';
import 'package:chuck_norris_app/widget/pageTitleText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String placeholderValue = "Loading categories...";
    var screenW = MediaQuery.of(context).size.width;
    var screenH = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: FutureBuilder(
          future: Api.getCategories(),
          initialData: const [placeholderValue],
          builder: (context, snapshot) {
            var data = snapshot.data as List<String>;
            return Stack(
              children: [
                Column(
                  children: [
                    const SizedBox(height: 24),
                    Align(
                      alignment: AlignmentDirectional.topEnd,
                      child: Image(
                        image: const AssetImage('./assets/chuckCategories.png'),
                        width: screenW * 0.6,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: const [
                    SizedBox(height: 54),
                    Center(
                      child: PageTitleText(text: "Select Category"),
                    ),
                  ],
                ),
                Align(
                  alignment: AlignmentDirectional.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: screenH * 0.7 ~/ (64 + 16) * (64 + 16),
                          child: ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              String categoryTitle = data[index];
                              return categoryTitle == placeholderValue
                                  ? Center(
                                      child: CircularProgressIndicator(
                                        color: Theme.of(context).primaryColor,
                                        strokeWidth: 6,
                                      ),
                                    )
                                  : Column(
                                      children: [
                                        SizedBox(
                                          height: 64,
                                          child: ChuckButton(
                                            categoryTitle,
                                            onPressed: () async {
                                              print("tapped $categoryTitle");
                                              final String joke =
                                                  await Api.getRandomJoke(
                                                      category: categoryTitle);
                                              Utils.showJoke(context, joke);
                                            },
                                          ),
                                        ),
                                      ],
                                    );
                            },
                            separatorBuilder: (BuildContext context, int index) {
                              return const SizedBox(height: 16);
                            },
                          ),
                        ),
                        const SizedBox(height: 42),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
