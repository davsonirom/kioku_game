import 'package:flutter/material.dart';
import 'package:kioku_game/desing/desing.dart';
import 'package:kioku_game/pages/home/widgets/botao.dart';
import 'package:kioku_game/pages/home/widgets/logo.dart';
import 'package:kioku_game/pages/home/widgets/recordes.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            //! logo
            const Logo(),
            //! botoes
            Botao(
              legenda: 'Modo Normal',
              cor: Colors.white,
              acao: () {},
            ),
            Botao(
              legenda: 'Modo Koekoe',
              cor: Desing.corSecundaria,
              acao: () {},
            ),

            //! recordes
            const Recordes(),
          ],
        ),
      ),
    );
  }
}
