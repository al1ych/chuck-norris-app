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
        child: Center(
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemCount: jokes.length,
            itemBuilder: (context, index) => ListTile(
              // leading: const Icon(
              //   Icons.arrow_forward_ios,
              //   color: Colors.white,
              // ),
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
        ),
      ),
    );
  }
}
