import 'package:flutter/material.dart';
import 'package:flutter_app/state.dart';
import 'package:provider/provider.dart';

import 'PageC.dart';
import 'logic.dart';

class PageB extends StatelessWidget {
  const PageB({super.key});

  @override
  Widget build(BuildContext context) {
    var testo = context.watch<TestState>().ilTesto;
    dynamic receiver;
    // receiver = testo is Post ? Post.fromJson(testo) : testo;
    receiver = testo;

    return Consumer<TestState>(builder: (context, value, child) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("PAGE B"),
        ),
        body: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              !(receiver is Post) //? Text("SI") : Text("NO"),
                  ? Center(
                      child: Text(receiver),
                    )
                  : Card(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            leading: Icon(Icons.album),
                            title: Text(receiver.title!),
                            subtitle: Text(receiver.body!),
                          ),
                        ],
                      ),
                    ),
              // Text("${context.watch<TestState>().ilTesto}"),
              ElevatedButton(
                child: const Text("CHANGE STATE PLEASE"),
                onPressed: () => {
                  Provider.of<TestState>(context, listen: false)
                      .setNewState("E DAJEEE"),
                },
              ),
              ElevatedButton(
                child: const Text("Page C"),
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (MaterialAppContext) => PageC()),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Provider.of<TestState>(context, listen: false).setNewState("SORD");
          },
          child: const Icon(Icons.accessibility_new),
        ),
      );
    });
  }
}
