import 'package:flutter/material.dart';

class ChuckField extends StatelessWidget {
  final TextEditingController controller;
  final Future Function(String value) onSubmitted;

  const ChuckField({
    Key? key,
    required this.controller,
    required this.onSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      key: key,
      controller: controller,
      onSubmitted: onSubmitted,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Your query goes here...',
      ),
    );
  }
}
