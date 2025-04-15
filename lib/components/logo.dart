import 'package:flutter/material.dart';
import 'package:photoboom/core/app_colores.dart';

class Logogrande extends StatelessWidget{
  Widget build (BuildContext context){
    return Confirmacion(
      fontSize: 50,
    );
  }
}

class Logopequeno extends StatelessWidget{
  Widget build (BuildContext context){
    return Confirmacion(
      fontSize: 30,
    );
  }
}

class Confirmacion extends StatelessWidget {
  final double fontSize;


  const Confirmacion({
    required this.fontSize,

    });
  @override
  @override
  Widget build(BuildContext context) {
    return Text(
      "PhotoBoom",
      textAlign: TextAlign.center,
      style: TextStyle(
        color: AppColores.logotext,
        fontFamily: 'KaushanScript',
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}