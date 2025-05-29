class Mensaje {
  final String id;
  final String contenido;
  final DateTime fechaHora;
  final bool esMio;
  final String tipo; // 'texto', 'imagen', 'video'

  Mensaje({
    required this.id,
    required this.contenido,
    required this.fechaHora,
    required this.esMio,
    this.tipo = 'texto',
  });
}