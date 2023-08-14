import 'package:flutter/material.dart';
import 'package:flutter_app/state.dart';
import 'package:provider/provider.dart';

import 'PageA.dart';

class PageC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PAGE C"),
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Text("${context.watch<TestState>().ilTesto}"),
            ElevatedButton(
              child: const Text("CHANGE STATE PLEASE"),
              onPressed: () => {
                Provider.of<TestState>(context, listen: false)
                    .setNewState("E DAJEEE"),
              },
            ),
            ElevatedButton(
              child: const Text("Page A"),
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (MaterialAppContext) => const PageA()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
