// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:kioku_game/Modo/modo.dart';
import 'package:kioku_game/desing/desing.dart';

class RecordesPage extends StatelessWidget {
  RecordesPage({
    Key? key,
    required this.modo,
  }) : super(key: key);
  final Modo modo;
  final List<String> recordes = ['Modo', 'Nível 8', 'Nível 10', 'Nível 12'];

  String getModo() {
    return modo == Modo.normal ? 'Normal' : 'Koekoe';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Recordes',
          style: TextStyle(color: Desing.corBack),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return index == 0
                  ? Padding(
                      padding: const EdgeInsets.only(top: 36, bottom: 24),
                      child: Center(
                        child: Text('Modo ${getModo()}',
                            style: const TextStyle(
                              fontSize: 28,
                              color: Desing.corSecundaria,
                            )),
                      ),
                    )
                  : ListTile(
                      title: Text(recordes[index]),
                      trailing: const Text('X jopgadas'),
                      textColor: Desing.color[500],
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                    );
            },
            separatorBuilder: (_, __) => const Divider(
                  color: Desing.corBack,
                ),
            itemCount: recordes.length),
      ),
    );
  }
}
