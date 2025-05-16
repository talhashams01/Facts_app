import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:facts_app/models/fact.dart';

List<Fact> allFacts = [];

Future<void> loadFacts() async {
  final String response = await rootBundle.loadString('assets/facts.json');
  final List<dynamic> data = json.decode(response);

  allFacts = data.map((json) => Fact.fromJson(json)).toList();
}