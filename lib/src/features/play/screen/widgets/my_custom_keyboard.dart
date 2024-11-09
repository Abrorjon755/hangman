import 'package:flutter/material.dart';

import 'my_letter.dart';

class MyCustomKeyboard extends StatelessWidget {
  const MyCustomKeyboard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyLetter(letter: "A"),
            MyLetter(letter: "B"),
            MyLetter(letter: "C"),
            MyLetter(letter: "D"),
            MyLetter(letter: "E"),
            MyLetter(letter: "F"),
            MyLetter(letter: "G"),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(),
            MyLetter(letter: "H"),
            MyLetter(letter: "I"),
            MyLetter(letter: "J"),
            MyLetter(letter: "K"),
            MyLetter(letter: "L"),
            MyLetter(letter: "M"),
            SizedBox(),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyLetter(letter: "N"),
            MyLetter(letter: "O"),
            MyLetter(letter: "P"),
            MyLetter(letter: "Q"),
            MyLetter(letter: "R"),
            MyLetter(letter: "S"),
            MyLetter(letter: "T"),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(),
            MyLetter(letter: "U"),
            MyLetter(letter: "V"),
            MyLetter(letter: "W"),
            MyLetter(letter: "X"),
            MyLetter(letter: "Y"),
            MyLetter(letter: "Z"),
            SizedBox(),
          ],
        )
      ],
    );
  }
}
