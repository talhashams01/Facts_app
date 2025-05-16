import 'package:flutter/material.dart';
import '../models/category.dart';
import 'facts_screen.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<CategoryScreen> {
  TextEditingController _searchController = TextEditingController();

  final List<Category> _allCategories = [
    
    Category(name: 'technology', image: 'assets/images/technology.jpg'),
    Category(name: 'animals', image: 'assets/images/animals.jpg'),
    Category(name: 'food', image: 'assets/images/food.jpg'),
    Category(name: 'women', image: 'assets/images/women.jpg'),
    Category(name: 'fun facts', image: 'assets/images/fun_facts.jpg'),
    Category(name: 'science', image: 'assets/images/science.jpg'),
    Category(name: 'japan', image: 'assets/images/japan.jpg'),
    Category(name: 'famous inventors', image: 'assets/images/inventions.jpg'),
    Category(name: 'health', image: 'assets/images/health.jpg'),
    Category(name: "child's psychology", image: 'assets/images/child_psycho.jpg'),
    
    Category(name: 'human body', image: 'assets/images/human.jpg'),
    Category(name: 'general knowledge', image: 'assets/images/generalknowledge.jpg'),
    Category(name: 'AI', image: 'assets/images/ai.jpg'),
    Category(name: 'biology', image: 'assets/images/biology.jpg'),
    Category(name: 'movies and entertainment', image: 'assets/images/movies.jpg'),
    Category(name: 'computer', image: 'assets/images/computer.jpg'),
    Category(name: 'computer shortcuts', image: 'assets/images/comp_short.jpg'),
    Category(name: 'literature', image: 'assets/images/literature.jpg'),
    Category(name: 'nature', image: 'assets/images/nature.jpg'),
    Category(name: 'bird', image: 'assets/images/birds.jpg'),
    Category(name: 'sports', image: 'assets/images/sports.jpg'),
    Category(name: 'psychology', image: 'assets/images/psychology.jpg'),
    Category(name: 'world', image: 'assets/images/world.jpg'),
    Category(name: 'youtube', image: 'assets/images/youtube.jpg'),

    // Add more if needed
  ];

  List<Category> _filteredCategories = [];

  @override
  void initState() {
    super.initState();
    _filteredCategories = _allCategories;
    _searchController.addListener(_filterCategories);
  }

  void _filterCategories() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredCategories = _allCategories
          .where((category) => category.name.toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(245, 242, 242, 1),
      appBar: AppBar(title: const Text('Fact Categories')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search Category...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 3 / 2,
              ),
              itemCount: _filteredCategories.length,
              itemBuilder: (context, index) {
                final category = _filteredCategories[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            FactsScreen(category: category.name),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: AssetImage(category.image),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.4), BlendMode.darken),
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      category.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}