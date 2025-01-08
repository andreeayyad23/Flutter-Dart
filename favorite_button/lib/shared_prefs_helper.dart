import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class SharedPrefsHelper {
  static const String favoritesKey = 'favorites';

  // Load favorites from SharedPreferences
  static Future<List<String>> loadFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedFavorites = prefs.getString(favoritesKey);

    if (savedFavorites != null) {
      return List<String>.from(jsonDecode(savedFavorites));
    }
    return [];
  }

  // Save favorites to SharedPreferences
  static Future<void> saveFavorites(List<String> favoriteItems) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String encodedFavorites = jsonEncode(favoriteItems);
    await prefs.setString(favoritesKey, encodedFavorites);
  }
}
