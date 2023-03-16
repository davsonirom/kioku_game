// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:kioku_game/Modo/modo.dart';
import 'package:kioku_game/desing/desing.dart';
import 'package:kioku_game/pages/game/game_page.dart';

class CardNivel extends StatelessWidget {
  const CardNivel({
    Key? key,
    required this.modo,
    required this.nivel,
  }) : super(key: key);
  final Modo modo;
  final int nivel;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: const BorderRadius.all(Radius.circular(15)),
      child: InkWell(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) =>
                GamePage(modo: modo, nivel: nivel))),
        child: Ink(
          child: Container(
            width: 90,
            height: 90,
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              border: Border.all(
                color: modo == Modo.normal
                    ? Desing.corPrimaria
                    : Desing.corSecundaria,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(15),
              ),
              color: modo == Modo.normal
                  ? Desing.corPrimaria
                  : Desing.corSecundaria.withOpacity(.9),
            ),
            child: Center(
              child: Text(
                nivel.toString(),
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
