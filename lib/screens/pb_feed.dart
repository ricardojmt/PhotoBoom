import 'package:flutter/material.dart';
import 'package:photoboom/components/botonconfirmacion.dart';
import 'package:photoboom/components/botonvolver.dart';
import 'package:photoboom/components/datosgenerales.dart';
import 'package:photoboom/components/logo.dart';
import 'package:photoboom/components/textos.dart';
import 'package:photoboom/core/app_colores.dart';

class PbFeed extends StatelessWidget {
  static String id = "pb_feed";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColores.backgrounds,
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                flechainicio(),
                Logopequeno(),
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
