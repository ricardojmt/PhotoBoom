import 'package:flutter/material.dart';
import 'package:photoboom/core/app_colores.dart';
import 'package:photoboom/screens/pb_correo_contrasena.dart';
import 'package:photoboom/screens/pb_inicio_sesion.dart';
import 'package:photoboom/screens/pb_olvide_contrasena.dart';
import 'package:photoboom/screens/pb_registrarse.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColores.backgrounds,
      ),
      initialRoute: PbInicioSesion.id,
      routes: {
        PbRegistrarse.id: (context) => PbRegistrarse(),
        PbInicioSesion.id: (context) => PbInicioSesion(),
        PbOlvideContrasena.id: (context) => PbOlvideContrasena(),
        PbCorreoContrasena.id: (context) => PbCorreoContrasena(),
      },
      
    );
  }
}
