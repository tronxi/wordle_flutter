import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordle_flutter/bloc/models/wordle_model.dart';

abstract class WordleEvent {}

class AddLetterEvent extends WordleEvent {
  final String letter;
  AddLetterEvent({required this.letter});
}

class DelLetterEvent extends WordleEvent {}

class WordleBloc extends Bloc<WordleEvent, Wordle> {
  WordleBloc() : super(const Wordle(actual: 0, word: "")) {
    on<AddLetterEvent>((event, emit) async => emit(_onAddLetter(state, event.letter)));
    on<DelLetterEvent>((event, emit) async => emit(_onDelLetter(state)));
  }

  Wordle _onAddLetter(Wordle wordle, String letter) {
    if(wordle.isCompleteRound()) {
      return Wordle(actual: wordle.actual, word: wordle.word);
    }
    return Wordle(actual: wordle.actual, word: wordle.word + letter);
  }

  Wordle _onDelLetter(Wordle wordle) {
    if(wordle.word.isEmpty) return wordle;
    List<String> lettersList = wordle.word.split("");
    lettersList.removeLast();
    return Wordle(actual: wordle.actual, word: lettersList.join());
  }
}
