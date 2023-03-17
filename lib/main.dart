import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:kioku_game/controler/game_controller.dart';
import 'package:kioku_game/desing/desing.dart';
import 'package:kioku_game/pages/home/home.dart';
import 'package:kioku_game/repository/recordes_repository.dart';
import 'package:provider/provider.dart';

void main() async {
  await Hive.initFlutter();
  runApp(MultiProvider(
    providers: [
      Provider<RecordesRepository>(create: (_) => RecordesRepository()),
      ProxyProvider<RecordesRepository, GameController>(
          update: (_, repo, __) => GameController(recordesRepository: repo)),
    ],
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
