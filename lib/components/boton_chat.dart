import 'package:flutter/material.dart';
import 'package:photoboom/screens/Chats/lista_chats.dart';

class BotonChat extends StatelessWidget {
  const BotonChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, right: 10),
      decoration: BoxDecoration(
        color: Colors.red, // Color rojo
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: IconButton(
        icon: const Icon(Icons.chat, color: Colors.white),
        onPressed: () {
          Navigator.pushNamed(context, ListaChats.id);
        },
      ),
    );
  }
}