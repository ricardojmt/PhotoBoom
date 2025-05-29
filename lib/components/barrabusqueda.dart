import 'package:flutter/material.dart';
import 'package:photoboom/screens/buscador/Perfiles/pb_perfiles_menu.dart';
import 'package:photoboom/screens/buscador/imagenes/pb_imagenes_categorias.dart';
import 'package:photoboom/screens/buscador/imagenes/pb_imagenes_menu.dart';

class busquedaperfiles extends StatelessWidget {
  Widget build(BuildContext context) {
    return Busquedaopciones(
      texto: 'Perfiles',
      whidth: 0.45,
      height: 0.08,
      alignment: Alignment.topCenter,
      fontSize: 18,
      colorBoton: const Color(0xFFFFFFFF),
      colorselec: const Color(0xFF4E4F50),
      colortexto: const Color(0xFF000000),
      colorselectexto: const Color(0xFFFFFFFF),
      cambio: PbPerfilesmenu.id,
    );
  }
}

class busquedaimagenes extends StatelessWidget {
  Widget build(BuildContext context) {
    return Busquedaopciones(
      texto: 'Imagenes',
      whidth: 0.45,
      height: 0.08,
      alignment: Alignment.topCenter,
      fontSize: 18,
      colorBoton: const Color(0xFFFFFFFF),
      colorselec: const Color(0xFF4E4F50),
      colortexto: const Color(0xFF000000),
      colorselectexto: const Color(0xFFFFFFFF),
      cambio: PbImagenesmenu.id,
    );
  }
}

class imagenescategorias extends StatelessWidget {
  Widget build(BuildContext context) {
    return Busquedaopciones(
      texto: 'Categorías',
      whidth: 0.40,
      height: 0.08,
      alignment: Alignment.topCenter,
      fontSize: 18,
      colorBoton: const Color(0xFFFFFFFF),
      colorselec: const Color(0xFF4E4F50),
      colortexto: const Color(0xFF000000),
      colorselectexto: const Color(0xFFFFFFFF),
      cambio: PbImagenesCategorias.id,
    );
  }
}

class imagenescategoriaseleccionada extends StatelessWidget {
  Widget build(BuildContext context) {
    return Busquedaopciones(
      texto: 'Categorías',
      whidth: 0.40,
      height: 0.08,
      alignment: Alignment.topCenter,
      fontSize: 18,
      colorBoton: const Color(0xFFFF0000),
      colorselec: const Color(0xFFFF0000),
      colortexto: const Color(0xFFFFFFFF),
      colorselectexto: const Color(0xFFFFFFFF),
    );
  }
}

class imagenestendencia extends StatelessWidget {
  Widget build(BuildContext context) {
    return Busquedaopciones(
      texto: 'Tendencias',
      whidth: 0.40,
      height: 0.08,
      alignment: Alignment.topCenter,
      fontSize: 18,
      colorBoton: const Color(0xFFFFFFFF),
      colorselec: const Color(0xFF4E4F50),
      colortexto: const Color(0xFF000000),
      colorselectexto: const Color(0xFFFFFFFF),
      cambio: PbImagenesmenu.id,
    );
  }
}

class perfileseleccionado extends StatelessWidget {
  Widget build(BuildContext context) {
    return Busquedaopciones(
      texto: 'Perfiles',
      whidth: 0.40,
      height: 0.08,
      alignment: Alignment.topCenter,
      fontSize: 18,
      colorBoton: const Color(0xFFFF0000),
      colorselec: const Color(0xFFFF0000),
      colortexto: const Color(0xFFFFFFFF),
      colorselectexto: const Color(0xFFFFFFFF),
    );
  }
}

class BarraBusqueda extends StatelessWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;

  const BarraBusqueda({Key? key, this.controller, this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: 'Buscar...',
          prefixIcon: Icon(Icons.search),
          filled: true,
          fillColor: Color(0xFFEFEFEF), // ← Color de fondo personalizado
          contentPadding: EdgeInsets.symmetric(vertical: 10.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}

class Busquedaopciones extends StatefulWidget {
  final double fontSize;
  final double whidth;
  final double height;
  final String? cambio;
  final Alignment alignment;
  final String texto;
  final Color colorBoton;
  final Color colorselec;
  final Color colortexto;
  final Color colorselectexto;

  const Busquedaopciones({
    required this.fontSize,
    required this.whidth,
    required this.height,
    this.cambio,
    required this.alignment,
    required this.texto,
    required this.colorBoton,
    required this.colorselec,
    required this.colortexto,
    required this.colorselectexto,
    Key? key,
  }) : super(key: key);

  @override
  _busquesdaopcionesState createState() => _busquesdaopcionesState();
}

class _busquesdaopcionesState extends State<Busquedaopciones> {
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
            width: screenWidth * widget.whidth,
            height: screenHeight * widget.height,
            margin: EdgeInsets.symmetric(vertical: 10),
            padding: EdgeInsets.symmetric(horizontal: 0.5),
            decoration: BoxDecoration(
              color: _isHovering
                  ? widget.colorselec
                  : widget.colorBoton, // Cambia color si está hover
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
                  color:
                      _isHovering ? widget.colorselectexto : widget.colortexto,
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
