class Fact {
  final String category;
  final String text;
  bool isFavorite ;

  Fact({required this.category, required this.text, this.isFavorite = false});

  factory Fact.fromJson(Map<String, dynamic> json) {
    return Fact(
      category: json['category'],
      text: json['text'],
    );
  }
}