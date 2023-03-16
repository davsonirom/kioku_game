import 'package:flutter/material.dart';
import 'package:kioku_game/Modo/modo.dart';
import 'package:kioku_game/desing/desing.dart';
import 'package:kioku_game/pages/home/widgets/botao.dart';
import 'package:kioku_game/pages/home/widgets/logo.dart';
import 'package:kioku_game/pages/home/widgets/recordes.dart';
import 'package:kioku_game/pages/nivel/nivel_page.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //! logo
              const Logo(),
              //! botoes
              Botao(
                  legenda: 'Modo Normal',
                  cor: Colors.white,
                  acao: () {
                    return Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const NivelPage(modo: Modo.normal)));
                  }),
              Botao(
                legenda: 'Modo Koekoe',
                cor: Desing.corSecundaria,
                acao: () {
                  return Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) =>
                          const NivelPage(modo: Modo.koekoe)));
                },
              ),

              //! recordes
              const Recordes(),
            ],
          ),
        ),
      ),
    );
  }
}
