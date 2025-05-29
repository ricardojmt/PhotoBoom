import 'package:flutter/material.dart';
import 'package:photoboom/core/app_colores.dart';
import 'package:photoboom/screens/Feed/pb_feed.dart';
import 'package:photoboom/screens/Inicio/pb_inicio_sesion.dart';
import 'package:photoboom/screens/Portafolio/pb_portafolio.dart';
import 'package:photoboom/screens/Chats/lista_chats.dart';
import 'package:photoboom/screens/Chats/pantalla_chat.dart';
import 'package:photoboom/core/Repositorios/chat_repositorio.dart';
import 'package:photoboom/core/models/mensaje.dart';

void main() {
  runApp(const PhotoBoomApp());
}

class PhotoBoomApp extends StatelessWidget {
  const PhotoBoomApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PhotoBoom',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ListaChats(),
      // Opcional: rutas con nombre
      routes: {
        ListaChats.id: (_) => const ListaChats(),
      },
    );
  }
}