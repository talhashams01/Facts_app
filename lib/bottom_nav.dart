//import 'package:facts_app/data/facts_data.dart';
//import 'package:facts_app/models/fact.dart';
// import 'package:facts_app/data/facts_data.dart';
// //import 'package:facts_app/models/fact.dart';
// import 'package:facts_app/screens/category_screen.dart';
// import 'package:facts_app/screens/favorites_screen.dart';
// import 'package:flutter/material.dart';
// //import 'package:facts_app/screens/counter_screen.dart';
// //import 'package:facts_app/screens/qibla_screen.dart';
// import '../screens/home_screen.dart';

// class BottomNav extends StatefulWidget {
//   const BottomNav({super.key});

//   @override
//   _BottomNavState createState() => _BottomNavState();
// }


// class _BottomNavState extends State<BottomNav> {
//   int currentIndex = 0;

//   final List<Widget> screens = [
//      HomeScreen(facts: allFacts),
//      CategoryScreen(), // Tab 2
//     FavoritesScreen(), // Tab 3
//     const Placeholder(), // Tab 4
//     const Placeholder(), // Tab 5
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: screens[currentIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: currentIndex,
//         onTap: (index) => setState(() => currentIndex = index),
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.home,color: Color.fromARGB(255, 248, 250, 250),), label: 'Home',backgroundColor: Color.fromARGB(255, 114, 99, 89),tooltip: 'Home'),
//           BottomNavigationBarItem(icon: Icon(Icons.category,), label: 'Category',tooltip: 'Category'),
//           BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites',tooltip: 'Favorites'),
//           BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Tab 4'),
//           BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Tab 5'),
//         ],
//       ),
//     );
//   }
// }

//import 'package:facts_app/data/facts_data.dart';
//import 'package:facts_app/models/fact.dart';
 //import 'package:facts_app/data/facts_data.dart';
 //import 'package:facts_app/screens/category_screen.dart';
//import 'package:facts_app/screens/favorites_screen.dart';
 import 'package:facts_app/screens/category_screen.dart';
import 'package:facts_app/screens/favorites_screen.dart';
import 'package:facts_app/screens/home_screen.dart';
import 'package:facts_app/screens/quiz_screen.dart';
import 'package:facts_app/screens/setting_screen.dart';
import 'package:flutter/material.dart';
 // import '../screens/home_screen.dart';

class BottomNav extends StatefulWidget {

  const BottomNav({super.key});
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    // const Center(child: Text('Home')),
    // const Center(child: Text('Category')),
    // const Center(child: Text('Favourite')),
    // const Center(child: Text('Settings')),
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
