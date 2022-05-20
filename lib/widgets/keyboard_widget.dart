import 'package:flutter/material.dart';
import 'package:wordle_flutter/widgets/letter_key_widget.dart';

class KeyBoard extends StatelessWidget {
  const KeyBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                LetterKey("Q"), LetterKey("W"), LetterKey("E"), LetterKey("R"), LetterKey("T"), LetterKey("Y"), LetterKey("U"), LetterKey("I"), LetterKey("O"), LetterKey("P")
              ],
            ),
            const SizedBox(height:10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                LetterKey("A"), LetterKey("S"), LetterKey("D"), LetterKey("F"), LetterKey("G"), LetterKey("H"), LetterKey("J"),LetterKey("K"),LetterKey("L"),LetterKey("Ñ"),
              ],
            ),
            const SizedBox(height:10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                LetterKey("ENTER"), LetterKey("Z"), LetterKey("X"), LetterKey("C"), LetterKey("V"), LetterKey("B"), LetterKey("N"), LetterKey("M"),LetterKey("DEL")
              ],
            )
          ],
    );
  }
}
