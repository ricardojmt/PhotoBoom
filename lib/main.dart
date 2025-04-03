import 'package:flutter/material.dart';
import 'package:photoboom/core/app_colores.dart';
import 'package:photoboom/screens/pb_inicio_sesion.dart';
import 'package:photoboom/screens/pb_registrarse.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        //appBar: AppBar(title: Text("")),
        backgroundColor: AppColores.backgrounds,
        body: PbRegistrarse(),
      ),
    );
  }
}
