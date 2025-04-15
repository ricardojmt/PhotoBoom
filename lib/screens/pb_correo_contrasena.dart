import 'package:flutter/material.dart';
import 'package:photoboom/components/botonconfirmacion.dart';
import 'package:photoboom/components/logo.dart';
import 'package:photoboom/components/textos.dart';
import 'package:photoboom/core/app_colores.dart';

class PbCorreoContrasena extends StatelessWidget {
  static String id = "pb_correo_contraseña";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColores.backgrounds,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Logogrande(),
                    SizedBox(
                      height: 10.0,
                    ),
                    Textoconfirmacioncorreo(),
                    SizedBox(
                      height: 15.0,
                    ),
                    iniciosesion(),
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
