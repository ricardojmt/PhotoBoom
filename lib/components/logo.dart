import 'package:flutter/material.dart';
import 'package:photoboom/core/app_colores.dart';
import 'package:photoboom/screens/Feed/pb_feed.dart';
import 'package:photoboom/screens/Inicio/pb_inicio_sesion.dart';

class Logogrande extends StatelessWidget{
  Widget build (BuildContext context){
    return Confirmacion(
      texto: 'PhotoBoom',
      alignment: Alignment.center,
      fontSize: 50,
      cambio: PbInicioSesion.id,
    );
  }
}

class Logopequeno extends StatelessWidget{
  Widget build (BuildContext context){
    return Confirmacion(
      texto: 'PhotoBoom',
      alignment: Alignment.topCenter,
      fontSize: 30,
      cambio: PbFeed.id,
    );
  }
}

class Logopequenoajustes extends StatelessWidget{
  Widget build (BuildContext context){
    return Confirmacion(
      texto: 'PhotoBoom - Ajustes',
      alignment: Alignment.topCenter,
      fontSize: 30,
      cambio: PbFeed.id,
    );
  }
}

class Logopequenoimagenes extends StatelessWidget{
  Widget build (BuildContext context){
    return Confirmacion(
      texto: 'PhotoBoom - Imagenes',
      alignment: Alignment.topCenter,
      fontSize: 30,
      cambio: PbFeed.id,
    );
  }
}


class Confirmacion extends StatelessWidget {
  final double fontSize;
  final String? cambio;
  final Alignment alignment;
  final String texto;



  const Confirmacion({
    required this.fontSize,
    this.cambio,
    required this.alignment,
    required this.texto,

    });
  @override
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: GestureDetector(
        onTap: () {
          if (cambio != null) {
            Navigator.pushNamed(context, cambio!);
          } else {
            Navigator.pop(context);
          }
        
        },  
      child: Text(
      texto,
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