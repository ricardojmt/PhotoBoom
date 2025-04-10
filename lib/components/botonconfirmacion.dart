import 'package:flutter/material.dart';
import 'package:photoboom/core/app_colores.dart';
import 'package:photoboom/core/app_tipo_text.dart';
import 'package:photoboom/screens/pb_correo_contrasena.dart';
import 'package:photoboom/screens/pb_inicio_sesion.dart';

class Registrarme extends StatelessWidget{
  Widget build (BuildContext context){
    return Confirmacion(
      textot: "Registarme",
      onPressed: () {
        Navigator.pushNamed(context, PbInicioSesion.id);
      },
    );
  }
}

class Iniciar extends StatelessWidget{
  Widget build (BuildContext context){
    return Confirmacion(
      textot: "Iniciar",
      onPressed: () {
        Navigator.pushNamed(context, PbInicioSesion.id);
      },
    );
  }
}

class enviaromc extends StatelessWidget{
  Widget build (BuildContext context){
    return Confirmacion(
      textot: "Enviar",
      onPressed: () {
        Navigator.pushNamed(context, PbCorreoContrasena.id);
      },
    );
  }
}

class iniciosesion extends StatelessWidget{
  Widget build (BuildContext context){
    return Confirmacion(
      textot: "iniciar secion",
      onPressed: () {
        Navigator.pushNamed(context, PbInicioSesion.id);
      },
    );
  }
}

class Confirmacion extends StatelessWidget {
  final String textot;
  final VoidCallback onPressed;


  const Confirmacion({
    required this.textot,
    required this.onPressed,

    });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 90.0), // Espaciado externo
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColores.logotext,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30), // Bordes redondeados
          ),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20), // Alto del botón
        ),
        onPressed: onPressed,
        child: Text(
          textot,
          style: AppTipoText.textoblanco,
        ),
      ),
    );
  }
}
