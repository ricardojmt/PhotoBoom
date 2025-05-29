import 'package:flutter/material.dart';
import 'package:photoboom/components/botonconfirmacion.dart';
import 'package:photoboom/components/botonvolver.dart';
import 'package:photoboom/components/datosgenerales.dart';
import 'package:photoboom/components/logo.dart';
import 'package:photoboom/components/textos.dart';
import 'package:photoboom/core/app_colores.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

int _selectedIndex = 0;

class PbFeed extends StatefulWidget {
  static String id = "pb_feed";

  @override
  State<PbFeed> createState() => _PbFeedState();
}

class _PbFeedState extends State<PbFeed> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: AppColores.backgrounds,
          body: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.only(top: 16.0, left: 8.0),
                  child: Row(
                    children: [
                      Flechainicio(),
                      Logopequeno(),
                    ],
                  )),
              Expanded(
                child: elegirboton(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0, left: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Feed(
                      onPressed: () => setState(() => _selectedIndex = 0),
                    ),
                    Retos(
                      onPressed: () => setState(() => _selectedIndex = 1),
                    ),
                    Fotos(
                      onPressed: () => setState(() => _selectedIndex = 2),
                    ),
                    Corazon(
                      onPressed: () => setState(() => _selectedIndex = 3),
                    ),
                    Perfil(
                      onPressed: () => setState(() => _selectedIndex = 4),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}

Widget elegirboton() {
  switch (_selectedIndex) {
    case 0:
      return paginaprincipal(); // Página principal
    case 1:
      return retos(); // Página de Retos
    case 2:
      return subirfotos(); // Página para subir fotos
    case 3:
      return buscar(); // Página de búsqueda
    case 4:
      return perfilusuario(); // Página del perfil
    default:
      return paginaprincipal(); // Página predeterminada
  }
}

Widget buildImageItem(BuildContext context, String imagePath, String userName,
    int likes, int comments) {
  return Container(
    width: 300,
    alignment: Alignment.center,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment:
          MainAxisAlignment.center, // ← Esto alinea todo a la izquierda
      children: [
        // Nombre del usuario con su avatar
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 12,
              ),
              SizedBox(width: 8),
              Text(
                userName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),

        // Imagen con borde
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          margin: EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(19),
            border: Border.all(color: Colors.redAccent, width: 2),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Image.asset(
              imagePath,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ),

        // Likes y comentarios
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              Icon(Icons.favorite, color: Colors.red),
              SizedBox(width: 4),
              Text('$likes Likes'),
              SizedBox(width: 16),
              Icon(Icons.comment, color: Colors.red),
              SizedBox(width: 4),
              Text('$comments Comments'),
            ],
          ),
        ),
        SizedBox(
          height: 16,
        ),
      ],
    ),
  );
}

Widget paginaprincipal() {
  return ListView.builder(
    padding: EdgeInsets.all(16),
    itemCount: 4,
    itemBuilder: (context, index) {
      final imagenes = [
        'assets/images/imagen1.jpg',
        'assets/images/imagen2.jpg',
        'assets/images/imagen3.jpg',
        'assets/images/imagen4.jpg',
      ];
      final usuarios = ['RicardoMT', 'YessTriana', 'AlbertoAl', 'SergioC'];
      final likes = [120, 89, 45, 230];
      final comments = [12, 5, 8, 14];
      return Center(
        child: buildImageItem(
          context,
          imagenes[index], //llamar al vector imagenes
          usuarios[index],
          likes[index],
          comments[index],
        ),
      );
    },
  );
}

Widget retos() {
  return Center(
    child: Text(
      'Página de Retos',
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    ),
  );
}

Widget subirfotos() {
  return Center(
    child: Text(
      'Subir Fotos',
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    ),
  );
}

Widget buscar() {
  return Center(
    child: Text(
      'Buscar Fotos y Usuarios',
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    ),
  );
}

Widget perfilusuario() {
  return Center(
    child: Text(
      'Perfil de Usuario',
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    ),
  );
}
