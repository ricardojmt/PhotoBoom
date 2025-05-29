import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; //importa firebase core
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:photoboom/screens/Retos/pb_retos.dart';
import 'firebase_options.dart'; //importa las opciones gráficas por firebase CLI
import 'package:photoboom/core/app_colores.dart';
import 'package:photoboom/screens/Feed/pb_feed.dart';
import 'package:photoboom/screens/Ajustes/pb_ajustes_notificaciones.dart';
import 'package:photoboom/screens/ajustes/pb_ajustes_centro_de_ayuda_y_soporte.dart';
import 'package:photoboom/screens/ajustes/pb_ajustes_cuenta.dart';
import 'package:photoboom/screens/ajustes/pb_ajustes_funciones_experimentales_o_beta.dart';
import 'package:photoboom/screens/ajustes/pb_ajustes_privacidad_y_seguridad.dart';
import 'package:photoboom/screens/ajustes/pb_ajustes_sesion.dart';
import 'package:photoboom/screens/Inicio/pb_correo_contrasena.dart';
import 'package:photoboom/screens/Feed/pb_feed.dart';
import 'package:photoboom/screens/Inicio/pb_inicio_sesion.dart';
import 'package:photoboom/screens/Inicio/pb_olvide_contrasena.dart';
import 'package:photoboom/screens/Inicio/pb_registrarse.dart';
import 'package:photoboom/screens/Portafolio/pb_portafolio.dart';
import 'package:photoboom/screens/ajustes/pb_ajustes.dart';
import 'package:photoboom/screens/buscador/imagenes/pb_imagenes_categorias.dart';
import 'package:photoboom/screens/buscador/imagenes/pb_imagenes_menu.dart';
import 'package:photoboom/screens/buscador/pb_buscador.dart';
import 'package:photoboom/screens/pb_camara.dart';

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
        PbPortafolio.id: (context) => PbPortafolio(),
        //Ajustes
        PbAjustes.id: (context) => PbAjustes(),
        PbAjustesCuenta.id: (context) => PbAjustesCuenta(),
        PbAjustesNotificaciones.id: (context) => PbAjustesNotificaciones(),
        PbAjustesPrivacidadYSeguridad.id: (context) =>
            PbAjustesPrivacidadYSeguridad(),
        PbAjustesCentroDeAyudaYSoporte.id: (context) =>
            PbAjustesCentroDeAyudaYSoporte(),
        PbAjustesFuncionesExperimentalesOBeta.id: (context) =>
            PbAjustesFuncionesExperimentalesOBeta(),
        PbAjustesSesion.id: (context) => PbAjustesSesion(),
        //Buscador
        PbBuscador.id: (context) => PbBuscador(),
        PbImagenesmenu.id: (context) => PbImagenesmenu(),
        PbImagenesCategorias.id: (context) => PbImagenesCategorias(),
        //Camara
        PbCamara.id: (context) => const PbCamara(),
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
