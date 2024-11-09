class WordModel {
  const WordModel({
    required this.word,
    required this.category,
    required this.difficulty,
  });

  final String word;
  final String category;
  final String difficulty;

  // CopyWith method
  WordModel copyWith({
    String? word,
    String? category,
    String? difficulty,
  }) {
    return WordModel(
      word: word ?? this.word,
      category: category ?? this.category,
      difficulty: difficulty ?? this.difficulty,
    );
  }

  // fromJson factory constructor
  factory WordModel.fromJson(Map<String, dynamic> json) {
    return WordModel(
      word: json['word'] as String,
      category: json['category'] as String,
      difficulty: json['difficulty'] as String,
    );
  }

  // toJson method
  Map<String, dynamic> toJson() {
    return {
      'word': word,
      'category': category,
      'difficulty': difficulty,
    };
  }

  // == operator override
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WordModel &&
        other.word == word &&
        other.category == category &&
        other.difficulty == difficulty;
  }

  // hashCode override
  @override
  int get hashCode => Object.hash(word, category, difficulty);
}
