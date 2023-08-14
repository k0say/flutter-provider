import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_app/PageB.dart';
import 'package:flutter_app/state.dart';
import 'package:provider/provider.dart';

import 'PageA.dart';
import 'PageC.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TestState(),
      child: MaterialApp(
        title: 'Flutter App',
        darkTheme: ThemeData(
          colorSchemeSeed: Colors.blue,
          useMaterial3: true,
          brightness: Brightness.dark,
        ),
        scrollBehavior: const MaterialScrollBehavior().copyWith(
            dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch}),
        home: Scaffold(
          body: Stack(
            children: <Widget>[
              OffstageWidget(index: index, indexPage: 0, page: const PageA()),
              OffstageWidget(index: index, indexPage: 1, page: const PageB()),
              OffstageWidget(index: index, indexPage: 2, page: PageC()),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: index,
            onTap: (int index) {
              setState(() {
                this.index = index;
              });
            },
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
                activeIcon: Icon(
                  Icons.home,
                  color: Colors.blue,
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: "Search",
                activeIcon: Icon(
                  Icons.search,
                  color: Colors.blue,
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.accessible_sharp),
                label: "Mamt",
                activeIcon: Icon(
                  Icons.accessible_sharp,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class OffstageWidget extends StatelessWidget {
  const OffstageWidget(
      {super.key,
      required this.index,
      required this.indexPage,
      required this.page});

  final int indexPage;
  final int index;
  final Widget page;

  @override
  Widget build(BuildContext context) {
    return Offstage(
      offstage: index != indexPage,
      child: TickerMode(
        enabled: index == indexPage,
        child: MaterialApp(
          home: page,
          theme: ThemeData(
            colorSchemeSeed: Colors.indigo,
            useMaterial3: true,
            brightness: Brightness.dark,
          ),
        ),
      ),
    );
  }
}
