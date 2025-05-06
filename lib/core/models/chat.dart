class Chat {
  final String id;
  final String nombreUsuario;
  final String ultimoMensaje;
  final String imagenUrl;
  final DateTime horaUltimoMensaje;
  final bool tieneMensajesNoLeidos;
  final String tipoMensaje; // 'texto', 'video', 'audio'

  Chat({
    required this.id,
    required this.nombreUsuario,
    required this.ultimoMensaje,
    required this.imagenUrl,
    required this.horaUltimoMensaje,
    this.tieneMensajesNoLeidos = false,
    this.tipoMensaje = 'texto',
  });
}