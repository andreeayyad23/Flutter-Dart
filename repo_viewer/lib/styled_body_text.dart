import 'package:flutter/material.dart';

class StyledBodyText extends StatelessWidget {
  final String text;

  const StyledBodyText(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 16, color: Colors.black), // Customize your style here
    );
  }
}