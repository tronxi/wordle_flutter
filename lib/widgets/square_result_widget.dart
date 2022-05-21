import 'package:flutter/material.dart';

import '../models/wordle_model.dart';

class SquareResult extends StatelessWidget {
  final String? letter;
  final LetterStatus letterStatus;
  static const Map<LetterStatus, Color> letterColorMap = {
    LetterStatus.nothing: Colors.white,
    LetterStatus.fail: Colors.grey,
    LetterStatus.ordered: Color.fromRGBO(42, 244, 13, 1.0),
    LetterStatus.unordered: Colors.amber
  };
  const SquareResult({Key? key, this.letter, required this.letterStatus}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 5.0, bottom: 5.0),
      width: 60,
      height: 60,
      decoration: BoxDecoration(
          color: letterColorMap[letterStatus],
          border: Border.all(width: 2.0, color: Colors.black),
          borderRadius: const BorderRadius.all(Radius.circular(2))
      ),
      child: letter == null ? const SizedBox.shrink() : LetterResult(letter: letter!)
    );
  }
}

class LetterResult extends StatelessWidget {
  final String letter;
  const LetterResult({Key? key, required this.letter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        letter.toUpperCase(),
        style: const TextStyle(
          fontSize: 50,
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}

