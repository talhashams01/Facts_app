// import 'package:shared_preferences/shared_preferences.dart';

// class FavoriteService {
//   static const _key = 'favorite_facts';

//   static Future<List<String>> getFavorites() async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.getStringList(_key) ?? [];
//   }

//   static Future<void> toggleFavorite(String fact) async {
//     final prefs = await SharedPreferences.getInstance();
//     final current = prefs.getStringList(_key) ?? [];

//     if (current.contains(fact)) {
//       current.remove(fact);
//     } else {
//       current.add(fact);
//     }

//     await prefs.setStringList(_key, current);
//   }

//   static Future<bool> isFavorite(String fact) async {
//     final prefs = await SharedPreferences.getInstance();
//     final current = prefs.getStringList(_key) ?? [];
//     return current.contains(fact);
//   }
// }

import 'package:shared_preferences/shared_preferences.dart';

class FavoriteService {
  static const String _key = 'favorite_facts';

  static Future<List<String>> getFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_key) ?? [];
  }

  static Future<bool> isFavorite(String fact) async {
    final favorites = await getFavorites();
    return favorites.contains(fact);
  }

  static Future<void> toggleFavorite(String fact) async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = await getFavorites();

    if (favorites.contains(fact)) {
      favorites.remove(fact);
    } else {
      favorites.add(fact);
    }

    await prefs.setStringList(_key, favorites);
  }
}