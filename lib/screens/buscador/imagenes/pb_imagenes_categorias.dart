import 'package:flutter/material.dart';
import 'package:photoboom/components/botonvolver.dart';
import 'package:photoboom/components/datosgenerales.dart';
import 'package:photoboom/components/logo.dart';
import 'package:photoboom/components/textos.dart';
import 'package:photoboom/core/app_colores.dart';
import 'package:photoboom/components/barrabusqueda.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:photoboom/components/imagenesorden.dart';
import 'package:photoboom/components/categorias.dart';

class PbImagenesCategorias extends StatelessWidget {
  static String id = "pb_imagenes_categorias";
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
                      child: flechainicio(),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Logopequenoimagenes(),
                    ),
                  ],
                ),
                BarraBusqueda(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    imagenescategoriaseleccionada(),
                    imagenestendencia(),
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
    }),
    RetosBoton(onPressed: () {
      // Aquí puedes poner acción para retos
    }),
    FotosBoton(onPressed: () {
      // Acción para fotos
    }),
    CorazonBoton(onPressed: () {
      // Acción para favoritos
    }),
    PerfilBoton(onPressed: () {
      // Acción para perfil
    }),
  ],
),

          ],
        ),
      ),
    );
  }
}
