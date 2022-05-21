import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordle_flutter/models/wordle_model.dart';
import 'package:wordle_flutter/widgets/letter_key_widget.dart';

import '../bloc/wordle_bloc.dart';

class KeyBoard extends StatelessWidget {
  const KeyBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WordleBloc, Wordle>(builder: (context, wordle){
      return Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  <Widget>[
              LetterKey(letter: "Q", letterStatus: _retrieve(wordle, "Q")),
              LetterKey(letter: "W", letterStatus: _retrieve(wordle, "W")),
              LetterKey(letter: "E", letterStatus: _retrieve(wordle, "E")),
              LetterKey(letter: "R", letterStatus: _retrieve(wordle, "R")),
              LetterKey(letter: "T", letterStatus: _retrieve(wordle, "T")),
              LetterKey(letter: "Y", letterStatus: _retrieve(wordle, "Y")),
              LetterKey(letter: "U", letterStatus: _retrieve(wordle, "U")),
              LetterKey(letter: "I", letterStatus: _retrieve(wordle, "I")),
              LetterKey(letter: "O", letterStatus: _retrieve(wordle, "O")),
              LetterKey(letter: "P", letterStatus: _retrieve(wordle, "P")),
            ],
          ),
          const SizedBox(height:15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              LetterKey(letter: "A", letterStatus: _retrieve(wordle, "A")),
              LetterKey(letter: "S", letterStatus: _retrieve(wordle, "S")),
              LetterKey(letter: "D", letterStatus: _retrieve(wordle, "D")),
              LetterKey(letter: "F", letterStatus: _retrieve(wordle, "F")),
              LetterKey(letter: "G", letterStatus: _retrieve(wordle, "G")),
              LetterKey(letter: "H", letterStatus: _retrieve(wordle, "H")),
              LetterKey(letter: "J", letterStatus: _retrieve(wordle, "J")),
              LetterKey(letter: "K", letterStatus: _retrieve(wordle, "K")),
              LetterKey(letter: "L", letterStatus: _retrieve(wordle, "L")),
              LetterKey(letter: "Ñ", letterStatus: _retrieve(wordle, "Ñ")),
            ],
          ),
          const SizedBox(height:15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  <Widget>[
              const LetterKey(letter: "ENTER", letterStatus: LetterStatus.nothing),
              LetterKey(letter: "Z", letterStatus: _retrieve(wordle, "Z")),
              LetterKey(letter: "X", letterStatus: _retrieve(wordle, "X")),
              LetterKey(letter: "C", letterStatus: _retrieve(wordle, "C")),
              LetterKey(letter: "V", letterStatus: _retrieve(wordle, "V")),
              LetterKey(letter: "B", letterStatus: _retrieve(wordle, "B")),
              LetterKey(letter: "N", letterStatus: _retrieve(wordle, "N")),
              LetterKey(letter: "M", letterStatus: _retrieve(wordle, "M")),
              const LetterKey(letter: "DEL", letterStatus: LetterStatus.nothing)
            ],
          )
        ],
      );
    });
  }
  LetterStatus _retrieve(Wordle wordle, String letter) {
    return wordle.keyStatus[letter] ?? LetterStatus.nothing;
  }
}
