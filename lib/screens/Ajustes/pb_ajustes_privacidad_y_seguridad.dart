import 'package:flutter/material.dart';
import 'package:photoboom/components/botonvolver.dart';
import 'package:photoboom/components/logo.dart';
import 'package:photoboom/core/app_colores.dart';
import 'package:photoboom/components/botonajustes.dart';

class PbAjustesPrivacidadYSeguridad extends StatelessWidget {
  static String id = "pb_ajustes_privacidad_y_seguridad";
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
                    Reportarunproblema(),
                    Contactarsoporte(),
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
