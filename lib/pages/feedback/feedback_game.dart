// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:kioku_game/controler/game_controller.dart';
import 'package:kioku_game/desing/desing.dart';
import 'package:kioku_game/pages/home/widgets/botao.dart';
import 'package:kioku_game/resultado/resultado.dart';
import 'package:provider/provider.dart';

class FeedbackGame extends StatelessWidget {
  const FeedbackGame({
    Key? key,
    required this.resultado,
  }) : super(key: key);
  final Resultado resultado;

  String getResultado() {
    return resultado == Resultado.aprovado ? 'aprovado' : 'eliminado';
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.read<GameController>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              resultado == Resultado.aprovado ? 'Hehhe' : 'Zanendesu ne',
              style: const TextStyle(fontSize: 30),
            ),
            Image.asset(resultado == Resultado.aprovado
                ? 'assets/proximoLevel.jpeg'
                : 'assets/repetirLevel.jfif'),
            Botao(
              legenda: resultado == Resultado.aprovado
                  ? 'Próximo nível'
                  : 'Tentar de novo',
              cor: resultado == Resultado.aprovado
                  ? Desing.corBack
                  : Desing.corSecundaria,
              acao: resultado == Resultado.aprovado
                  ? () => controller.nextLevel()
                  : () => controller.restarGame(),
            )
          ],
        ),
      ),
    );
  }
}
