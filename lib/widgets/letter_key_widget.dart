import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordle_flutter/bloc/wordle_bloc.dart';

class LetterKey extends StatelessWidget {
  final String letter;
  const LetterKey(this.letter, {Key? key}) : super(key: key);

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
        decoration: const BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.all(Radius.circular(5))
        ),
        child: Center(
          child: Text(letter,
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
    } else {
      wordleBloc.add(AddLetterEvent(letter: letter));
    }
  }
}
