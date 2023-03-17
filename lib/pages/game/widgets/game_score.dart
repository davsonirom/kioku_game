// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kioku_game/controler/game_controller.dart';

import 'package:kioku_game/desing/desing.dart';
import 'package:provider/provider.dart';

import '../../../Modo/modo.dart';

class GameScore extends StatelessWidget {
  const GameScore({
    Key? key,
    required this.modo,
  }) : super(key: key);
  final Modo modo;

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<GameController>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(modo == Modo.normal
                ? Icons.my_location
                : Icons.touch_app_rounded),
            const SizedBox(width: 10),
            Observer(
                builder: (_) => Text(controller.score.toString(),
                    style: const TextStyle(fontSize: 25))),
          ],
        ),
        const Text(
          'Kioku Game',
          style: TextStyle(color: Desing.corPrimaria),
        ),
        TextButton(
          onPressed: () {
            controller.restarGame();
            return Navigator.pop(context);
          },
          child: const Text(
            'Sair',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }
}
