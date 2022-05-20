class Wordle {
  final int actual;
  final String word;

  const Wordle({required this.actual, required this.word});

  bool isCompleteRound() {
    return word.length == 5;
  }

}
