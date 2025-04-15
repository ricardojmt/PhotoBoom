import 'package:flutter/material.dart';
import 'package:photoboom/components/botonconfirmacion.dart';
import 'package:photoboom/components/datosgenerales.dart';
import 'package:photoboom/components/logo.dart';
import 'package:photoboom/core/app_colores.dart';
import 'package:photoboom/core/app_tipo_text.dart';
import 'package:photoboom/screens/pb_inicio_sesion.dart';

class PbRegistrarse extends StatelessWidget {
  static String id = "pb_resgistrarse";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColores.backgrounds,
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Logogrande(),
            SizedBox(
              height: 20.0,
            ),
            Nombre(),
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
            Contras(),
            SizedBox(
              height: 15.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, PbInicioSesion.id);
                  },
                  child: Text("Iniciar sesión", style: AppTipoText.texto),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, PbRegistrarse.id);
                  },
                  child: Text("Registrarse", style: AppTipoText.texto),
                ),
              ],
            ),
            SizedBox(
              height: 15.0,
            ),
            Registrarme(),
          ]),
        ),
      ),
    );
  }
}
