import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final TextEditingController controller;
  final Future Function(String value) onSubmitted;

  const SearchField({
    Key? key,
    required this.controller,
    required this.onSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: TextField(
        key: key,
        controller: controller,
        onSubmitted: onSubmitted,
        autofocus: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(36),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
            ),
          ),
          filled: true,
          fillColor: Colors.white,
          focusColor: Theme.of(context).primaryColor,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
          labelText: 'Your query goes here...\n(if you dare)',
          labelStyle: const TextStyle(
            fontFamily: "Courier",
            fontSize: 14,
            fontWeight: FontWeight.w900,
            letterSpacing: 0.3,
            color: Color(0xff401A07),
          ),
        ),
      ),
    );
  }
}
