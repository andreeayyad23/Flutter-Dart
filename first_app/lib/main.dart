import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text(
            'Flutter App',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Center(
          child: Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [Colors.red, Colors.pink]),
              border: Border.all(color: Colors.white, width: 5),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'Hello, World!',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}