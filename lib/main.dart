import 'package:flutter/material.dart';
import 'package:photoboom/core/app_colores.dart';
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
        PbFeed.id: (context) => PbFeed(),
        PbPortafolio.id: (context) => PbPortafolio(),
        //Ajustes
        PbAjustes.id: (context) => PbAjustes(),
        PbAjustesCuenta.id: (context) => PbAjustesCuenta(),
        PbAjustesNotificaciones.id: (context) => PbAjustesNotificaciones(),
        PbAjustesPrivacidadYSeguridad.id: (context) => PbAjustesPrivacidadYSeguridad(),
        PbAjustesCentroDeAyudaYSoporte.id: (context) => PbAjustesCentroDeAyudaYSoporte(),
        PbAjustesFuncionesExperimentalesOBeta.id: (context) => PbAjustesFuncionesExperimentalesOBeta(),
        PbAjustesSesion.id: (context) => PbAjustesSesion(),
        //Buscador
        PbBuscador.id: (context) => PbBuscador(),
        PbImagenesmenu.id: (context) => PbImagenesmenu(),
        PbImagenesCategorias.id: (context) => PbImagenesCategorias(),
        //Camara
        PbCamara.id: (context) => const PbCamara(),
      },
    );
  }
}
