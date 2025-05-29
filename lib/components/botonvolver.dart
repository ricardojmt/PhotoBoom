import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photoboom/core/app_colores.dart';
import 'package:photoboom/screens/Feed/pb_feed.dart';
import 'package:photoboom/screens/Portafolio/pb_portafolio.dart';
import 'package:photoboom/screens/ajustes/pb_ajustes.dart';
import 'package:photoboom/screens/buscador/pb_buscador.dart';

class FlechaInicio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BotonVolver(
      alignment: Alignment.topLeft,
      icon: Icons.arrow_back,
      color: AppColores.fristtext,
    );
  }
}

class FeedBoton extends StatelessWidget {
  final VoidCallback onPressed;

  const FeedBoton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return BotonIcono(
      icon: Icons.remove_red_eye,
      color: AppColores.logotext,
      onPressed: onPressed,
    );
  }
}

class RetosBoton extends StatelessWidget {
  final VoidCallback onPressed;

  const RetosBoton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return BotonIcono(
      icon: Icons.fiber_new_rounded,
      color: AppColores.logotext,
      onPressed: onPressed,
    );
  }
}

class FotosBoton extends StatelessWidget {
  final VoidCallback onPressed;

  const FotosBoton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return BotonIcono(
      icon: Icons.camera_alt_rounded,
      color: AppColores.logotext,
      onPressed: onPressed,
    );
  }
}

class CorazonBoton extends StatelessWidget {
  final VoidCallback onPressed;

  const CorazonBoton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return BotonIcono(
      icon: Icons.favorite,
      color: AppColores.logotext,
      onPressed: onPressed,
    );
  }
}

class PerfilBoton extends StatelessWidget {
  final VoidCallback onPressed;

  const PerfilBoton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return BotonIcono(
      icon: Icons.person,
      color: AppColores.logotext,
      onPressed: onPressed,
    );
  }
}

class ConfiguracionesBoton extends StatelessWidget {
  final VoidCallback onPressed;

  const ConfiguracionesBoton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return BotonIcono(
      icon: Icons.build_circle_rounded,
      color: AppColores.logotext,
      onPressed: onPressed,
    );
  }
}

class BotonVolver extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String? cambio;
  final Alignment alignment;

  const BotonVolver({
    required this.icon,
    required this.color,
    this.cambio,
    this.alignment = Alignment.center,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: IconButton(
        icon: Icon(icon, color: color),
        onPressed: () {
          if (cambio != null) {
            Navigator.pushNamed(context, cambio!);
          } else {
            Navigator.pop(context);
          }
        },
      ),
    );
  }
}

class BotonIcono extends StatelessWidget {
  final IconData icon;
  final Color color;
  final VoidCallback onPressed;

  const BotonIcono({
    required this.icon,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: IconButton(
        icon: Icon(icon, color: color),
        onPressed: onPressed,
      ),
    );
  }
}
