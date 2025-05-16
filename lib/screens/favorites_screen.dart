// import 'package:facts_app/services/favorite_service.dart';
// import 'package:flutter/material.dart';
// //import 'services/favorite_service.dart';

// class FavoritesScreen extends StatefulWidget {
//   @override
//   _FavoritesScreenState createState() => _FavoritesScreenState();
// }

// class _FavoritesScreenState extends State<FavoritesScreen> {
//   List<String> favorites = [];

//   @override
//   void initState() {
//     super.initState();
//     loadFavorites();
//   }

//   Future<void> loadFavorites() async {
//     final favs = await FavoriteService.getFavorites();
//     setState(() {
//       favorites = favs;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('My Favorites')),
//       body: favorites.isEmpty
//           ? Center(child: Text('No favorite facts yet.'))
//           : ListView.builder(
//               itemCount: favorites.length,
//               itemBuilder: (context, index) {
//                 return ListTile(title: Text(favorites[index]));
//               },
//             ),
//     );
//   }
// }

//import 'package:facts_app/data/facts_data.dart';
import 'package:flutter/material.dart';
import '../services/favorite_service.dart';

class FavoritesScreen extends StatefulWidget {
  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  List<String> _favorites = [];
 

  @override
  void initState() {
    super.initState();
    loadFavorites();
  }
 
  Future<void> loadFavorites() async {
    final favs = await FavoriteService.getFavorites();
    setState(() {
      _favorites = favs;
    });
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(245, 242, 242, 1),
      appBar: AppBar(title: Text("Favorite Facts")),
      body: _favorites.isEmpty
          ? Center(child: Text("No favorite facts yet.",style: TextStyle(color: Colors.blue),))
          : ListView.builder(
              itemCount: _favorites.length,
              itemBuilder: (context, index) {
                final fact = _favorites[index];
                return Card(
                    shadowColor: const Color.fromARGB(66, 31, 30, 30),
                      elevation: 40,
                  margin: const EdgeInsets.all(12),
                  child: ListTile(
                    title: Text(fact),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () async {
                        await FavoriteService.toggleFavorite(fact);
                        loadFavorites(); // Reload list
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }
}