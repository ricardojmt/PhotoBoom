import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photoboom/core/app_tipo_text.dart';




class Textoco extends StatelessWidget{
  Widget build (BuildContext context){
    return Textos(
      dis: 90,
      textoss: "Recuperar contraseña",
      fontWeight: FontWeight.bold, 
    );
  }
}

class Textola extends StatelessWidget{
  Widget build (BuildContext context){
    return Textos(
      dis: 90,
      textoss: "Ingresa tu correo electrónico y te enviaremos un enlace para restablecer tu contraseña. ",
      centrado: true,
    );
  }
}

class Textoconfirmacioncorreo extends StatelessWidget{
  Widget build (BuildContext context){
    return Textos(
      dis: 90,
      textoss: "Se ha enviado un correo a us********@gmail.com con las instrucciones para restablecer tu contraseña. ",
      centrado: true,
    );
  }
}

class Textos extends StatelessWidget {
  final String textoss;
  final FontWeight? fontWeight;
  final double dis;
  final bool centrado;

  const Textos({
     required this.textoss,
     this.fontWeight,
     required this.dis,
     this.centrado = false,
  });
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: dis),
      child: Text(
        textoss,
        textAlign: centrado ? TextAlign.center : TextAlign.start,
        style: AppTipoText.textos.copyWith(
          fontWeight: fontWeight ?? FontWeight.normal, // o cualquier estilo que estés usando
        ),
      ),
    );
  }
}
