import 'package:flutter/material.dart';
import 'package:photoboom/components/botonvolver.dart';
import 'package:photoboom/components/logo.dart';
import 'package:photoboom/core/app_colores.dart';
import 'package:photoboom/components/imagenesorden.dart';

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
                configuraciones(),
              ],
            ),

            /// Foto de perfil y nombre
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/img/descargar.jpeg'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "nombre_usuario",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Diseñador | Fotógrafo | Artista Digital",
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),

            /// Estadísticas y botón
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildStatColumn("54", "Publicaciones"),
                  _buildStatColumn("1.2K", "Seguidores"),
                  _buildStatColumn("300", "Seguidos"),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[300],
                foregroundColor: Colors.black,
              ),
              child: Text("Editar perfil"),
            ),

            /// Galería de imágenes
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GaleriaImagenes(
                  imagePaths: [
                    'assets/img/imagen4.jpeg',
                    'assets/img/imagen2.jpeg',
                    'assets/img/categoriasimg/imagen3.jpeg',
                    'assets/img/imagen3.jpeg',
                    'assets/img/imagen1.jpeg',
                    'assets/img/categoriasimg/imagen5.jpeg',
                    'assets/img/categoriasimg/imagen6.jpeg',
                    'assets/img/imagen6.jpeg',
                    'assets/img/imagen5.jpg',
                    'assets/img/categoriasimg/imagen8.jpeg',
                    'assets/img/categoriasimg/imagen1.jpeg',
                    'assets/img/categoriasimg/imagen4.jpeg',
                    'assets/img/categoriasimg/imagen7.jpeg',
                    'assets/img/categoriasimg/imagen2.jpeg',
                  ],
                ),
              ),
            ),

            /// Barra de navegación inferior
           Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                feed(),
                retos(),
                fotos(),
                corazon(),
                perfil(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatColumn(String number, String label) {
    return Column(
      children: [
        Text(
          number,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(
          label,
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ],
    );
  }
}
