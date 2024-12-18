import 'package:flutter/material.dart';
import 'package:flutter_foundation/range_selector_page.dart';
void main() {
  runApp(const AppWidget());
}

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Randomizer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RangeSelectorPage(), // Ensure this page is defined
    );
  }
}

