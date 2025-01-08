import 'package:favorite_button/shared_prefs_helper.dart';
import 'package:flutter/material.dart';

class FavoriteApp extends StatefulWidget {
  @override
  _FavoriteAppState createState() => _FavoriteAppState();
}

class _FavoriteAppState extends State<FavoriteApp> {
  // List of all items
  List<String> allItems = ['Item 1', 'Item 2', 'Item 3', 'Item 4'];

  // List of favorited items
  List<String> favoriteItems = [];

  @override
  void initState() {
    super.initState();
    loadFavorites();
  }

  // Load favorites from SharedPreferences
  Future<void> loadFavorites() async {
    favoriteItems = await SharedPrefsHelper.loadFavorites();
    setState(() {
      allItems.removeWhere((item) => favoriteItems.contains(item));
    });
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
    SharedPrefsHelper.saveFavorites(favoriteItems); // Persist changes
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
