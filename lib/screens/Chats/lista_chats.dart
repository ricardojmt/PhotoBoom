import 'package:flutter/material.dart';
import 'package:photoboom/core/app_colores.dart';
import 'package:photoboom/core/app_tipo_text.dart';
import 'package:photoboom/core/models/chat.dart';
import 'package:photoboom/core/Repositorios/chat_repositorio.dart';
import 'package:photoboom/screens/Chats/pantalla_chat.dart';
import 'package:photoboom/components/botonvolver.dart';
import 'package:photoboom/components/boton_chat.dart';

class ListaChats extends StatefulWidget {
  static const String id = 'lista_chats';
  const ListaChats({super.key});

  @override
  State<ListaChats> createState() => _ListaChatsState();
}

class _ListaChatsState extends State<ListaChats> {
  late List<Chat> _chats;

  @override
  void initState() {
    super.initState();
    _chats = ChatRepositorio.obtenerChats();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Botonvolver(icon: Icons.arrow_back),
        title: const Text('Chats'),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _chats.length,
              itemBuilder: (context, index) {
                final chat = _chats[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(chat.imagenUrl),
                  ),
                  title: Text(chat.nombreUsuario, style: AppTipoText.subtitle2),
                  subtitle: Text(chat.ultimoMensaje, style: AppTipoText.caption),
                  trailing: const Icon(Icons.camera_alt, color: AppColores.fristtext),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => PantallaChat(chat: chat),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          // Botón flotante “+”
          const BotonChat(),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Icon(Icons.home_outlined, color: AppColores.fristtext),
              Icon(Icons.new_releases_outlined, color: AppColores.fristtext),
              SizedBox(width: 40), // espacio para el FAB
              Icon(Icons.favorite_border, color: AppColores.fristtext),
              Icon(Icons.person_outline, color: AppColores.fristtext),
            ],
          ),
        ),
      ),
    );
  }
}