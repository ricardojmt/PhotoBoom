import 'package:flutter/material.dart';
import 'package:photoboom/components/botonvolver.dart';
import 'package:photoboom/components/logo.dart';
import 'package:photoboom/core/app_colores.dart';

class PbPortafolio extends StatelessWidget {
  static String id = "pb_portafolio";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColores.backgrounds,
        body: Column(
          children: [
            Stack(
              children: [
                Logopequeno(),
                ConfiguracionesBoton(onPressed: () {
      // Aquí puedes navegar a la pantalla Feed
    }),
              ],
            ),
            Expanded(
              child: Column(
                  children: [
                    CircleAvatar(radius: 80,
                      backgroundImage:  AssetImage('assets/img/descargar.jpeg'),
                    )
                  ],
              ),
            ),
             Row(
  crossAxisAlignment: CrossAxisAlignment.end,
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  children: [
    FeedBoton(onPressed: () {
      // Aquí puedes navegar a la pantalla Feed
    }),
    RetosBoton(onPressed: () {
      // Aquí puedes poner acción para retos
    }),
    FotosBoton(onPressed: () {
      // Acción para fotos
    }),
    CorazonBoton(onPressed: () {
      // Acción para favoritos
    }),
    PerfilBoton(onPressed: () {
      // Acción para perfil
    }),
  ],
),
          ],
        ),
      ),
    );
  }
}
