import 'package:flutter/material.dart';
import 'package:kioku_game/controler/game_controller.dart';
import 'package:kioku_game/desing/desing.dart';
import 'package:kioku_game/pages/home/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [Provider<GameController>(create: (_) => GameController())],
    child: const MiaSoftware39(),
  ));
}

class MiaSoftware39 extends StatelessWidget {
  const MiaSoftware39({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kioku Game',
      theme: Desing.tema,
      home: const Home(),
    );
  }
}
