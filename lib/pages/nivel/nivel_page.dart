// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:kioku_game/Modo/modo.dart';
import 'package:kioku_game/desing/desing.dart';
import 'package:kioku_game/pages/nivel/widgets/card_nivel.dart';

class NivelPage extends StatelessWidget {
  const NivelPage({
    Key? key,
    required this.modo,
  }) : super(key: key);
  final Modo modo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Nível do Jogo',
          style: TextStyle(
              color:
                  modo == Modo.normal ? Desing.corBack : Desing.corSecundaria),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: GridView.count(
          crossAxisCount: 3,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          padding: const EdgeInsets.all(24.0),
          children: [
            CardNivel(modo: modo, nivel: 6),
            CardNivel(modo: modo, nivel: 8),
            CardNivel(modo: modo, nivel: 10),
            CardNivel(modo: modo, nivel: 12),
            CardNivel(modo: modo, nivel: 16),
            CardNivel(modo: modo, nivel: 20),
            CardNivel(modo: modo, nivel: 24),
            CardNivel(modo: modo, nivel: 28),
            CardNivel(modo: modo, nivel: 30),
          ],
        ),
      ),
    );
  }
}
