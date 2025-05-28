import 'package:flutter/material.dart';
import 'package:photoboom/core/app_colores.dart';
import 'package:photoboom/screens/Feed/pb_feed.dart';
import 'package:photoboom/screens/Inicio/pb_inicio_sesion.dart';

class Cuenta extends StatelessWidget{
  Widget build (BuildContext context){
    return ajustes(
      texto: 'Cuenta',
      alignment: Alignment.center,
      fontSize: 18,
      cambio: PbInicioSesion.id,
    );
  }
}

class Notificaciones extends StatelessWidget{
  Widget build (BuildContext context){
    return ajustes(
      texto: 'Notificaciones',
      alignment: Alignment.center,
      fontSize: 18,
      cambio: PbInicioSesion.id,
    );
  }
}

class PrivacidadySeguridad extends StatelessWidget{
  Widget build (BuildContext context){
    return ajustes(
      texto: 'Privacidad y Seguridad',
      alignment: Alignment.center,
      fontSize: 18,
      cambio: PbInicioSesion.id,
    );
  }
}

class Centrodeayudaysoporte extends StatelessWidget{
  Widget build (BuildContext context){
    return ajustes(
      texto: 'Centro de ayuda y soporte',
      alignment: Alignment.center,
      fontSize: 18,
      cambio: PbInicioSesion.id,
    );
  }
}


class Funcionesexperimentalesobeta extends StatelessWidget{
  Widget build (BuildContext context){
    return ajustes(
      texto: 'Funciones experimentales o beta',
      alignment: Alignment.center,
      fontSize: 18,
      cambio: PbInicioSesion.id,
    );
  }
}


class Sesion extends StatelessWidget{
  Widget build (BuildContext context){
    return ajustes(
      texto: 'Sesión',
      alignment: Alignment.topCenter,
      fontSize: 30,
      cambio: PbFeed.id,
    );
  }
}



class ajustes extends StatefulWidget {
  final double fontSize;
  final String? cambio;
  final Alignment alignment;
  final String texto;

  const ajustes({
    required this.fontSize,
    this.cambio,
    required this.alignment,
    required this.texto,
    Key? key,
  }) : super(key: key);

  @override
  _ajustesState createState() => _ajustesState();
}

class _ajustesState extends State<ajustes> {
  bool _isHovering = false; // Para detectar si el mouse está encima

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Align(
      alignment: widget.alignment,
      child: MouseRegion(
        onEnter: (_) {
          setState(() {
            _isHovering = true;
          });
        },
        onExit: (_) {
          setState(() {
            _isHovering = false;
          });
        },
        child: GestureDetector(
          onTap: () {
            if (widget.cambio != null) {
              Navigator.pushNamed(context, widget.cambio!);
            } else {
              Navigator.pop(context);
            }
          },
          child: Container(
            width: screenWidth * 0.7,
            height: screenHeight * 0.08,
            margin: EdgeInsets.symmetric(vertical: 10),
            padding: EdgeInsets.symmetric(horizontal: 0.5),
            decoration: BoxDecoration(
              color: _isHovering ? Colors.blueAccent : Colors.white, // Cambia color si está hover
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 6,
                  offset: Offset(0, 3),
                )
              ],
            ),
            child: Center(
              child: Text(
                widget.texto,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: _isHovering ? Colors.white : const Color.fromARGB(255, 0, 0, 0),
                  fontFamily: 'KaushanScript',
                  fontSize: widget.fontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
