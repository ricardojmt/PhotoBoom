import 'package:flutter/material.dart';
import 'package:photoboom/components/botonvolver.dart';
import 'package:photoboom/components/logo.dart';
import 'package:photoboom/core/app_colores.dart';
import 'package:photoboom/components/Busqueda/barrabusqueda.dart';
import 'package:photoboom/components/Busqueda/categorias.dart';

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
                      child: flechainicio(),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Logopequenoperfiles(),
                    ),
                  ],
                ),
                BarraBusqueda(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    perfileseleccionado(),
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
