// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:kioku_game/desing/desing.dart';

class Botao extends StatelessWidget {
  const Botao({
    Key? key,
    required this.legenda,
    required this.cor,
    required this.acao,
  }) : super(key: key);
  final String legenda;
  final Color cor;
  final Function acao;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: OutlinedButton(
        onPressed: () => acao(),
        style: Desing.outlineButtomStyle(cor: cor),
        child: Center(
          child: Text(
            legenda,
            style: TextStyle(fontSize: 20, color: cor),
          ),
        ),
      ),
    );
  }
}
