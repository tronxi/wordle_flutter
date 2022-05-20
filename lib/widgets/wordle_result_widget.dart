import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordle_flutter/bloc/wordle_bloc.dart';
import 'package:wordle_flutter/widgets/square_result_widget.dart';

import '../bloc/models/wordle_model.dart';

class WordleResult extends StatelessWidget {
  const WordleResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WordleBloc, Wordle>(builder: (context, wordle) {
      print("Word: ${wordle.word}");
      return Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              SquareResult(letter: "A",), SquareResult(), SquareResult(), SquareResult(), SquareResult()
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              SquareResult(), SquareResult(), SquareResult(), SquareResult(), SquareResult()
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              SquareResult(), SquareResult(), SquareResult(), SquareResult(), SquareResult()
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              SquareResult(), SquareResult(), SquareResult(), SquareResult(), SquareResult()
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              SquareResult(), SquareResult(), SquareResult(), SquareResult(), SquareResult()
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              SquareResult(), SquareResult(), SquareResult(), SquareResult(), SquareResult()
            ],
          )
        ],
      );
    }
    );
  }
}
