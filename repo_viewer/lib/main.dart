import 'package:flutter/material.dart';
import 'package:repo_viewer/home.dart';

void main() {
  runApp(
    const MaterialApp(
      home: MyWidget(), // Changed from Home() to SandBox()
    ),
  );
}

class SandBox extends StatelessWidget {
  const SandBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SandBox'),
        backgroundColor: Colors.grey,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 100,
            // alignment: Alignment.center,
            color: Colors.red,
            child: const Text('Hello World'),
          ),
          Container(
            height: 200,
            // alignment: Alignment.center,
            color: Colors.green,
            child: const Text('Hello World'),
          ),
          Container(
            height: 300,
            // alignment: Alignment.center,
            color: Colors.blue,
            child: const Text('Hello World'),
          ),
        ],
      ),
    );
  }
}
