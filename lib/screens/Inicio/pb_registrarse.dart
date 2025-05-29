import 'package:flutter/material.dart';
import 'package:photoboom/components/botonconfirmacion.dart';
import 'package:photoboom/components/datosgenerales.dart';
import 'package:photoboom/components/logo.dart';
import 'package:photoboom/core/app_colores.dart';
import 'package:photoboom/core/app_tipo_text.dart';
import 'package:photoboom/screens/pb_inicio_sesion.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:photoboom/screens/Inicio/pb_inicio_sesion.dart';

class PbRegistrarse extends StatelessWidget {
  static String id = "pb_resgistrarse";
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController nameuserController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FirebaseAuth _registerauth = FirebaseAuth.instance;

  Future<String?> registeruser(
      String fullname, String nameuser, String email, String password) async {
    try {
      UserCredential userCredential = await _registerauth
          .createUserWithEmailAndPassword(email: email, password: password);

      User? user = userCredential.user;

      if (user != null) {
        await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
          'fullname': fullname,
          'nameuser': nameuser,
          'uid': user.uid,
          'email': user.email,
          'isVerified': user.emailVerified,
          'CreatedAt': FieldValue.serverTimestamp(),
        });
      }
      return null;
    } catch (e) {
      print('Error al registrarse:$e');
      return e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColores.backgrounds,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Logogrande(),
              SizedBox(height: 20.0),
              Nombre(controller: fullnameController),
              SizedBox(height: 20.0),
              Usuario(controller: nameuserController),
              SizedBox(height: 15.0),
              Correo(controller: emailController),
              SizedBox(height: 15.0),
              Contras(controller: passwordController),
              SizedBox(height: 15.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, PbInicioSesion.id);
                    },
                    child: Text("Iniciar sesión", style: AppTipoText.texto),
                  ),
                  GestureDetector(
                    onTap: () async {
                      String email = emailController.text.trim();
                      String password = passwordController.text.trim();
                      String fullname = fullnameController.text;
                      String nameuser = nameuserController.text.trim();

                      if (email.isEmpty ||
                          password.isEmpty ||
                          fullname.isEmpty ||
                          nameuser.isEmpty) {
                        print('Rellena todos los campos.');
                        return;
                      }

                      if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                          .hasMatch(email)) {
                        print("El correo electrónico no es válido.");
                        return;
                      }

                      String? user = await registeruser(
                          fullname, nameuser, email, password);
                      if (user == null) {
                        Navigator.pop(context);
                      } else {
                        print('Error:$user');
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(user),
                        ));
                      }
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        "Registrarse",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15.0),
              // Registrarme(), // Eliminado
            ],
          ),
        ),
      ),
    );
  }
}
