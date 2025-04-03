import 'package:flutter/material.dart';
import 'package:photoboom/components/datosgenerales.dart';
import 'package:photoboom/core/app_colores.dart';
import 'package:photoboom/core/app_tipo_text.dart';

class PbInicioSesion extends StatelessWidget {
  static String id = "pb_inicio_sesion";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColores.backgrounds,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("PhotoBoom",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColores.logotext,
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Iniciar secion", style: AppTipoText.texto,),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Usuario(),
              SizedBox(
                height: 15.0,
              ),
              Correo(),
              SizedBox(
                height: 15.0,
              ),
              Contras()
            ]
          ),
        ),
      ), 
    );
  }
}