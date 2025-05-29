import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photoboom/screens/pb_inicio_sesion.dart';
import 'package:photoboom/core/app_colores.dart';

class Nombre extends StatelessWidget {
  final TextEditingController? controller;
  Nombre({this.controller});
  Widget build(BuildContext context) {
    return DatosGenerales(
      labelText: "Nombre completo",
      hintText: "Jerson Ricardo Murillo Tellez",
      onChanged: (value) {},
      icon: Icons.person,
      controller: controller,
    );
  }
}

class Usuario extends StatelessWidget {
  final TextEditingController? controller;
  Usuario({this.controller});
  Widget build(BuildContext context) {
    return DatosGenerales(
      labelText: "Usuario",
      hintText: "RicardoMT",
      icon: Icons.person,
      controller: controller,
      onChanged: (value) {},
    );
  }
}

class Correo extends StatelessWidget {
  final TextEditingController? controller; //nuevo parametro
  Correo({this.controller});

  @override
  Widget build(BuildContext context) {
    return DatosGenerales(
      labelText: "Correo",
      hintText: "Usuario@gmail.com",
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) {},
      controller: controller,
      icon: Icons.email_rounded,
    );
  }
}

class Contras extends StatelessWidget {
  final TextEditingController? controller; //nuevo parametro
  Contras({this.controller});
  @override
  Widget build(BuildContext context) {
    return DatosGenerales(
      labelText: "Contraseña",
      onChanged: (value) {},
      icon: Icons.lock_outline_rounded,
      controller: controller,
      obscureText: true,
    );
  }
}

class Correorecuperacion extends StatelessWidget {
  Widget build(BuildContext context) {
    return DatosGenerales(
      labelText: "Correo de recuperacion",
      hintText: "Usuario@example.com",
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) {},
      icon: Icons.email_rounded,
    );
  }
}

class DatosGenerales extends StatelessWidget {
  final String labelText;
  final String? hintText;
  final Function(String) onChanged;
  final TextInputType? keyboardType;
  final IconData? icon;
  final bool obscureText;
  final TextEditingController? controller; //nuevo parametro

  const DatosGenerales({
    required this.labelText,
    this.hintText,
    required this.onChanged,
    this.keyboardType,
    this.icon,
    this.obscureText = false,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 30.0,
      ),
      decoration: BoxDecoration(
        color: AppColores.backgroundsComponent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          labelText: labelText,
          hintText: hintText,
        ),
        onChanged: onChanged,
      ),
    );
  }
}
