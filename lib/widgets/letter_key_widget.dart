import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordle_flutter/bloc/wordle_bloc.dart';

import '../models/wordle_model.dart';

class LetterKey extends StatelessWidget {
  final String letter;
  final LetterStatus letterStatus;
  const LetterKey({Key? key, required this.letterStatus, required this.letter}) : super(key: key);

  static const Map<LetterStatus, Color> letterColorMap = {
    LetterStatus.nothing: Color.fromRGBO(194, 189, 189, 1.0),
    LetterStatus.fail: Color.fromRGBO(100, 104, 100, 1.0),
    LetterStatus.ordered: Color.fromRGBO(42, 244, 13, 1.0),
    LetterStatus.unordered: Colors.amber
  };

  @override
  Widget build(BuildContext context) {
    final wordleBloc = context.read<WordleBloc>();
    double width = letter.length == 1 ? 25 : 70;
    return GestureDetector(
      onTap: () => _onPressed(wordleBloc),
      child: Container(
        margin: const EdgeInsets.only(left: 5.0),
        width: width,
        height: 35,
        decoration: BoxDecoration(
            color: letterColorMap[letterStatus],
            borderRadius: const BorderRadius.all(Radius.circular(5))
        ),
        child: Center(
          child: Text(letter.toUpperCase(),
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
  void _onPressed(WordleBloc wordleBloc) {
    if(letter.toUpperCase() == "DEL") {
      wordleBloc.add(DelLetterEvent());
    } else if(letter.toUpperCase() == "ENTER") {
      wordleBloc.add(EnterLetterEvent());
    }else {
      wordleBloc.add(AddLetterEvent(letter: letter));
    }
  }
}
