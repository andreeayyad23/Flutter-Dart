import 'package:flutter/material.dart';
import 'dart:convert'; // For JSON encoding/decoding
import 'package:shared_preferences/shared_preferences.dart'; // For SharedPreferences

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

class FavoriteApp extends StatefulWidget {
  @override
  _FavoriteAppState createState() => _FavoriteAppState();
}

class _FavoriteAppState extends State<FavoriteApp> {
  // List of all items
  List<String> allItems = ['Item 1', 'Item 2', 'Item 3', 'Item 4'];

  // List of favorited items
  List<String> favoriteItems = [];

  // Initialize SharedPreferences
  @override
  void initState() {
    super.initState();
    loadFavorites();
  }

  // Load favorites from SharedPreferences
  Future<void> loadFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedFavorites = prefs.getString('favorites');

    if (savedFavorites != null) {
      setState(() {
        favoriteItems = List<String>.from(jsonDecode(savedFavorites));
        allItems.removeWhere((item) => favoriteItems.contains(item));
      });
    }
  }

  // Save favorites to SharedPreferences
  Future<void> saveFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String encodedFavorites = jsonEncode(favoriteItems);
    await prefs.setString('favorites', encodedFavorites);
  }

  // Function to handle item click
  void toggleFavorite(String item) {
    setState(() {
      if (allItems.contains(item)) {
        // Move item to favorites
        allItems.remove(item);
        favoriteItems.add(item);
      } else if (favoriteItems.contains(item)) {
        // Move item back to all items
        favoriteItems.remove(item);
        allItems.add(item);
      }
    });
    saveFavorites(); // Persist changes
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shared Favorites App'),
      ),
      body: Column(
        children: [
          // List of all items
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('All Items:',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: allItems.length,
                    itemBuilder: (context, index) {
                      String item = allItems[index];
                      return ListTile(
                        title: Text(item),
                        trailing:
                            Icon(Icons.favorite_border, color: Colors.grey),
                        onTap: () => toggleFavorite(item),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),

          Divider(),

          // List of favorited items
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Favorited Items:',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: favoriteItems.length,
                    itemBuilder: (context, index) {
                      String item = favoriteItems[index];
                      return ListTile(
                        title: Text(item),
                        trailing: Icon(Icons.favorite, color: Colors.red),
                        onTap: () => toggleFavorite(item),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
