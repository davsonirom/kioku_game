import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:kioku_game/controler/game_controller.dart';
import 'package:kioku_game/model/game_opacao.dart';
import 'package:kioku_game/model/game_play.dart';
import 'package:kioku_game/pages/feedback/feedback_game.dart';
import 'package:kioku_game/pages/game/widgets/game_score.dart';
import 'package:kioku_game/resultado/resultado.dart';
import 'package:kioku_game/settings/game_settigs.dart';
import 'package:provider/provider.dart';

import 'widgets/card_game.dart';

class GamePage extends StatelessWidget {
  const GamePage({Key? key, required this.gamePlay}) : super(key: key);
  final GamePlay gamePlay;

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<GameController>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: GameScore(modo: gamePlay.modo),
      ),
      body: Observer(
        builder: (_) {
          if (controller.venceu) {
            return const FeedbackGame(resultado: Resultado.aprovado);
          } else if (controller.perdeu) {
            return const FeedbackGame(resultado: Resultado.reprovado);
          } else {
            return Center(
              child: GridView.count(
                crossAxisCount: GameSettigs.gameBoardAxisCount(gamePlay.nivel),
                shrinkWrap: true,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
                padding: const EdgeInsets.all(24),
                children: controller.gameCards
                    .map((GameOpacao go) => CardGame(
                          modo: gamePlay.modo,
                          gameOpacao: go,
                        ))
                    .toList(),
              ),
            );
          }
        },
      ),
    );
  }
}
