import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final TextEditingController controller;

  const SearchField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: TextField(
        key: key,
        controller: controller,
        autofocus: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(36),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(36),
            borderSide: const BorderSide(
              color: Colors.black,
              style: BorderStyle.solid,
              width: 3,
            ),
          ),
          filled: true,
          fillColor: Colors.white,
          focusColor: Theme.of(context).primaryColor,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 24.0,
          ),
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
