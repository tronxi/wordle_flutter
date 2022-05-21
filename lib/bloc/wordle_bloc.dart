import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordle_flutter/repository/models/wordle_response.dart';
import 'package:wordle_flutter/repository/wordle_repository.dart';

import '../models/wordle_model.dart';

abstract class WordleEvent {}

class AddLetterEvent extends WordleEvent {
  final String letter;
  AddLetterEvent({required this.letter});
}

class DelLetterEvent extends WordleEvent {}
class EnterLetterEvent extends WordleEvent {}
class NotifiedEvent extends WordleEvent {}

class WordleBloc extends Bloc<WordleEvent, Wordle> {

  static const Map<WordleLetterStatus, LetterStatus> letterStatusMap = {
    WordleLetterStatus.Fail: LetterStatus.fail,
    WordleLetterStatus.Ordered: LetterStatus.ordered,
    WordleLetterStatus.Unordered: LetterStatus.unordered,
  };

  static const Map<LetterStatus, int> priorityMap = {
    LetterStatus.nothing: 0,
    LetterStatus.fail: 1,
    LetterStatus.unordered: 2,
    LetterStatus.ordered: 3
  };

  final WordleRepository wordleRepository = WordleRepository();

  WordleBloc() : super(Wordle(actual: 0,
                          words: List<WordStatus>.generate(Wordle.totalTries, (index) => WordStatus(word: "", letterStatus: List<LetterStatus>.generate(Wordle.sizeWord, (index) => LetterStatus.nothing))),
                          status: WordleStatus.pending,
                          keyStatus: Wordle.initialKeyStatus())) {
    on<AddLetterEvent>((event, emit) => emit(_onAddLetter(state, event.letter)));
    on<DelLetterEvent>((event, emit) => emit(_onDelLetter(state)));
    on<EnterLetterEvent>((event, emit) async => emit(await _onEnterLetter(state)));
    on<NotifiedEvent>((event, emit) => emit(_onNotified(state)));
  }

  Wordle _onAddLetter(Wordle wordle, String letter) {
    if(wordle.isFinished()) return wordle;

    if(wordle.isCompleteRound()) {
      return Wordle(actual: wordle.actual, words: wordle.words, status: wordle.status, keyStatus: wordle.keyStatus);
    }
    String newWord = wordle.word + letter;
    return Wordle(actual: wordle.actual, words: _updateWordInList(wordle, newWord), status: wordle.status, keyStatus: wordle.keyStatus);
  }

  Future<Wordle> _onEnterLetter(Wordle wordle) async {
    if(wordle.isFinished()) return wordle;

    if(wordle.isCompleteRound()) {
      WordleResponse wordleResponse = await wordleRepository.retrieve(wordle);
      if(wordleResponse.wordleStatus == WordleStatusResponse.Invalid) {
        return Wordle(actual: wordle.actual, words: wordle.words, status: WordleStatus.invalid, shouldNotify: true, keyStatus: wordle.keyStatus);
      } else if(wordleResponse.wordleStatus == WordleStatusResponse.Pending && wordle.actual == Wordle.totalTries - 1) {
        return Wordle(actual: wordle.actual, words: _updateWordInListWithLetters(wordle, wordleResponse.letterStatusList), status: WordleStatus.lost, keyStatus: _updateKeyStatus(wordle, _toDomain(wordleResponse.letterStatusList)));
      } else if(wordleResponse.wordleStatus == WordleStatusResponse.Completed) {
        return Wordle(actual: wordle.actual, words: _updateWordInListWithLetters(wordle, wordleResponse.letterStatusList), status: WordleStatus.completed,keyStatus: _updateKeyStatus(wordle, _toDomain(wordleResponse.letterStatusList)));
      }
      return Wordle(actual: wordle.actual + 1, words: _updateWordInListWithLetters(wordle, wordleResponse.letterStatusList), status: WordleStatus.pending, keyStatus: _updateKeyStatus(wordle, _toDomain(wordleResponse.letterStatusList)));
    }
    return wordle;
  }

  Wordle _onNotified(Wordle wordle) {
    return Wordle(actual: wordle.actual, words: wordle.words, status: wordle.status, shouldNotify: false, keyStatus: wordle.keyStatus);
  }

  Wordle _onDelLetter(Wordle wordle) {
    if(wordle.isFinished()) return wordle;
    if(wordle.word.isEmpty) return wordle;
    List<String> lettersList = wordle.word.split("");
    lettersList.removeLast();
    String newWord = lettersList.join();
    return Wordle(actual: wordle.actual, words: _updateWordInList(wordle, newWord), status: wordle.status, keyStatus: wordle.keyStatus);
  }

  Map<String, LetterStatus> _updateKeyStatus(Wordle wordle, List<LetterStatus> letterStatus) {
    Map<String, LetterStatus> newMap = wordle.keyStatus;
    for(var i = 0; i < wordle.words[wordle.actual].word.length; i++){
      var word = wordle.words[wordle.actual].word;
      int previousPriority = priorityMap[wordle.keyStatus[word[i]]] ?? 0;
      int newPriority = priorityMap[letterStatus[i]] ?? 0;
      if(newPriority > previousPriority) {
        newMap[word[i]] = letterStatus[i];
      }
    }
    return newMap;
  }

  List<WordStatus> _updateWordInList(Wordle wordle, String word) {
    List<WordStatus> list = [];
    for(var i = 0; i < wordle.words.length; i++) {
      if (i != wordle.actual) {
        list.add(wordle.words[i]);
      }
      else {
        list.add(WordStatus(word: word, letterStatus: List<LetterStatus>.generate(Wordle.sizeWord, (index) => LetterStatus.nothing)));
      }
    }
    return list;
  }

  List<WordStatus> _updateWordInListWithLetters(Wordle wordle, List<WordleLetterStatus> wordleLetterStatus) {
    List<WordStatus> list = [];
    for(var i = 0; i < wordle.words.length; i++) {
      if (i != wordle.actual) {
        list.add(wordle.words[i]);
      }
      else {
        list.add(WordStatus(word: wordle.words[wordle.actual].word, letterStatus: _toDomain(wordleLetterStatus)));
      }
    }
    return list;
  }

  List<LetterStatus> _toDomain(List<WordleLetterStatus> wordleLetterStatus) {
    List<LetterStatus> letterStatus = [];
    for(var wordleLetterStatus in wordleLetterStatus) {
      letterStatus.add(letterStatusMap[wordleLetterStatus] ?? LetterStatus.nothing);
    }
    return letterStatus;
  }
}
