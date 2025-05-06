import 'package:flutter/material.dart';
import 'package:photoboom/core/app_colores.dart';
import 'package:photoboom/components/botonvolver.dart'; // Importa Botonvolver
import 'package:photoboom/components/logo.dart';
import 'package:photoboom/screens/Chats/lista_chats.dart'; // Para ListaChats.id

class PbPortafolio extends StatelessWidget {
  static String id = "pb_portafolio";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColores.backgrounds,
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                flechainicio(),
                configuraciones(), // Corregí el nombre (estaba "configureCiones")
              ],
            ),
            Expanded(
              child: Center(
                child: Logopequeno(),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                feed(),
                BotonChat(), // Usando el componente correcto (con mayúscula)
                perfil(), // Corregí el nombre (estaba "perfill")
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Añade esta clase en el mismo archivo o mejor en un archivo separado boton_chat.dart
class BotonChat extends StatelessWidget {
  const BotonChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Botonvolver(
      icon: Icons.chat,
      color: AppColores.logotext,
      cambio: ListaChats.id,
    );
  }
}