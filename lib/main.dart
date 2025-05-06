import 'package:flutter/material.dart';
import 'package:photoboom/core/app_colores.dart';
import 'package:photoboom/screens/Feed/pb_feed.dart';
import 'package:photoboom/screens/Inicio/pb_inicio_sesion.dart';
import 'package:photoboom/screens/Portafolio/pb_portafolio.dart';
import 'package:photoboom/screens/Chats/lista_chats.dart';
import 'package:photoboom/screens/Chats/pantalla_chat.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColores.backgrounds,
      ),
      initialRoute: PbInicioSesion.id,
      routes: {
        PbInicioSesion.id: (context) =>  PbInicioSesion(),
        PbFeed.id: (context) => PbFeed(),
        PbPortafolio.id: (context) => PbPortafolio(),
        ListaChats.id: (context) => const ListaChats(),
        PantallaChat.id: (context) => PantallaChat(),  // Sin const
      },
    );
  }
}