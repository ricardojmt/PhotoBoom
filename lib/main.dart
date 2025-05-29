import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; //importa firebase core
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:photoboom/screens/Retos/pb_retos.dart';
import 'firebase_options.dart'; //importa las opciones gráficas por firebase CLI
import 'package:photoboom/core/app_colores.dart';
import 'package:photoboom/screens/pb_correo_contrasena.dart';
import 'package:photoboom/screens/pb_feed.dart';
import 'package:photoboom/screens/pb_inicio_sesion.dart';
import 'package:photoboom/screens/pb_olvide_contrasena.dart';
import 'package:photoboom/screens/pb_registrarse.dart';
import 'package:photoboom/screens/pb_interfaz_feed.dart';

void main() async {
  //Asegura que los bindings de Flutter estén inicializados
  WidgetsFlutterBinding.ensureInitialized;

  //Inicializa Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        PbFeed.id: (context) => PbFeed(),
        PbRetos.id: (context) => PbRetos(),
      },
      //~ Ruta inicial a la pantalla de inicio de sesión
      //initialRoute: '/inicio-sesion',
      //routes: {
      //'/inicio-sesion': (context) => PbInicioSesion(),
      //'/registrarse': (context) => PbRegistrarse(),
      //'/olvide-contrasena': (context) => PbOlvideContrasena(),
      //'/correo-contrasena': (context) => PbCorreoContrasena(),
      //'/Feed': (context) => Feed(),
      //},//*
    );
  }
}

// ===================== 1. Pantalla de Inicio de Sesión =====================

//class PbInicioSesion extends StatelessWidget {
  //static const String id = '/inicio-sesion'; // Ruta estática para navegación
  //const PbInicioSesion({super.key});

  //@override
  //Widget build(BuildContext context) {
   // return Scaffold(
      //appBar: AppBar(
       // title: const Text('Inicio de Sesión'),
      //),
      //body: const Center(
        //child: Text('Pantalla de Inicio de Sesión'),
     // ),
   // );
  //}
//}

// ===================== 2. Pantalla de Registro =====================

//class PbRegistrarse extends StatelessWidget {
 // static const String id = '/registrarse'; // Ruta estática para navegación
  //const PbRegistrarse({super.key});

  //@override
  //idget build(BuildContext context) {
   // return Scaffold(
    //  appBar: AppBar(
      //  title: const Text('Registrarse'),
      //),
     // body: const Center(
      //  child: Text('Pantalla de Registro'),
     // ),
   // );
  //}
//}

// ===================== 3. Pantalla Olvidé la Contraseña =====================

//class PbOlvideContrasena extends StatelessWidget {
  //static const String id = '/olvideContrasena'; // Ruta estática para navegación
  //const PbOlvideContrasena({super.key});

  //@override
  //Widget build(BuildContext context) {
    //return Scaffold(
      //appBar: AppBar(
       // title: const Text('Olvidé la Contraseña'),
      //),
      //body: const Center(
       // child: Text('Pantalla para recuperar la contraseña'),
      //),
    //);
  //}
//}

// ===================== 4. Pantalla Correo y Contraseña =====================

//class PbCorreoContrasena extends StatelessWidget {
 // static const String id = '/correoContrasena'; // Ruta estática para navegación
 // const PbCorreoContrasena({super.key});

 // @override
 // Widget build(BuildContext context) {
   // return Scaffold(
    //  appBar: AppBar(
     //   title: const Text('Correo y Contraseña'),
    //  ),
     // body: const Center(
      //  child: Text('Pantalla para introducir el correo y nueva contraseña'),
    //  ),
  //  );
 // }
//}

// ===================== 5. Pantalla Feed =====================

//class Feed extends StatelessWidget {
 // static const String id = '/Feed'; // Ruta estática para navegación
  //const Feed({super.key});

 // @override
 // Widget build(BuildContext context) {
  //  return Scaffold(
   //   appBar: AppBar(
    //    title: const Text('Feed'),
     // ),
     // body: const Center(
     //   child: Text('Contenido del Feed'),
     //,
    //);
 // }
//}
