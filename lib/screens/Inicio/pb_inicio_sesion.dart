import 'package:flutter/material.dart';
import 'package:photoboom/components/datosgenerales.dart';
import 'package:photoboom/components/botonconfirmacion.dart';
import 'package:photoboom/core/app_colores.dart';
import 'package:photoboom/core/app_tipo_text.dart';
<<<<<<< HEAD:lib/screens/pb_inicio_sesion.dart
import 'package:photoboom/components/logo.dart';
import 'package:photoboom/screens/pb_feed.dart';
import 'package:photoboom/screens/pb_olvide_contrasena.dart';
import 'package:photoboom/screens/pb_registrarse.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
=======
import 'package:photoboom/screens/Inicio/pb_olvide_contrasena.dart';
import 'package:photoboom/screens/Inicio/pb_registrarse.dart';
>>>>>>> origin/Ricardo:lib/screens/Inicio/pb_inicio_sesion.dart

class PbInicioSesion extends StatelessWidget {
  static String id = "pb_inicio_sesion";
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;

      if (user != null) {
        //verifica si existe la colección users en firestore
        DocumentSnapshot userDocs = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();

        if (userDocs.exists) {
          await FirebaseFirestore.instance
              .collection('users')
              .doc(user.uid)
              .update({
            'uid': user.uid,
            'email': user.email,
            'Lastlogin': FieldValue.serverTimestamp(),
          });
        } else {
          await FirebaseFirestore.instance
              .collection('users')
              .doc(user.uid)
              .set({
            'uid': user.uid,
            'email': user.email,
            'CreatedAt': FieldValue.serverTimestamp(),
            'isVerified': user.emailVerified,
          });
          return null;
        }
      } else {
        return 'No se pudo obtener información del usuario.';
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No se encontró el usuario con ese correo.';
      } else if (e.code == 'wrong-password') {
        return 'Contraseña incorrecta';
      } else {
        print('Error al iniciar sesión: ${e.message}');
        return null;
      }
    } catch (e) {
      print('Error desconocido: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColores.backgrounds,
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Logogrande(),
            SizedBox(
              height: 20.0,
            ),
            Correo(
              controller: emailController,
            ),
            SizedBox(
              height: 15.0,
            ),
            Contras(
              controller: passwordController,
            ),
            SizedBox(
              height: 15.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, PbOlvideContrasena.id);
                  },
                  child: Text("olvide mi contraseña",
                      style: AppTipoText.textopequeno),
                ),
              ],
            ),
            SizedBox(
              height: 15.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () async {
                    // Simula los valores de email y contraseña por ahora
                    String email = emailController.text.trim();
                    String password = passwordController.text.trim();
                    if (email.isEmpty || password.isEmpty) {
                      print("Por favor, completa los campos.");
                      return;
                    }

                    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                        .hasMatch(email)) {
                      print("El correo electrónico no es válido.");
                      return;
                    }

                    // Llamada a la función de inicio de sesión
                    String? errorMessage =
                        await signInWithEmailAndPassword(email, password);

                    if (errorMessage == null) {
                      //Si no hay error en la autenticación, navega al feed
                      Navigator.pushNamed(context, PbInicioSesion.id);
                    } else {
                      print('Error:$errorMessage');
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(errorMessage),
                      ));
                    }
                  },
                  child: Text("Iniciar sesión", style: AppTipoText.texto),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, PbRegistrarse.id);
                  },
                  child: Text("Registrarse", style: AppTipoText.texto),
                ),
              ],
            ),
            SizedBox(
              height: 15.0,
            ),
            Iniciar(),
          ]),
        ),
      ),
    );
  }
}
