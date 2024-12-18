import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final int randomNumber;

  const ResultPage({super.key, required this.randomNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generated Number'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text(
          'Random Number: $randomNumber',
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
