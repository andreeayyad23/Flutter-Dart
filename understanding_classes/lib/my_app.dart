import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello World',
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.red, // Start color
                Colors.red, // Middle color
                Colors.purple, // End color
              ],
              stops: [0.0, 0.5, 1.0], // Split the gradient at 50%
            ),
          ),
          child: Center(
            child: Text(
              'Hello World',
              style: TextStyle(
                fontSize: 48,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                decorationColor: Colors.blue,
                decorationStyle: TextDecorationStyle.dashed,
              ),
            ),
          ),
        ),
      ),
    );
  }
}