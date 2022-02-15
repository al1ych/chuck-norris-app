import 'package:chuck_norris_app/const/app_res.dart';
import 'package:chuck_norris_app/widget/pageTitleText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchResultPage extends StatelessWidget {
  final List<String> jokes;

  const SearchResultPage(this.jokes, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: jokes.isNotEmpty
            ? Center(
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemCount: jokes.length,
                  itemBuilder: (context, index) => ListTile(
                    title: Text(
                      jokes[index],
                      style: const TextStyle(
                        fontFamily: "Courier",
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider(
                      color: Colors.white,
                    );
                  },
                ),
              )
            : const Center(
                child: Text(
                  AppRes.noResult,
                  style: TextStyle(
                    fontFamily: "Courier",
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
      ),
    );
  }
}
