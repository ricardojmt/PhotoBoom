import 'package:flutter/material.dart';
import 'package:photoboom/components/botonvolver.dart';
import 'package:photoboom/components/datosgenerales.dart';
import 'package:photoboom/components/logo.dart';
import 'package:photoboom/components/textos.dart';
import 'package:photoboom/core/app_colores.dart';
import 'package:photoboom/components/barrabusqueda.dart';
import 'package:photoboom/components/imagenesorden.dart';

class PbImagenesmenu extends StatelessWidget {
  static String id = "pb_imagenes_menu";

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
                const BarraBusqueda(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    imagenescategorias(),
                    imagenestendencia(),
                  ],
                ),
              ],
            ),
            Expanded(
              child: GaleriaImagenes(
                imagePaths: [
                  'assets/img/imagen4.jpeg',
                  'assets/img/imagen2.jpeg',
                  'assets/img/imagen3.jpeg',
                  'assets/img/imagen1.jpeg',
                  'assets/img/imagen6.jpeg',
                  'assets/img/imagen5.jpg',
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  feed(),
                  retos(),
                  fotos(),
                  corazon(),
                  perfil(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
