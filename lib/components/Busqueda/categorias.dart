import 'package:flutter/material.dart';
import 'package:photoboom/screens/Feed/pb_feed.dart';

//------------------categorias--------------------------------

class Arquitectura extends StatelessWidget {
  Widget build(BuildContext context) {
    return categoria(
      texto: 'Arquitectura',
      alignment: Alignment.topCenter,
      fontSize: 18,
      cambio: PbFeed.id,
      imagen: 'assets/img/categoriasimg/imagen1.jpeg',
    );
  }
}

class ArteyCreatividad extends StatelessWidget {
  Widget build(BuildContext context) {
    return categoria(
      texto: 'Arte y Creatividad',
      alignment: Alignment.topCenter,
      fontSize: 18,
      cambio: PbFeed.id,
      imagen: 'assets/img/categoriasimg/imagen2.jpeg',
    );
  }
}

class Naturaleza extends StatelessWidget {
  Widget build(BuildContext context) {
    return categoria(
      texto: 'Naturaleza',
      alignment: Alignment.topCenter,
      fontSize: 18,
      cambio: PbFeed.id,
      imagen: 'assets/img/categoriasimg/imagen3.jpeg',
    );
  }
}

class Viajes extends StatelessWidget {
  Widget build(BuildContext context) {
    return categoria(
      texto: 'Viajes',
      alignment: Alignment.topCenter,
      fontSize: 18,
      cambio: PbFeed.id,
      imagen: 'assets/img/categoriasimg/imagen4.jpeg',
    );
  }
}

class Personas extends StatelessWidget {
  Widget build(BuildContext context) {
    return categoria(
      texto: 'Personas',
      alignment: Alignment.topCenter,
      fontSize: 18,
      cambio: PbFeed.id,
      imagen: 'assets/img/categoriasimg/imagen8.jpeg',
    );
  }
}

class ComidayBebida extends StatelessWidget {
  Widget build(BuildContext context) {
    return categoria(
      texto: 'Comida y Bebida',
      alignment: Alignment.topCenter,
      fontSize: 18,
      cambio: PbFeed.id,
      imagen: 'assets/img/categoriasimg/imagen7.jpeg',
    );
  }
}

class Animalesdomesticos extends StatelessWidget {
  Widget build(BuildContext context) {
    return categoria(
      texto: 'Animales domésticos',
      alignment: Alignment.topCenter,
      fontSize: 18,
      cambio: PbFeed.id,
      imagen: 'assets/img/categoriasimg/imagen6.jpeg',
    );
  }
}

class Fotografianocturna extends StatelessWidget {
  Widget build(BuildContext context) {
    return categoria(
      texto: 'Fotografía nocturna',
      alignment: Alignment.topCenter,
      fontSize: 18,
      cambio: PbFeed.id,
      imagen: 'assets/img/categoriasimg/imagen5.jpeg',
    );
  }
}
//------------------------------------------------------------------------------------

class categoria extends StatefulWidget {
  final double fontSize;
  final String? cambio;
  final Alignment alignment;
  final String texto;
  final String imagen; // Ruta de la imagen

  const categoria({
    required this.fontSize,
    this.cambio,
    required this.alignment,
    required this.texto,
    required this.imagen,
    Key? key,
  }) : super(key: key);

  @override
  _categoriaState createState() => _categoriaState();
}

class _categoriaState extends State<categoria> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Align(
      alignment: widget.alignment,
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovering = true),
        onExit: (_) => setState(() => _isHovering = false),
        child: GestureDetector(
            onTap: () {
              if (widget.cambio != null) {
                Navigator.pushNamed(context, widget.cambio!);
              } else {
                Navigator.pop(context);
              }
            },
            child: Container(
              width: screenWidth * 0.70,
              height: screenHeight * 0.25,
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: _isHovering ? const Color(0xFF4E4F50) : Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  )
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.texto,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: _isHovering ? Colors.white : Colors.black,
                      fontFamily: 'KaushanScript',
                      fontSize: widget.fontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        widget.imagen,
                        fit:
                            BoxFit.cover, // Usa cover para llenar el contenedor
                        width: double.infinity,
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
