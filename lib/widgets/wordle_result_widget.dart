import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordle_flutter/bloc/wordle_bloc.dart';
import 'package:wordle_flutter/widgets/square_result_widget.dart';

import '../models/wordle_model.dart';

class WordleResult extends StatefulWidget {
  const WordleResult({Key? key}) : super(key: key);

  @override
  State<WordleResult> createState() => _WordleResultState();
}

class _WordleResultState extends State<WordleResult> {
  @override
  Widget build(BuildContext context) {
    final wordleBloc = context.read<WordleBloc>();
    return BlocBuilder<WordleBloc, Wordle>(builder: (context, wordle) {
      if(wordle.shouldNotify && wordle.status == WordleStatus.invalid) {
        WidgetsBinding.instance.addPostFrameCallback((_) => _showSnackBar("La palabra no existe"));
        wordleBloc.add(NotifiedEvent());
      }
      return Results(wordle: wordle);
    }
    );
  }
  void _showSnackBar(String message) {
    var snackBar = SnackBar(
      backgroundColor: Colors.amber,
      behavior: SnackBarBehavior.floating,
      content: Text( message,
          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black)
      )
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

class Results extends StatelessWidget {
  final Wordle wordle;
  const Results({Key? key, required this.wordle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> rows = [];
    for(var i = 0; i < wordle.words.length; i++) {
      List<Widget> rowElements;
      if(wordle.actual < i) {
        rowElements = _emptyElementsRow();
      } else if(wordle.actual > i) {
        rowElements = _elementsForPreviousWord(i);
      }else {
        rowElements = _elementsForActualWord(i);
      }
      rows.add( Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: rowElements
      ));
    }
    return Column(
      children: rows,
    );
  }

  List<Widget> _emptyElementsRow() {
    return List<SquareResult>.generate(Wordle.sizeWord, (index) => const SquareResult(letterStatus: LetterStatus.nothing));
  }

  List<Widget> _elementsForActualWord(int actual) {
    List<Widget> row = [];
    for(var j = 0; j < Wordle.sizeWord; j++) {
      if(j < wordle.word.length){
        row.add(SquareResult(letter: wordle.words[actual].word[j], letterStatus: wordle.words[actual].letterStatus[j],));
      }else {
        row.add(const SquareResult(letterStatus: LetterStatus.nothing));
      }
    }
    return row;
  }

  List<Widget> _elementsForPreviousWord(int previous) {
    List<Widget> row = [];
    for(var j = 0; j < Wordle.sizeWord; j++) {
      row.add(SquareResult(letter: wordle.words[previous].word[j], letterStatus: wordle.words[previous].letterStatus[j]));
    }
    return row;
  }
}

