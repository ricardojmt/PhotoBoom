import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class flechainicio extends StatelessWidget{
  Widget build (BuildContext context){
    return Botonvolver(
      icon: Icons.arrow_back,
    );
  }
}

class Botonvolver extends StatelessWidget {
  final IconData? icon;

  const Botonvolver({
    this.icon,
    });
  
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: IconButton(
        icon: Icon(icon, color: Colors.black),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
