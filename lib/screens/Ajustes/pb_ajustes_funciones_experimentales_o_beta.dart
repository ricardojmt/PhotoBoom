import 'package:flutter/material.dart';
import 'package:photoboom/components/botonvolver.dart';
import 'package:photoboom/components/logo.dart';
import 'package:photoboom/core/app_colores.dart';
import 'package:photoboom/components/botonajustes.dart';
import 'package:photoboom/screens/Feed/pb_feed.dart';
import 'package:photoboom/screens/Retos/pb_retos.dart';
import 'package:photoboom/screens/pb_camara.dart';
import 'package:photoboom/screens/buscador/pb_buscador.dart';
import 'package:photoboom/screens/Portafolio/pb_portafolio.dart';

class PbAjustesFuncionesExperimentalesOBeta extends StatelessWidget {
  static String id = "pb_ajustes_funciones_experimentales_o_beta";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColores.backgrounds,
        body: Column(
          children: [
            Stack(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: FlechaInicio(),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Logopequenoajustes(),
                ),
              ],
            ),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Accesoanticipado(),
                    Participarenelprogramabeta(),
                  ],
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FeedBoton(onPressed: () {
                  // Aquí puedes navegar a la pantalla Feed
                  Navigator.pushNamed(context, PbFeed.id);
                }),
                RetosBoton(onPressed: () {
                  // Aquí puedes poner acción para retos
                  Navigator.pushNamed(context, PbRetos.id);
                }),
                FotosBoton(onPressed: () {
                  Navigator.pushNamed(context, PbCamara.id);
                }),
                CorazonBoton(onPressed: () {
                  // Acción para favoritos
                  Navigator.pushNamed(context, PbBuscador.id);
                }),
                PerfilBoton(onPressed: () {
                  // Acción para perfil
                  Navigator.pushNamed(context, PbPortafolio.id);
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
