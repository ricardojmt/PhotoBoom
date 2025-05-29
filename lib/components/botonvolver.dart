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
<<<<<<< HEAD
=======
    );
  }
}

class FeedAtajo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Botonvolver(
      icon: Icons.remove_red_eye,
      color: AppColores.logotext,
      cambio: PbFeed.id,
>>>>>>> 65fe3735bfeeaff7eb95da1e5de51afcba15ca13
    );
  }
}

class RetosBoton extends StatelessWidget {
  final VoidCallback onPressed;

<<<<<<< HEAD
  const RetosBoton({required this.onPressed});
=======
  const Retos({required this.onPressed});
>>>>>>> 65fe3735bfeeaff7eb95da1e5de51afcba15ca13

  @override
  Widget build(BuildContext context) {
    return BotonIcono(
<<<<<<< HEAD
=======
      icon: Icons.fiber_new_rounded,
      color: AppColores.logotext,
      onPressed: onPressed,
    );
  }
}

class RetosAtajo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Botonvolver(
>>>>>>> 65fe3735bfeeaff7eb95da1e5de51afcba15ca13
      icon: Icons.fiber_new_rounded,
      color: AppColores.logotext,
      cambio: '', // Reemplaza con la ruta deseada si existe
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
<<<<<<< HEAD
=======
    );
  }
}

class FotosAtajo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Botonvolver(
      icon: Icons.camera_alt_rounded,
      color: AppColores.logotext,
      cambio: PbCamara.id,
>>>>>>> 65fe3735bfeeaff7eb95da1e5de51afcba15ca13
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
<<<<<<< HEAD
=======
    );
  }
}

class CorazonAtajo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Botonvolver(
      icon: Icons.heart_broken_sharp,
      color: AppColores.logotext,
      cambio: PbBuscador.id,
>>>>>>> 65fe3735bfeeaff7eb95da1e5de51afcba15ca13
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
<<<<<<< HEAD
=======
    );
  }
}

class PerfilAtajo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Botonvolver(
      icon: Icons.person,
      color: AppColores.logotext,
      cambio: PbPortafolio.id,
>>>>>>> 65fe3735bfeeaff7eb95da1e5de51afcba15ca13
    );
  }
}

<<<<<<< HEAD
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
=======
class Configuraciones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Botonvolver(
      alignment: Alignment.topRight,
      icon: Icons.build_circle_rounded,
      color: AppColores.logotext,
      cambio: PbAjustes.id,
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
>>>>>>> 65fe3735bfeeaff7eb95da1e5de51afcba15ca13
  });

  @override
  Widget build(BuildContext context) {
    return Align(
<<<<<<< HEAD
      alignment: alignment,
      child: IconButton(
        icon: Icon(icon, color: color),
        onPressed: () {
          if (cambio != null) {
=======
      alignment: alignment ?? Alignment.center,
      child: IconButton(
        icon: Icon(icon, color: color),
        onPressed: () {
          if (cambio != null && cambio!.isNotEmpty) {
>>>>>>> 65fe3735bfeeaff7eb95da1e5de51afcba15ca13
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
