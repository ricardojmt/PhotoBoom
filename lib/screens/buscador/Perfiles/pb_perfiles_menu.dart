import 'package:flutter/material.dart';
import 'package:photoboom/components/botonvolver.dart';
import 'package:photoboom/components/logo.dart';
import 'package:photoboom/core/app_colores.dart';
import 'package:photoboom/components/barrabusqueda.dart';
import 'package:photoboom/components/categorias.dart';
import 'package:photoboom/screens/Feed/pb_feed.dart';
import 'package:photoboom/screens/Retos/pb_retos.dart';
import 'package:photoboom/screens/pb_camara.dart';
import 'package:photoboom/screens/buscador/pb_buscador.dart';
import 'package:photoboom/screens/Portafolio/pb_portafolio.dart';

class PbPerfilesmenu extends StatelessWidget {
  static String id = "pb_perfiles_menu";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColores.backgrounds,
        body: Column(
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: FlechaInicio(),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Logopequeno(),
                    ),
                  ],
                ),
                BarraBusqueda(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    busquedaperfiles(),
                    busquedaimagenes(),
                  ],
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SingleChildScrollView(
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      Arquitectura(),
                      ArteyCreatividad(),
                      Naturaleza(),
                      Viajes(),
                      Personas(),
                      ComidayBebida(),
                      Animalesdomesticos(),
                      Fotografianocturna(),
                    ],
                  ),
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
