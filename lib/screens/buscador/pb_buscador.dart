import 'package:flutter/material.dart';
import 'package:photoboom/components/botonvolver.dart';
import 'package:photoboom/components/datosgenerales.dart';
import 'package:photoboom/components/logo.dart';
import 'package:photoboom/components/textos.dart';
import 'package:photoboom/core/app_colores.dart';
import 'package:photoboom/components/barrabusqueda.dart';

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Logopequeno(),
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
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Textoco(),
                    Textola(),
                    SizedBox(height: 15.0),
                    Correo(),
                    SizedBox(height: 15.0),
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
