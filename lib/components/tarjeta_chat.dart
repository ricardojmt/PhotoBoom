import 'package:flutter/material.dart';
import 'package:photoboom/core/app_colores.dart';
import 'package:photoboom/core/models/chat.dart'; // Asegúrate de importar el modelo Chat

class TarjetaChat extends StatelessWidget {
  final Chat chat;
  final VoidCallback onTap; // Corregido: era "onlap"

  const TarjetaChat({super.key, required this.chat, required this.onTap});

  @override // Corregido: "@override" debe estar en minúsculas y sin espacio después
  Widget build(BuildContext context) {
    return ListTile( // Corregido: era "ListFile"
      leading: CircleAvatar(
        backgroundImage: NetworkImage(chat.imagenUrl),
        radius: 25,
        child: chat.tieneMensajesNoLeidos // Corregido: era "tieneMensajesNoleidos"
          ? Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: AppColores.logotext, // Corregido: eliminado el emoji
                  shape: BoxShape.circle,
                ),
              ),
            )
          : null,
      ),
      title: Text(
        chat.nombreUsuario,
        style: TextStyle(
          fontWeight: chat.tieneMensajesNoLeidos 
              ? FontWeight.bold 
              : FontWeight.normal,
        ),
      ),
      subtitle: Text(
        chat.ultimoMensaje,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${chat.horaUltimoMensaje.hour}:${chat.horaUltimoMensaje.minute.toString().padLeft(2, '0')}',
            style: const TextStyle(fontSize: 12),
          ),
          const Icon(Icons.camera_alt, size: 20),
        ],
      ),
      onTap: onTap,
    );
  }
}