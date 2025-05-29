import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photoboom/core/app_colores.dart';
import 'package:photoboom/screens/Feed/pb_feed.dart';
import 'package:photoboom/screens/Portafolio/pb_portafolio.dart';
import 'package:photoboom/screens/ajustes/pb_ajustes.dart';
import 'package:photoboom/screens/buscador/pb_buscador.dart';
import 'package:photoboom/screens/pb_camara.dart';

class Flechainicio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Botonvolver(
      alignment: Alignment.topLeft,
      icon: Icons.arrow_back,
      color: AppColores.fristtext,
    );
  }
}

class Feed extends StatelessWidget {
  final VoidCallback onPressed;

  const Feed({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return BotonIcono(
      icon: Icons.remove_red_eye,
      color: AppColores.logotext,
      onPressed: onPressed,
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
    );
  }
}

class Retos extends StatelessWidget {
  final VoidCallback onPressed;

  const Retos({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return BotonIcono(
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
      icon: Icons.fiber_new_rounded,
      color: AppColores.logotext,
      cambio: '', // Reemplaza con la ruta deseada si existe
    );
  }
}

class Fotos extends StatelessWidget {
  final VoidCallback onPressed;

  const Fotos({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return BotonIcono(
      icon: Icons.camera_alt_rounded,
      color: AppColores.logotext,
      onPressed: onPressed,
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
    );
  }
}

class Corazon extends StatelessWidget {
  final VoidCallback onPressed;

  const Corazon({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return BotonIcono(
      icon: Icons.favorite,
      color: AppColores.logotext,
      onPressed: onPressed,
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
    );
  }
}

class Perfil extends StatelessWidget {
  final VoidCallback onPressed;

  const Perfil({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return BotonIcono(
      icon: Icons.person,
      color: AppColores.logotext,
      onPressed: onPressed,
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
    );
  }
}

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
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment ?? Alignment.center,
      child: IconButton(
        icon: Icon(icon, color: color),
        onPressed: () {
          if (cambio != null && cambio!.isNotEmpty) {
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
