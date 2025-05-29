import 'package:flutter/material.dart';
import 'package:photoboom/core/app_colores.dart';
import 'package:photoboom/core/app_tipo_text.dart';

/// Widget que muestra una fila de chat en la lista, con indicador opcional.
class TarjetaChat extends StatelessWidget {
  final String nombre;
  final String ultimoMensaje;
  final String hora;
  final bool indicadorActivo;
  final VoidCallback onTap;
  final VoidCallback onCameraTap;

  const TarjetaChat({
    Key? key,
    required this.nombre,
    required this.ultimoMensaje,
    required this.hora,
    this.indicadorActivo = false,
    required this.onTap,
    required this.onCameraTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Row(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: AppColores.chatAvatar,
                ),
                if (indicadorActivo)
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: AppColores.primary,
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColores.backgrounds, width: 1.5),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nombre,
                    style: AppTipoText.headline6,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    ultimoMensaje,
                    style: AppTipoText.subtitle2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  hora,
                  style: AppTipoText.caption,
                ),
                IconButton(
                  icon: const Icon(Icons.camera_alt),
                  onPressed: onCameraTap,
                  splashRadius: 20,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}