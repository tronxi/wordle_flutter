enum WordleStatus {
  pending, invalid, completed, lost
}
enum LetterStatus {
  nothing, fail, ordered, unordered
}

class WordStatus {
  final List<LetterStatus> letterStatus;
  final String word;
  const WordStatus({required this.word, required this.letterStatus});

  @override
  String toString() {
    return "Word: $word LetterStatus: $letterStatus";
  }
}

class Wordle {
  static const totalTries = 6;
  static const sizeWord = 5;

  final int actual;
  final List<WordStatus> words;
  final WordleStatus status;
  final bool shouldNotify;
  final Map<String, LetterStatus> keyStatus;

  const Wordle({required this.actual, required this.words, required this.status, this.shouldNotify = false, required this.keyStatus});

  bool isCompleteRound() {
    return words[actual].word.length == sizeWord;
  }

  bool isFinished() {
    return status == WordleStatus.completed || status == WordleStatus.lost;
  }

  static Map<String, LetterStatus> initialKeyStatus() {
    return {
      "A": LetterStatus.nothing,"B": LetterStatus.nothing,"C": LetterStatus.nothing,
      "D": LetterStatus.nothing,"E": LetterStatus.nothing,"F": LetterStatus.nothing,
      "G": LetterStatus.nothing,"H": LetterStatus.nothing,"I": LetterStatus.nothing,
      "J": LetterStatus.nothing,"K": LetterStatus.nothing,"L": LetterStatus.nothing,
      "M": LetterStatus.nothing,"N": LetterStatus.nothing,"Ñ": LetterStatus.nothing,
      "O": LetterStatus.nothing,"P": LetterStatus.nothing,"Q": LetterStatus.nothing,
      "R": LetterStatus.nothing,"S": LetterStatus.nothing,"T": LetterStatus.nothing,
      "U": LetterStatus.nothing,"V": LetterStatus.nothing,"W": LetterStatus.nothing,
      "X": LetterStatus.nothing,"Y": LetterStatus.nothing,"Z": LetterStatus.nothing,
    };
  }

  String get word => words[actual].word;

}
