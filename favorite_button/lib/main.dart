import 'package:flutter/material.dart';
import 'favorite_app.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shared Favorites App',
      home: FavoriteApp(),
    );
  }
}
