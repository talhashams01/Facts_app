import 'package:facts_app/data/facts_data.dart';
import 'package:facts_app/provider/category_preference_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryPreferencesScreen extends StatefulWidget {
  const CategoryPreferencesScreen({super.key});

  @override
  State<CategoryPreferencesScreen> createState() => _CategoryPreferencesScreenState();
}

class _CategoryPreferencesScreenState extends State<CategoryPreferencesScreen> {
  @override
  void initState() {
    super.initState();
    final provider = Provider.of<CategoryPreferenceProvider>(context, listen: false);
    final allCategories = allFacts.map((f) => f.category).toSet().toList();
    provider.loadPreferences(allCategories);
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CategoryPreferenceProvider>(context);
    final allCategories = allFacts.map((f) => f.category).toSet().toList();

    return Scaffold(
      appBar: AppBar(title: const Text("Category Preferences")),
      body: ListView.builder(
        itemCount: allCategories.length,
        itemBuilder: (context, index) {
          final category = allCategories[index];
          final isSelected = provider.isSelected(category);

          return CheckboxListTile(
            title: Text(category),
            value: isSelected,
            onChanged: (_) {
              provider.toggleCategory(category);
            },
          );
        },
      ),
    );
  }
}