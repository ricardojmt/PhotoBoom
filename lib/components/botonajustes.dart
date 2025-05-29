import 'package:flutter/material.dart';
import 'package:photoboom/screens/Ajustes/pb_ajustes_notificaciones.dart';
import 'package:photoboom/screens/ajustes/pb_ajustes_centro_de_ayuda_y_soporte.dart';
import 'package:photoboom/screens/ajustes/pb_ajustes_cuenta.dart';
import 'package:photoboom/screens/ajustes/pb_ajustes_funciones_experimentales_o_beta.dart';
import 'package:photoboom/screens/ajustes/pb_ajustes_privacidad_y_seguridad.dart';
import 'package:photoboom/screens/ajustes/pb_ajustes_sesion.dart';
import 'package:photoboom/screens/Feed/pb_feed.dart';

//------------------pb_ajustes--------------------------------

class Cuenta extends StatelessWidget{
  Widget build (BuildContext context){
    return ajustes(
      texto: 'Cuenta',
      alignment: Alignment.center,
      fontSize: 18,
      cambio: PbAjustesCuenta.id,
    );
  }
}

class Notificaciones extends StatelessWidget{
  Widget build (BuildContext context){
    return ajustes(
      texto: 'Notificaciones',
      alignment: Alignment.center,
      fontSize: 18,
      cambio: PbAjustesNotificaciones.id,
    );
  }
}

class PrivacidadySeguridad extends StatelessWidget{
  Widget build (BuildContext context){
    return ajustes(
      texto: 'Privacidad y Seguridad',
      alignment: Alignment.center,
      fontSize: 18,
      cambio: PbAjustesPrivacidadYSeguridad.id,
    );
  }
}

class Centrodeayudaysoporte extends StatelessWidget{
  Widget build (BuildContext context){
    return ajustes(
      texto: 'Centro de ayuda y soporte',
      alignment: Alignment.center,
      fontSize: 18,
      cambio: PbAjustesCentroDeAyudaYSoporte.id,
    );
  }
}

class Funcionesexperimentalesobeta extends StatelessWidget{
  Widget build (BuildContext context){
    return ajustes(
      texto: 'Funciones experimentales o beta',
      alignment: Alignment.center,
      fontSize: 18,
      cambio: PbAjustesFuncionesExperimentalesOBeta.id,
    );
  }
}

class Sesion extends StatelessWidget{
  Widget build (BuildContext context){
    return ajustes(
      texto: 'Sesión',
      alignment: Alignment.topCenter,
      fontSize: 18,
      cambio: PbAjustesSesion.id,
    );
  }
}

//------------------pb_ajustes_Cuenta----------------------------

class Informacionpersonal extends StatelessWidget{
  Widget build (BuildContext context){
    return ajustes(
      texto: 'Información personal',
      alignment: Alignment.topCenter,
      fontSize: 18,
      cambio: PbFeed.id,
    );
  }
} 

class Cambiarcontrasena extends StatelessWidget{
  Widget build (BuildContext context){
    return ajustes(
      texto: 'Cambiar contraseña',
      alignment: Alignment.topCenter,
      fontSize: 18,
      cambio: PbFeed.id,
    );
  }
} 

class Actividaddeiniciodesesion extends StatelessWidget{
  Widget build (BuildContext context){
    return ajustes(
      texto: 'Actividad de inicio de sesión',
      alignment: Alignment.topCenter,
      fontSize: 18,
      cambio: PbFeed.id,
    );
  }
} 

class Estadodelacuenta extends StatelessWidget{
  Widget build (BuildContext context){
    return ajustes(
      texto: 'Estado de la cuenta',
      alignment: Alignment.topCenter,
      fontSize: 18,
      cambio: PbFeed.id,
    );
  }
} 

class Idioma extends StatelessWidget{
  Widget build (BuildContext context){
    return ajustes(
      texto: 'Idioma',
      alignment: Alignment.topCenter,
      fontSize: 18,
      cambio: PbFeed.id,
    );
  }
}

//------------------pb_ajustes_Notificaciones----------------------------

