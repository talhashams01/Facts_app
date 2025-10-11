
import 'package:facts_app/screens/category_screen.dart';
import 'package:facts_app/screens/favorites_screen.dart';
import 'package:facts_app/screens/home_screen.dart';
import 'package:facts_app/screens/quiz_screen.dart';
import 'package:facts_app/screens/setting_screen.dart';
import 'package:flutter/material.dart';
 

class BottomNav extends StatefulWidget {

  const BottomNav({super.key});
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    
    HomeScreen(),
    CategoryScreen(),

    FavoritesScreen(),
      QuizScreen(),
    SettingsScreen()
    

  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildIcon(IconData icon, String label, int index) {
    final isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: isSelected
                ? BoxDecoration(
                    color: Colors.pink.shade50,
                    borderRadius: BorderRadius.circular(12),
                  )
                : null,
            padding: const EdgeInsets.all(8),
            child: Icon(
              icon,
              color: isSelected ? Colors.red : Colors.black,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.red : Colors.black,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 10),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildIcon(Icons.home_outlined, 'Home', 0,),
            _buildIcon(Icons.category_outlined, 'Category', 1),
            _buildIcon(Icons.favorite_border, 'Favourite', 2),
            _buildIcon(Icons.quiz, 'Quiz', 3),
            _buildIcon(Icons.settings_outlined, 'Settings', 4),
          ],
        ),
      ),
    );
  }
}
