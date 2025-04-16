import 'package:flutter/material.dart';
import 'package:photoboom/core/app_colores.dart';
import 'package:photoboom/screens/Feed/pb_feed.dart';
import 'package:photoboom/screens/Inicio/pb_inicio_sesion.dart';

class Logogrande extends StatelessWidget{
  Widget build (BuildContext context){
    return Confirmacion(
      fontSize: 50,
      cambio: PbInicioSesion.id,
    );
  }
}

class Logopequeno extends StatelessWidget{
  Widget build (BuildContext context){
    return Confirmacion(
      fontSize: 30,
      cambio: PbFeed.id,
    );
  }
}

class Confirmacion extends StatelessWidget {
  final double fontSize;
  final String? cambio;


  const Confirmacion({
    required this.fontSize,
    this.cambio,

    });
  @override
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: GestureDetector(
        onTap: () {
          if (cambio != null) {
            Navigator.pushNamed(context, cambio!);
          } else {
            Navigator.pop(context);
          }
        
        },  
      child: Text(
      "PhotoBoom",
      textAlign: TextAlign.center,
      style: TextStyle(
        color: AppColores.logotext,
        fontFamily: 'KaushanScript',
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        
      ),
    ),
    ),
    );
  }
}