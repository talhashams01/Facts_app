

import 'dart:convert';
import 'package:facts_app/screens/favorites_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show Clipboard, ClipboardData, rootBundle;
import 'package:share_plus/share_plus.dart';

import '../models/fact.dart';
import '../services/favorite_service.dart';

class FactsScreen extends StatefulWidget {
  final String category;

  const FactsScreen({super.key, required this.category});

  @override
  _FactsScreenState createState() => _FactsScreenState();
}

class _FactsScreenState extends State<FactsScreen> {
  List<Fact> _facts = [];

  @override
  void initState() {
    super.initState();
    loadFacts();
  }

  Future<void> loadFacts() async {
    final String response = await rootBundle.loadString('assets/facts.json');
    final List<dynamic> data = json.decode(response);

    setState(() {
      _facts = data
          .map((fact) => Fact.fromJson(fact))
          .where((fact) => fact.category == widget.category)
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(245, 242, 242, 1),
      appBar: AppBar(
        title: Text('${widget.category} Facts'),
       // backgroundColor: Colors.white,
      // foregroundColor: Colors.white,
        actions: [
          IconButton(onPressed: (){
             Navigator.push(context, MaterialPageRoute(builder: (context)=>FavoritesScreen()));
           },
            icon: Icon(Icons.favorite,color: Colors.red,))
         ],
      ),
      body: _facts.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _facts.length,
              itemBuilder: (context, index) {
                final fact = _facts[index];
                return FutureBuilder<bool>(
                  future: FavoriteService.isFavorite(fact.text),
                  builder: (context, snapshot) {
                    final isFav = snapshot.data ?? false;

                    return Card(
                      shadowColor: const Color.fromARGB(66, 31, 30, 30),
                      elevation: 40,
                      //borderOnForeground: true,
                      margin: const EdgeInsets.all(12),
                      child: ListTile(
                        //contentPadding: EdgeInsets.all(10),
                        title: Text(fact.text),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(
                                isFav ? Icons.favorite : Icons.favorite_border,
                                color: isFav ? Colors.red : null,
                              ),
                              onPressed: () async {
                                await FavoriteService.toggleFavorite(fact.text);
                                setState(() {}); // Refresh UI
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.copy),
                              onPressed: () {
                                Clipboard.setData(
                                    ClipboardData(text: fact.text));
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Copied to clipboard')),
                                );
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.share),
                              onPressed: () {
                                Share.share(fact.text);
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}