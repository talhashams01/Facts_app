import 'package:flutter/material.dart';

class DailyFactScreen extends StatelessWidget {
  final String factText;
  const DailyFactScreen({super.key, required this.factText});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Daily Fact")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Text(
            factText,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}