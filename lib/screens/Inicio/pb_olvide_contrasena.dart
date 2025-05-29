import 'package:flutter/material.dart';
import 'package:photoboom/components/botonconfirmacion.dart';
import 'package:photoboom/components/botonvolver.dart';
import 'package:photoboom/components/datosgenerales.dart';
import 'package:photoboom/components/logo.dart';
import 'package:photoboom/components/textos.dart';
import 'package:photoboom/core/app_colores.dart';

class PbOlvideContrasena extends StatelessWidget {
  static String id = "pb_olvide_contraseña";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColores.backgrounds,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Botonvolver(),
            Logopequeno(),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Logogrande(),
                    Textoco(),
                    Textola(),
                    SizedBox(height: 15.0),
                    Correo(),
                    SizedBox(height: 15.0),
                    enviaromc(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
