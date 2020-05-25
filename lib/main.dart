import 'package:calculator/screens/first_page.dart';
import 'package:flutter/material.dart';

import 'screens/compras.dart';
import 'screens/inventario.dart';

import 'screens/peliculas.dart';

void main() => runApp(Calculator());

class Calculator extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => First_Page(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/inventario': (context) => Inventario(),
        '/compras': (context) => Compras(),
        '/peliculas': (context) => Peliculas(),
      },
    );
  }
}
