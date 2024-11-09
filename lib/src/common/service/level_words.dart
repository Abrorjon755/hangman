import '../models/word_model.dart';

List<String> fruitWords = [
  "APPLE",
  "GRAPE",
  "PEACH",
  "BANANA",
  "ORANGE",
  "MANGO",
  "CHERRY",
  "KIWI",
  "PEAR",
  "STRAWBERRY",
  "FIG",
  "LEMON",
  "LIME",
  "PINEAPPLE",
];

List<WordModel> wordModels = [
  for (String i in fruitWords)
    WordModel(
      word: i,
      category: "Fruit",
      difficulty: i.length > 6 ? "Hard" : "Easy",
    )
];
