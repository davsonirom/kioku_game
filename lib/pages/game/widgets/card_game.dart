// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:math';

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

class _CardGameState extends State<CardGame>
    with SingleTickerProviderStateMixin {
  late final AnimationController animation;

  @override
  void initState() {
    super.initState();
    animation = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));
  }

  @override
  void dispose() {
    animation.dispose();
    super.dispose();
  }

  flipCard() {
    if (!animation.isAnimating) {
      animation.forward();
      Timer(const Duration(seconds: 2), () => animation.reverse());
    }
  }

  AssetImage getImage(double angulo) {
    if (angulo > 0.5 * pi) {
      return AssetImage('assets/cartas/carta-${widget.opcao}.png');
    } else {
      return widget.modo == Modo.normal
          ? const AssetImage('assets/backgroudCarta.jpg')
          : const AssetImage('assets/backgroudCarta.jpg');
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context, _) {
          //* para animacao
          final angulo = animation.value * pi;
          final transform = Matrix4.identity()
            ..setEntry(3, 2, 0.002)
            ..rotateY(angulo);

          return GestureDetector(
            onTap: () => flipCard(),
            child: Transform(
              transform: transform,
              alignment: Alignment.center,
              child: Container(
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
                    image: getImage(angulo),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
