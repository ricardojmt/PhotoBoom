import 'package:flutter/material.dart';
import 'package:photoboom/components/botonvolver.dart';
import 'package:photoboom/core/app_colores.dart';
import 'package:photoboom/core/models/chat.dart';
import 'package:photoboom/screens/Chats/pantalla_chat.dart';

class ListaChats extends StatefulWidget {
  static const String id = 'lista_chats';

  const ListaChats({super.key});

  @override
  State<ListaChats> createState() => _ListaChatsState();
}

class _ListaChatsState extends State<ListaChats> {
  final List<Chat> chats = [
    Chat(
      id: '1',
      nombreUsuario: 'Valeria',
      ultimoMensaje: 'Single videos',
      imagenUrl: 'https://randomuser.me/api/portraits/women/1.jpg',
      horaUltimoMensaje: DateTime.now().subtract(const Duration(minutes: 30)),
      tieneMensajesNoLeidos: true,
      tipoMensaje: 'video',
    ),
    Chat(
      id: '2',
      nombreUsuario: 'Angela',
      ultimoMensaje: 'Ride, ¿Cómo estás?...',
      imagenUrl: 'https://randomuser.me/api/portraits/women/2.jpg',
      horaUltimoMensaje: DateTime.now().subtract(const Duration(hours: 2)),
      tieneMensajesNoLeidos: false,
    ),
    // Agrega más chats según tu imagen
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chats', style: TextStyle(color: Colors.black)),
        leading: const Botonvolver(icon: Icons.arrow_back),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: chats.length,
        itemBuilder: (context, index) {
          final chat = chats[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 8),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(chat.imagenUrl),
              ),
              title: Text(
                chat.nombreUsuario,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(chat.ultimoMensaje),
              trailing: chat.tipoMensaje == 'video' 
                  ? const Icon(Icons.videocam, color: Colors.red)
                  : const Icon(Icons.chat, color: Colors.grey),
              onTap: () {
                Navigator.pushNamed(context, PantallaChat.id, arguments: chat);
              },
            ),
          );
        },
      ),
    );
  }
}