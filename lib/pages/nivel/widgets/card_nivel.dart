// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:kioku_game/Modo/modo.dart';
import 'package:kioku_game/controler/game_controller.dart';
import 'package:kioku_game/desing/desing.dart';
import 'package:kioku_game/model/game_play.dart';
import 'package:kioku_game/pages/game/game_page.dart';
import 'package:provider/provider.dart';

class CardNivel extends StatelessWidget {
  const CardNivel({
    Key? key,
    required this.gamePlay,
  }) : super(key: key);

  final GamePlay gamePlay;

  startGame(BuildContext context) {
    context.read<GameController>().startGame(gamePlay: gamePlay);
    Navigator.push(
        context,
        MaterialPageRoute(
          fullscreenDialog: true,
          builder: (BuildContext context) => GamePage(gamePlay: gamePlay),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: const BorderRadius.all(Radius.circular(15)),
      child: InkWell(
        onTap: () => startGame(context),
        child: Ink(
          child: Container(
            width: 90,
            height: 90,
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              border: Border.all(
                color: gamePlay.modo == Modo.normal
                    ? Desing.corPrimaria
                    : Desing.corSecundaria,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(15),
              ),
              color: gamePlay.modo == Modo.normal
                  ? Desing.corPrimaria
                  : Desing.corSecundaria.withOpacity(.9),
            ),
            child: Center(
              child: Text(
                gamePlay.nivel.toString(),
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
