import 'package:flutter/material.dart';
import 'package:photoboom/components/botonconfirmacion.dart';
import 'package:photoboom/components/datosgenerales.dart';
import 'package:photoboom/components/logo.dart';
import 'package:photoboom/core/app_colores.dart';
import 'package:photoboom/core/app_tipo_text.dart';
import 'package:photoboom/core/app_lineas_decoracion.dart';

class PbRegistrarse extends StatelessWidget {
  static const String id = "/registrarse";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColores.backgrounds,
        body: Lineas(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Logogrande(),
                SizedBox(height: 20.0),
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
                    Text("Registrarse", style: AppTipoText.texto),
                  ],
                ),
                SizedBox(height: 20.0),
                Nombre(),
                SizedBox(height: 20.0),
                Usuario(),
                SizedBox(height: 15.0),
                Correo(),
                SizedBox(height: 15.0),
                Contras(),
                SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, "/inicio-sesion");
                      },
                      child: Text("Iniciar sesión", style: AppTipoText.texto),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, "/registrarse");
                      },
                      child: Text("Registrarse", style: AppTipoText.texto),
                    ),
                  ],
                ),
                SizedBox(height: 15.0),
                Registrarme(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
