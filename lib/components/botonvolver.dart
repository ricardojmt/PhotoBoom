import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photoboom/core/app_colores.dart';


class flechainicio extends StatelessWidget{
  Widget build (BuildContext context){
    return Botonvolver(
      icon: Icons.arrow_back,
      color: AppColores.fristtext,
    );
  }
}

class feed extends StatelessWidget{
  Widget build (BuildContext context){
    return Botonvolver(
      icon: Icons.remove_red_eye,
      color: AppColores.logotext,
    );
  }
}

class retos extends StatelessWidget{
  Widget build (BuildContext context){
    return Botonvolver(
      icon: Icons.fiber_new_rounded,
      color: AppColores.logotext,
    );
  }
}

class fotos extends StatelessWidget{
  Widget build (BuildContext context){
    return Botonvolver(
      icon: Icons.camera_alt_rounded,
      color: AppColores.logotext,
    );
  }
}

class corazon extends StatelessWidget{
  Widget build (BuildContext context){
    return Botonvolver(
      icon: Icons.heart_broken_sharp,
      color: AppColores.logotext,
    );
  }
}

class perfil extends StatelessWidget{
  Widget build (BuildContext context){
    return Botonvolver(
      icon: Icons.person,
      color: AppColores.logotext,
    );
  }
}

class Botonvolver extends StatelessWidget {
  final IconData? icon;
  final Color? color;

  const Botonvolver({
    this.icon,
    this.color,
    });
  
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: IconButton(
        icon: Icon(icon, color: color),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
