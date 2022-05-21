import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class FinalWin extends StatelessWidget {
  final String description;
  const FinalWin({Key? key, required this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 80,
      decoration: const BoxDecoration(
          color: Color.fromRGBO(129, 223, 115, 1.0), borderRadius: BorderRadius.all(Radius.circular(5))
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:  <Widget>[
            const Text(
              "Has Ganado!!!",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.grey,
              child: IconButton(
                icon: const Icon(
                  Icons.share,
                  color: Colors.black,
                ),
                onPressed: _share
              ),
            ),
          ],
        )
      ),
    );
  }
  void _share() {
    Share.share(description);
  }
}

class FinalGameOver extends StatelessWidget {
  final String description;
  const FinalGameOver({Key? key, required this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 80,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(239, 111, 111, 1.0), borderRadius: BorderRadius.all(Radius.circular(5))
      ),
      child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:  <Widget>[
              const Text(
                "Has perdido!!!",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.grey,
                child: IconButton(
                    icon: const Icon(
                      Icons.share,
                      color: Colors.black,
                    ),
                    onPressed: _share
                ),
              ),
            ],
          )
      ),
    );
  }
  void _share() {
    Share.share(description);
  }
}
