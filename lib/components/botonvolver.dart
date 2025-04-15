import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photoboom/core/app_colores.dart';
import 'package:photoboom/screens/Feed/pb_feed.dart';
import 'package:photoboom/screens/Inicio/pb_olvide_contrasena.dart';
import 'package:photoboom/screens/Inicio/pb_registrarse.dart';
import 'package:photoboom/screens/Inicio/pb_correo_contrasena.dart';
import 'package:photoboom/screens/Portafolio/pb_portafolio.dart';

class flechainicio extends StatelessWidget {
  Widget build(BuildContext context) {
    return Botonvolver(
      icon: Icons.arrow_back,
      color: AppColores.fristtext,
    );
  }
}

class feed extends StatelessWidget {
  Widget build(BuildContext context) {
    return Botonvolver(
      icon: Icons.remove_red_eye,
      color: AppColores.logotext,
      cambio: PbFeed.id,
    );
  }
}

class retos extends StatelessWidget {
  Widget build(BuildContext context) {
    return Botonvolver(
      icon: Icons.fiber_new_rounded,
      color: AppColores.logotext,
    );
  }
}

class fotos extends StatelessWidget {
  Widget build(BuildContext context) {
    return Botonvolver(
      icon: Icons.camera_alt_rounded,
      color: AppColores.logotext,
    );
  }
}

class corazon extends StatelessWidget {
  Widget build(BuildContext context) {
    return Botonvolver(
      icon: Icons.heart_broken_sharp,
      color: AppColores.logotext,
    );
  }
}

class perfil extends StatelessWidget {
  Widget build(BuildContext context) {
    return Botonvolver(
      icon: Icons.person,
      color: AppColores.logotext,
      cambio: PbPortafolio.id,
    );
  }
}

class configuraciones extends StatelessWidget {
  Widget build(BuildContext context) {
    return Botonvolver(
      alignment: Alignment.topRight,
      icon: Icons.build_circle_rounded,
      color: AppColores.logotext,
      cambio: PbPortafolio.id,
    );
  }
}

class Botonvolver extends StatelessWidget {
  final IconData? icon;
  final Color? color;
  final String? cambio;
  final Alignment? alignment;

  const Botonvolver({
    this.icon,
    this.color,
    this.cambio,
    this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment ?? Alignment.center,
      child: IconButton(
        icon: Icon(icon, color: color),
        onPressed: () {
          if (cambio != null) {
            Navigator.pushNamed(context, cambio!);
          } else {
            Navigator.pop(context);
          }
        }
      ),
    );
  }
}
