import 'package:chuck_norris_app/api/api.dart';
import 'package:chuck_norris_app/const/app_res.dart';
import 'package:chuck_norris_app/page/content.dart';
import 'package:chuck_norris_app/widget/button.dart';
import 'package:chuck_norris_app/widget/pageTitleText.dart';
import 'package:chuck_norris_app/widget/searchField.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  final _searchFieldController = TextEditingController();

  SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenW = MediaQuery.of(context).size.width;
    var screenH = MediaQuery.of(context).size.height;

    void _searchCallback() async {
      print("search pressed");
      List<String> jokes = await Api.search(_searchFieldController.text);
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => SearchResultPage(jokes),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const PageTitleText(text: "Free text search"),
              SizedBox(height: 0.02 * screenH),
              Image.network(
                AppRes.chuckSearchImgUrl,
                width: 0.69 * screenW,
              ),
              SizedBox(height: 0.03 * screenH),
              SizedBox(
                height: 64,
                child: SearchField(
                  controller: _searchFieldController,
                ),
              ),
              SizedBox(height: 0.01 * screenH),
              SizedBox(
                height: 64,
                child: ChuckButton(
                  "Search!",
                  onPressed: _searchCallback,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
