import 'package:flutter/material.dart';
import 'package:kioku_game/desing/desing.dart';

class Recordes extends StatelessWidget {
  const Recordes({Key? key}) : super(key: key);

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
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.chevron_right,
                ),
              ),
            ),
            ListTile(
              title: const Text(
                'Modo Koekoe',
                style: TextStyle(
                  color: Desing.corBack,
                ),
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.chevron_right,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
