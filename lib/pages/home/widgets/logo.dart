import 'package:flutter/material.dart';
import 'package:kioku_game/desing/desing.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 25),
          child: Image.asset(
            'assets/logo.png',
            width: 200,
            height: 125,
          ),
        ),
        const Text(
          'Kioku Game',
          style: TextStyle(
            color: Colors.white,
            fontSize: 40,
          ),
        ),
        const Text(
          'Chibi Miku',
          style: TextStyle(
            color: Desing.corSecundaria,
            fontSize: 50,
          ),
        )
      ],
    );
  }
}
