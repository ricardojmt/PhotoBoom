import 'package:flutter/material.dart';
import 'package:photoboom/components/datosgenerales.dart';
import 'package:photoboom/core/app_colores.dart';
import 'package:photoboom/core/app_tipo_text.dart';
import 'package:photoboom/screens/Inicio/pb_inicio_sesion.dart';

class PbInicioSesion extends StatelessWidget {
  static const String id = "/inicio-sesion";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColores.backgrounds,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "PhotoBoom",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColores.logotext,
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Iniciar sesión", style: AppTipoText.texto),
                ],
              ),
              SizedBox(height: 20.0),
              Usuario(), // Campo para el usuario
              SizedBox(height: 15.0),
              Correo(), // Campo para el correo
              SizedBox(height: 15.0),
              Contras(), // Campo para la contraseña
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "/registrarse");
                    },
                    child: Text("Registrarse", style: AppTipoText.texto),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/Feed');
                    },
                    child: Text("Ir al Feed"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
