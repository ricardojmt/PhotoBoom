import 'package:flutter/widgets.dart';
import 'package:photoboom/core/app_colores.dart';
import 'package:flutter/material.dart';

class AppTipoText {
  static const TextStyle texto = TextStyle(
    color: Color(0xFF000000), // Color negro (puedes cambiarlo)
    fontSize: 20.0, // Tamaño del texto
    fontWeight: FontWeight.bold, // Texto en negrita
  );

  static const TextStyle textopequeno = TextStyle(
    color: AppColores.logotext, // Color negro (puedes cambiarlo)
    fontSize: 10.0, // Tamaño del texto
    fontWeight: FontWeight.bold, // Texto en negrita
  );

  static const TextStyle textoblanco = TextStyle(
    color: Color(0xFFFFFDFD), // Color negro (puedes cambiarlo)
    fontSize: 20.0, // Tamaño del texto
    fontWeight: FontWeight.bold, // Texto en negrita
  );

  static const TextStyle textos = TextStyle(
    color: Color(0xFF000000), // Color negro (puedes cambiarlo)
    fontSize: 10.0, // Tamaño del texto
  );

   // — Nuevos estilos para la sección de mensajería —
  static final TextStyle headline6 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColores.primary,
  );

  static final TextStyle bodyText2 = TextStyle(
    fontSize: 14,
    color: AppColores.primary,
  );

  static final TextStyle subtitle2 = TextStyle(
    fontSize: 12,
    color: AppColores.secondary.withOpacity(0.7),
  );

  static final TextStyle caption = TextStyle(
    fontSize: 12,
    color: AppColores.secondary.withOpacity(0.6),
  );
}


