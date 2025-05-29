import 'package:photoboom/core/models/chat.dart';

class ChatRepositorio {
  static final List<Chat> chats = [
    Chat(
      id: '1',
      nombreUsuario: 'Valeria',
      ultimoMensaje: 'SG-UP-Video...',
      imagenUrl: 'https://randomuser.me/api/portraits/women/1.jpg',
      horaUltimoMensaje: DateTime.now().subtract(Duration(minutes: 5)),
      tieneMensajesNoLeidos: true,
    ),
    Chat(
      id: '2',
      nombreUsuario: 'Angela',
      ultimoMensaje: 'Hello, Céline estatal...',
      imagenUrl: 'https://randomuser.me/api/portraits/women/2.jpg',
      horaUltimoMensaje: DateTime.now().subtract(Duration(minutes: 5)),
      tieneMensajesNoLeidos: false,
    ),
    Chat(
      id: '3',
      nombreUsuario: 'YessicaTriana',
      ultimoMensaje: 'Hello, Céline estatal...',
      imagenUrl: 'https://randomuser.me/api/portraits/women/3.jpg',
      horaUltimoMensaje: DateTime.now().subtract(Duration(minutes: 5)),
      tieneMensajesNoLeidos: true,
    ),
    Chat(
      id: '4',
      nombreUsuario: 'RichIMT',
      ultimoMensaje: 'Hello, Céline estatal...',
      imagenUrl: 'https://randomuser.me/api/portraits/men/1.jpg',
      horaUltimoMensaje: DateTime.now().subtract(Duration(minutes: 5)),
      tieneMensajesNoLeidos: true,
    ),
    Chat(
      id: '5',
      nombreUsuario: 'Sadexcm',
      ultimoMensaje: 'Hello, Céline estatal...',
      imagenUrl: 'https://randomuser.me/api/portraits/men/2.jpg',
      horaUltimoMensaje: DateTime.now().subtract(Duration(minutes: 5)),
      tieneMensajesNoLeidos: false,
    ),
    Chat(
      id: '6',
      nombreUsuario: 'ZaidE',
      ultimoMensaje: 'Hello, Céline estatal...',
      imagenUrl: 'https://randomuser.me/api/portraits/men/3.jpg',
      horaUltimoMensaje: DateTime.now().subtract(Duration(minutes: 5)),
      tieneMensajesNoLeidos: false,
    ),
    Chat(
      id: '7',
      nombreUsuario: 'AlbertoAleman',
      ultimoMensaje: 'Hello, Céline estatal...',
      imagenUrl: 'https://randomuser.me/api/portraits/men/4.jpg',
      horaUltimoMensaje: DateTime.now().subtract(Duration(minutes: 5)),
      tieneMensajesNoLeidos: true,
    ),
    Chat(
      id: '8',
      nombreUsuario: 'AngelCBR',
      ultimoMensaje: '',
      imagenUrl: 'https://randomuser.me/api/portraits/men/5.jpg',
      horaUltimoMensaje: DateTime.now().subtract(Duration(minutes: 5)),
      tieneMensajesNoLeidos: false,
    ),
  ];
   static List<Chat> obtenerChats() => chats;
}