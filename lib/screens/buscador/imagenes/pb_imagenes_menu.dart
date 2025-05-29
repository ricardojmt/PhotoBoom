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
<<<<<<< HEAD
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

=======
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
>>>>>>> 65fe3735bfeeaff7eb95da1e5de51afcba15ca13
          ],
        ),
      ),
    );
  }
}
