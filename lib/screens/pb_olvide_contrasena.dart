import 'package:flutter/material.dart';
import 'package:photoboom/components/botonconfirmacion.dart';
import 'package:photoboom/components/botonvolver.dart';
import 'package:photoboom/components/datosgenerales.dart';
import 'package:photoboom/components/logo.dart';
import 'package:photoboom/components/textos.dart';
import 'package:photoboom/core/app_colores.dart';
import 'package:photoboom/core/app_lineas_decoracion.dart';

class PbOlvideContrasena extends StatelessWidget {
  static const String id = "/olvide-contraseña";
   @override
Widget build(BuildContext context) {
  return SafeArea(
    child: Scaffold(
      backgroundColor: AppColores.backgrounds,
      body: Lineas(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            flechainicio(),
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
    ),
  );
}
}