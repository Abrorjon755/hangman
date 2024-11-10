import 'package:flutter/material.dart';

import 'my_letter.dart';

class MyCustomKeyboard extends StatelessWidget {
  const MyCustomKeyboard({
    super.key,
    required this.errorWords,
    required this.trueWords,
  });

  final List<String> trueWords;
  final List<String> errorWords;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyLetter(letter: "A", trueWords: trueWords, errorWords: errorWords),
            MyLetter(letter: "B", trueWords: trueWords, errorWords: errorWords),
            MyLetter(letter: "C", trueWords: trueWords, errorWords: errorWords),
            MyLetter(letter: "D", trueWords: trueWords, errorWords: errorWords),
            MyLetter(letter: "E", trueWords: trueWords, errorWords: errorWords),
            MyLetter(letter: "F", trueWords: trueWords, errorWords: errorWords),
            MyLetter(letter: "G", trueWords: trueWords, errorWords: errorWords),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(),
            MyLetter(letter: "H", trueWords: trueWords, errorWords: errorWords),
            MyLetter(letter: "I", trueWords: trueWords, errorWords: errorWords),
            MyLetter(letter: "J", trueWords: trueWords, errorWords: errorWords),
            MyLetter(letter: "K", trueWords: trueWords, errorWords: errorWords),
            MyLetter(letter: "L", trueWords: trueWords, errorWords: errorWords),
            MyLetter(letter: "M", trueWords: trueWords, errorWords: errorWords),
            const SizedBox(),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyLetter(letter: "N", trueWords: trueWords, errorWords: errorWords),
            MyLetter(letter: "O", trueWords: trueWords, errorWords: errorWords),
            MyLetter(letter: "P", trueWords: trueWords, errorWords: errorWords),
            MyLetter(letter: "Q", trueWords: trueWords, errorWords: errorWords),
            MyLetter(letter: "R", trueWords: trueWords, errorWords: errorWords),
            MyLetter(letter: "S", trueWords: trueWords, errorWords: errorWords),
            MyLetter(letter: "T", trueWords: trueWords, errorWords: errorWords),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(),
            MyLetter(letter: "U", trueWords: trueWords, errorWords: errorWords),
            MyLetter(letter: "V", trueWords: trueWords, errorWords: errorWords),
            MyLetter(letter: "W", trueWords: trueWords, errorWords: errorWords),
            MyLetter(letter: "X", trueWords: trueWords, errorWords: errorWords),
            MyLetter(letter: "Y", trueWords: trueWords, errorWords: errorWords),
            MyLetter(letter: "Z", trueWords: trueWords, errorWords: errorWords),
            const SizedBox(),
          ],
        )
      ],
    );
  }
}
