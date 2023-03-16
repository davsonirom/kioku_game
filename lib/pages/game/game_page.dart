// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';

import 'package:kioku_game/Modo/modo.dart';
import 'package:kioku_game/desing/desing.dart';

import 'widgets/card_game.dart';

class GamePage extends StatelessWidget {
  const GamePage({
    Key? key,
    required this.modo,
    required this.nivel,
  }) : super(key: key);
  final Modo modo;
  final int nivel;

  getAxisCount() {
    if (nivel < 10) {
      return 2;
    } else if (nivel == 10 || nivel == 12 || nivel == 18) {
      return 3;
    } else {
      return 4;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(modo == Modo.normal
                    ? Icons.my_location
                    : Icons.touch_app_rounded),
                const SizedBox(width: 10),
                const Text('18', style: TextStyle(fontSize: 25)),
              ],
            ),
            const Text(
              'Kioku Game',
              style: TextStyle(color: Desing.corPrimaria),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'Sair',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: GridView.count(
          crossAxisCount: getAxisCount(),
          shrinkWrap: true,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
          padding: const EdgeInsets.all(24),
          children: List.generate(
            nivel,
            (index) => CardGame(
              modo: modo,
              opcao: Random().nextInt(33),
            ),
          ),
        ),
      ),
    );
  }
}
