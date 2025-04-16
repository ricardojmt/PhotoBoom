import 'package:flutter/material.dart';
import 'package:photoboom/components/botonconfirmacion.dart';
import 'package:photoboom/components/botonvolver.dart';
import 'package:photoboom/components/datosgenerales.dart';
import 'package:photoboom/components/logo.dart';
import 'package:photoboom/components/textos.dart';
import 'package:photoboom/core/app_colores.dart';

class PbPortafolio extends StatelessWidget {
  static String id = "pb_portafolio";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColores.backgrounds,
        body: Column(
          children: [
            Stack(
              children: [
                Logopequeno(),
                configuraciones(),
              ],
            ),
            Expanded(
              child: Column(
                  children: [
                    CircleAvatar(radius: 80,
                      backgroundImage:  AssetImage('assets/img/descargar.jpeg'),
                    )
                  ],
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