class LikesComentariosSeguidores extends StatelessWidget{
  Widget build (BuildContext context){
    return ajustes(
      texto: 'likes, comentarios, seguidores',
      alignment: Alignment.topCenter,
      fontSize: 18,
      cambio: PbFeed.id,
    );
  }
}

class EmailySMS extends StatelessWidget{
  Widget build (BuildContext context){
    return ajustes(
      texto: 'Email y SMS',
      alignment: Alignment.topCenter,
      fontSize: 18,
      cambio: PbFeed.id,
    );
  }
}

class Actividaddeamigos extends StatelessWidget{
  Widget build (BuildContext context){
    return ajustes(
      texto: 'Actividad de amigos',
      alignment: Alignment.topCenter,
      fontSize: 18,
      cambio: PbFeed.id,
    );
  }
}

class Recordatorios extends StatelessWidget{
  Widget build (BuildContext context){
    return ajustes(
      texto: 'Recordatorios',
      alignment: Alignment.topCenter,
      fontSize: 18,
      cambio: PbFeed.id,
    );
  }
}

//------------------pb_ajustes_Privacidad_y_Seguridad----------------------------

class Cuentaprivadapublica extends StatelessWidget{
  Widget build (BuildContext context){
    return ajustes(
      texto: 'Cuenta privada/pública',
      alignment: Alignment.topCenter,
      fontSize: 18,
      cambio: PbFeed.id,
    );
  }
}

class Bloqueadosysilenciados extends StatelessWidget{
  Widget build (BuildContext context){
    return ajustes(
      texto: 'Bloqueados y silenciados',
      alignment: Alignment.topCenter,
      fontSize: 18,
      cambio: PbFeed.id,
    );
  }
}

//------------------pb_ajustes_Centro_de_ayuda_y_soporte----------------------------

class Reportarunproblema extends StatelessWidget{
  Widget build (BuildContext context){
    return ajustes(
      texto: 'Reportar un problema',
      alignment: Alignment.topCenter,
      fontSize: 18,
      cambio: PbFeed.id,
    );
  }
}

class Contactarsoporte extends StatelessWidget{
  Widget build (BuildContext context){
    return ajustes(
      texto: 'Contactar soporte',
      alignment: Alignment.topCenter,
      fontSize: 18,
      cambio: PbFeed.id,
    );
  }
}

//------------------pb_ajustes_Funciones_experimentales_o_beta----------------------------

class Accesoanticipado extends StatelessWidget{
  Widget build (BuildContext context){
    return ajustes(
      texto: 'Acceso anticipado',
      alignment: Alignment.topCenter,
      fontSize: 18,
      cambio: PbFeed.id,
    );
  }
}

class Participarenelprogramabeta extends StatelessWidget{
  Widget build (BuildContext context){
    return ajustes(
      texto: 'Participar en el programa beta',
      alignment: Alignment.topCenter,
      fontSize: 18,
      cambio: PbFeed.id,
    );
  }
}

//------------------pb_ajustes_Sesion----------------------------

class Cerrarsesion extends StatelessWidget{
  Widget build (BuildContext context){
    return ajustes(
      texto: 'Cerrar sesión',
      alignment: Alignment.topCenter,
      fontSize: 18,
      cambio: PbFeed.id,
    );
  }
}

class Eliminarcuenta extends StatelessWidget{
  Widget build (BuildContext context){
    return ajustes(
      texto: 'Eliminar cuenta',
      alignment: Alignment.topCenter,
      fontSize: 18,
      cambio: PbFeed.id,
    );
  }
}

class Desactivarcuentatemporalmente extends StatelessWidget{
  Widget build (BuildContext context){
    return ajustes(
      texto: 'Desactivar cuenta temporalmente',
      alignment: Alignment.topCenter,
      fontSize: 18,
      cambio: PbFeed.id,
    );
  }
}


//------------------------------------------------------------------------------------

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
              color: _isHovering ? const Color(0xFF4E4F50) : Colors.white, // Cambia color si está hover
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
