// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:kioku_game/Modo/modo.dart';
import 'package:kioku_game/desing/desing.dart';
import 'package:kioku_game/repository/recordes_repository.dart';
import 'package:provider/provider.dart';

class RecordesPage extends StatelessWidget {
  const RecordesPage({
    Key? key,
    required this.modo,
  }) : super(key: key);
  final Modo modo;

  String getModo() {
    return modo == Modo.normal ? 'Normal' : 'Koekoe';
  }

  List<Widget> getReordesList(Map recordes) {
    final List<Widget> widgets = [];

    recordes.forEach((nivel, score) {
      widgets.add(ListTile(
        title: Text('Nível $nivel'),
        trailing: Text(score.toString()),
        tileColor: Desing.corTeriaria,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
      ));
      widgets.add(const Divider(
        color: Desing.corBack,
      ));
    });

    if (widgets.isEmpty) {
      widgets.add(const Center(
        child: Text('Sem recordes'),
      ));
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    final repository = Provider.of<RecordesRepository>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Recordes',
          style: TextStyle(color: Desing.corBack),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(12),
          child: Observer(
            builder: (context) => Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 20),
                  child: Center(
                    child: Text(
                      'Modo ${getModo()}',
                      style:
                          const TextStyle(fontSize: 28, color: Desing.corBack),
                    ),
                  ),
                ),
                ...getReordesList(modo == Modo.normal
                    ? repository.recordesNormal
                    : repository.recordesKoekoe),
              ],
            ),
          )),
    );
  }
}
