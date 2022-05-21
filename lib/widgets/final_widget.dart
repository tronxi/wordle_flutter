import 'package:flutter/material.dart';

class FinalWin extends StatelessWidget {
  const FinalWin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 80,
      decoration: const BoxDecoration(
          color: Color.fromRGBO(42, 244, 13, 1.0), borderRadius: BorderRadius.all(Radius.circular(5))
      ),
      child: const Center(
        child: Text(
          "Has Ganado!!!",
          style: TextStyle(
              fontSize: 30,
          ),
      )
      ),
    );
  }
}

class FinalGameOver extends StatelessWidget {
  const FinalGameOver({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 80,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(220, 31, 31, 1.0), borderRadius: BorderRadius.all(Radius.circular(5))
      ),
      child: const Center(
        child: Text(
          "Has perdido!",
          style: TextStyle(
              fontSize: 30,
          ),
        )
      ),
    );
  }
}
