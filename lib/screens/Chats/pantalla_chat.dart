import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:photoboom/core/app_colores.dart';
import 'package:photoboom/core/app_tipo_text.dart';
import 'package:photoboom/core/models/mensaje.dart';
import 'package:photoboom/core/models/chat.dart';
import 'package:photoboom/components/botonvolver.dart';

  class PantallaChat extends StatefulWidget {
  final Chat chat;
  const PantallaChat({Key? key, required this.chat}) : super(key: key);

  @override
  State<PantallaChat> createState() => _PantallaChatState();
}

class _PantallaChatState extends State<PantallaChat> {
  late Chat _chat;
  final TextEditingController _controller = TextEditingController();
  final List<String> _messages = [];

  @override
  void initState() {
    super.initState();
    _chat = widget.chat;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _messages.add(_controller.text);
        _controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Botonvolver(icon: Icons.arrow_back),
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(_chat.imagenUrl),
            ),
            const SizedBox(width: 10),
            Text(_chat.nombreUsuario),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return Align(
                  alignment: index % 2 == 0 
                      ? Alignment.centerLeft 
                      : Alignment.centerRight,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: index % 2 == 0 
                          ? Colors.grey[200] 
                          : AppColores.logotext,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      _messages[index],
                      style: TextStyle(
                        color: index % 2 == 0 ? Colors.black : Colors.white),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.camera_alt, color: AppColores.logotext),
                  onPressed: () {},
                ),
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Escribe un mensaje...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send, color: AppColores.logotext),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}