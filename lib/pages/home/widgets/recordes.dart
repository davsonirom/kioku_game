import 'package:flutter/material.dart';
import 'package:kioku_game/Modo/modo.dart';
import 'package:kioku_game/desing/desing.dart';
import 'package:kioku_game/pages/recordes/recordes_page.dart';

class Recordes extends StatefulWidget {
  const Recordes({Key? key}) : super(key: key);

  @override
  State<Recordes> createState() => _RecordesState();
}

class _RecordesState extends State<Recordes> {
  showRecordes(Modo modo) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => RecordesPage(modo: modo),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Desing.color.shade100,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Text(
              'Recordes',
              style: TextStyle(
                color: Desing.corBack,
                fontSize: 22,
              ),
            ),
            ListTile(
              title: const Text(
                'Modo Normal',
                style: TextStyle(
                  color: Desing.corBack,
                ),
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => showRecordes(Modo.normal),
            ),
            ListTile(
              title: const Text(
                'Modo Koekoe',
                style: TextStyle(
                  color: Desing.corBack,
                ),
              ),
              trailing: const Icon(
                Icons.chevron_right,
              ),
              onTap: () => showRecordes(Modo.koekoe),
            ),
          ],
        ),
      ),
    );
  }
}
