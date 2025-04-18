import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photoboom/core/app_colores.dart';

class Flechainicio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Botonvolver(
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

class Botonvolver extends StatelessWidget {
  final IconData icon;
  final Color color;

  const Botonvolver({required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon, color: color),
      onPressed: () {
        Navigator.pop(context);
      },
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
      alignment: Alignment.bottomCenter, // Puedes cambiar esto según necesidad
      child: IconButton(
        icon: Icon(icon, color: color),
        onPressed: onPressed,
      ),
    );
  }
}
