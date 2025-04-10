import 'package:flutter/material.dart';
import 'package:photoboom/core/app_colores.dart';

class Lineas extends StatelessWidget {
  final Widget child;

  const Lineas({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return AppLineasDecoracion(
      lineas: [
        LineaDecorativa(top: 80, left: 50, angle: 0.785),         
        LineaDecorativa(top: 60, left: 100, angle: 0.785),   
        LineaDecorativa(top: 650, left: -60, angle: 0.785),         
        LineaDecorativa(top: 670, left: -110, angle: 0.785),  
        LineaDecorativa(top: 690, left: -160, angle: 0.785),       
      ],
      child: child,
    );
  }
}


class AppLineasDecoracion extends StatelessWidget {
  final List<LineaDecorativa> lineas;
  final Widget child;

  const AppLineasDecoracion({
    required this.lineas,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Fondo opcional (puedes quitarlo si no lo quieres)
        Container(color: Colors.white),

        // Agrega todas las líneas
        ...lineas.map((linea) => Positioned(
              top: linea.top,
              left: linea.left,
              child: Transform.rotate(
                angle: linea.angle,
                child: Container(
                  width: 400,
                  height: 8,
                  color: AppColores.logotext,
                ),
              ),
            )),

        // El contenido principal
        child,
      ],
    );
  }
}

class LineaDecorativa {
  final double top;
  final double left;
  final double angle;

  const LineaDecorativa({
    required this.top,
    required this.left,
    required this.angle,
  });
}

