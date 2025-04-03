import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photoboom/core/app_colores.dart';

class Usuario extends StatelessWidget{
  Widget build (BuildContext context){
    return DatosGenerales(
      labelText: "Usuario",
      hintText: "RicardoMT",
      icon: Icons.person,
      onChanged: (value){},
    );
  }
}

class Correo extends StatelessWidget{
  Widget build (BuildContext context){
    return DatosGenerales(
      labelText: "Correo",
      hintText: "Usuario@gmail.com",
      keyboardType: TextInputType.emailAddress,
      onChanged: (value){},
      icon: Icons.email_rounded,
    );
  }
}


class Contras extends StatelessWidget{
  Widget build (BuildContext context){
    return DatosGenerales(
      labelText: "Contraseña",
      onChanged: (value){},
      icon: Icons.lock_outline_rounded,
      obscureText: true,
    );
  }
}

class DatosGenerales extends StatelessWidget {
  final String labelText;
  final String? hintText;
  final Function (String) onChanged;
  final TextInputType? keyboardType;
  final IconData? icon;
  final bool obscureText;

  const DatosGenerales({
    required this.labelText,
    this.hintText,
    required this.onChanged,
    this.keyboardType,
    this.icon,
    this.obscureText=false,
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
