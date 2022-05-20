import 'package:flutter/material.dart';

class SquareResult extends StatelessWidget {
  final String? letter;
  const SquareResult({Key? key, this.letter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 5.0, bottom: 5.0),
      width: 60,
      height: 60,
      decoration: BoxDecoration(
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

