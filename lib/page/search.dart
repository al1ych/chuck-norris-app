import 'package:chuck_norris_app/const/app_res.dart';
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
              SizedBox(height: 0.025 * screenH),
              Image.network(
                AppRes.chuckSearchImgUrl,
                width: 0.69 * screenW,
              ),
              SizedBox(height: 0.05 * screenH),
              SizedBox(
                height: 64,
                child: SearchField(
                  controller: _searchFieldController,
                  onSubmitted: (String value) async {
                    await showDialog<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Thanks!'),
                          content: Text(
                              'You typed "$value", which has length ${value.characters.length}.'),
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
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
