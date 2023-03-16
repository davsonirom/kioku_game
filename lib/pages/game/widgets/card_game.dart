// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:kioku_game/Modo/modo.dart';
import 'package:kioku_game/desing/desing.dart';

class CardGame extends StatefulWidget {
  const CardGame({
    Key? key,
    required this.modo,
    required this.opcao,
  }) : super(key: key);
  final Modo modo;
  final int opcao;

  @override
  State<CardGame> createState() => _CardGameState();
}

class _CardGameState extends State<CardGame> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: widget.modo == Modo.normal
              ? Desing.corBack
              : Desing.corSecundaria,
          width: 2,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: widget.modo == Modo.normal
              ? const AssetImage('assets/backgroudCarta.jpg')
              : const AssetImage('assets/backgroudCarta.jpg'),
        ),
      ),
    );
  }
}
