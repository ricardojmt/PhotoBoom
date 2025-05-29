import 'package:flutter/material.dart';
import 'package:photoboom/components/botonvolver.dart';
import 'package:photoboom/components/datosgenerales.dart';
import 'package:photoboom/components/logo.dart';
import 'package:photoboom/components/textos.dart';
import 'package:photoboom/core/app_colores.dart';
import 'package:photoboom/components/Busqueda/barrabusqueda.dart';
import 'package:photoboom/components/imagenesorden.dart';

class PbBuscador extends StatelessWidget {
  static String id = "pb_buscador";
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
                ), // ← Clase reutilizable
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GaleriaImagenes(
                  imagePaths: [
                    'assets/img/imagen3.jpeg',
                    'assets/img/categoriasimg/imagen7.jpeg',
                    'assets/img/categoriasimg/imagen2.jpeg',
                  ],
                ),
              ),
            ),
            Row(
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
          ],
        ),
      ),
    );
  }
}
