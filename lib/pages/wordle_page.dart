import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordle_flutter/bloc/wordle_bloc.dart';
import 'package:wordle_flutter/widgets/keyboard_widget.dart';
import 'package:wordle_flutter/widgets/wordle_result_widget.dart';

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
        child: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const <Widget>[
                WordleResult(),
                KeyBoard()
              ],
            ),
          ),
        )
    );
  }
}
