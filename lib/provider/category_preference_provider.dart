
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class CategoryPreferenceProvider extends ChangeNotifier {
//   final List<String> _allCategories = [
//     'Science',
//     'History',
//     'Technology',
//     'Art',
//     'Sports',
//     'Space',
//     'Animals',
//     'literature',
//     'Geography',
//     'maths',
//     'biology',
//     'physics',
//     'paris',
//   ];

//   List<String> _selectedCategories = [];

//   // FIX: Add this public getter
//   List<String> get allCategories => _allCategories;

//   List<String> get selectedCategories => _selectedCategories;
//   CategoryPreferenceProvider(){
//     loadPreferences(allCategories);
//   }

//   Future<void> loadPreferences(List<String> allCategories) async {
//     final prefs = await SharedPreferences.getInstance();
//     final saved = prefs.getStringList('selected_categories');


//     // If no saved prefs, use all by default
//     _selectedCategories = saved ?? allCategories;
//     notifyListeners();
//   }

//   Future<void> toggleCategory(String category) async {
//     if (_selectedCategories.contains(category)) {
//       _selectedCategories.remove(category);
//     } else {
//       _selectedCategories.add(category);
//     }

//     final prefs = await SharedPreferences.getInstance();
//     prefs.setStringList('selected_categories', _selectedCategories);
//     notifyListeners();
//   }

//   bool isSelected(String category) => _selectedCategories.contains(category);
// }

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CategoryPreferenceProvider extends ChangeNotifier {
  final List<String> _allCategories = [
  
   'science',
     'animals',
     'technology',
     'AI',
     'sports',
     'bird',
      'women',
     "child's psychology",
     'computer',
     'computer shortcuts',
     'food',
     'biology',
     'fun facts',
    'general knowledge',    
     'health',
     'human body',
     'famous inventors',
     'japan',
     'literature',   
     'movies and entertainment',
     'nature',
     'psychology',
     'world',
     'youtube',
  ];
  List<String> _selectedCategories = [];

  List<String> get selectedCategories => _selectedCategories;
  List<String> get allCategories => _allCategories;

  CategoryPreferenceProvider() {
    loadPreferences(_allCategories);
  }

  Future<void> loadPreferences(List<String> allCategories) async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getStringList('selected_categories');

    _selectedCategories = saved ?? List.from(_allCategories); // default all
    notifyListeners();
  }

  Future<void> toggleCategory(String category) async {
    if (_selectedCategories.contains(category)) {
      _selectedCategories.remove(category);
    } else {
      _selectedCategories.add(category);
    }

    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('selected_categories', _selectedCategories);
    notifyListeners();
  }

  bool isSelected(String category) => _selectedCategories.contains(category);
}