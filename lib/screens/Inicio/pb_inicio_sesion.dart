import 'package:flutter/material.dart';
import 'package:photoboom/components/botonconfirmacion.dart';
import 'package:photoboom/components/datosgenerales.dart';
import 'package:photoboom/components/logo.dart';
import 'package:photoboom/core/app_colores.dart';
import 'package:photoboom/core/app_tipo_text.dart';
import 'package:photoboom/screens/Inicio/pb_olvide_contrasena.dart';
import 'package:photoboom/screens/Inicio/pb_registrarse.dart';
import 'package:photoboom/screens/Chats/lista_chats.dart';

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
              Logogrande(),
              SizedBox(height: 20.0),
              Usuario(),
              SizedBox(height: 15.0),
              Contras(),
              SizedBox(height: 5.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, PbOlvideContrasena.id);
                    },
                    child: Text("Olvidé mi contraseña",
                        style: AppTipoText.textopequeno),
                  ),
                ],
              ),
              SizedBox(height: 15.0),
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
              SizedBox(height: 15.0),
              Iniciar(),
              SizedBox(height: 25.0),
              // Botón de desarrollador aquí:
              if (const bool.fromEnvironment('dart.vm.product') == false)
              ElevatedButton(
               onPressed: () {
                  Navigator.pushNamed(context, ListaChats.id);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                ),
              child: Text(
                "Entrar como Desarrollador",
                style: TextStyle(color: Colors.white),
               ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
