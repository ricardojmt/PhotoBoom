import 'package:flutter/material.dart';
import 'package:photoboom/components/botonvolver.dart';
import 'package:photoboom/components/logo.dart';
import 'package:photoboom/core/app_colores.dart';
import 'package:photoboom/components/botonajustes.dart';

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
                    child: flechainicio(),
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
