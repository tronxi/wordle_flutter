import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordle_flutter/bloc/wordle_bloc.dart';
import 'package:wordle_flutter/widgets/final_widget.dart';
import 'package:wordle_flutter/widgets/keyboard_widget.dart';
import 'package:wordle_flutter/widgets/wordle_result_widget.dart';

import '../models/wordle_model.dart';

class WordlePage extends StatelessWidget {
  const WordlePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<WordleBloc>(
            create: (BuildContext context) => WordleBloc()
          )
        ],
        child: const Scaffold(
          body: Center(
            child: WordlePageBody(),
          ),
        )
    );
  }
}

class WordlePageBody extends StatelessWidget {
  const WordlePageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WordleBloc, Wordle>(builder: (context, wordle) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:  <Widget>[
          const WordleResult(),
          if (!wordle.isFinished()) const KeyBoard(),
          if (wordle.status == WordleStatus.completed) const FinalWin(),
          if (wordle.status == WordleStatus.lost) const FinalGameOver()
        ],
      );
    });
  }
}

