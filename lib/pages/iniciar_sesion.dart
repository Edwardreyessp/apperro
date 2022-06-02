import 'package:apperro/main.dart';
import 'package:apperro/pages/registrarse.dart';
import 'package:apperro/widgets/input_text.dart';
import 'package:apperro/widgets/rounded_button.dart';
import 'package:apperro/widgets/texto.dart';
import 'package:apperro/widgets/social_button.dart';

import 'package:apperro/palette.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:apperro/pages/navbar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IniciarSesion extends StatefulWidget {
  const IniciarSesion({Key key}) : super(key: key);

  @override
  _IniciarSesionState createState() => _IniciarSesionState();
}

class _IniciarSesionState extends State<IniciarSesion> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/fondo_inicio_sesion.jpg',
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: StreamBuilder<User>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshop) {
            if (snapshop.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshop.hasError) {
              return Center(
                child: Text("Algo salió mal..."),
              );
            } else if (snapshop.hasData) {
              return NavBar();
            } else {
              return SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InputText(
                      hint: "Correo",
                      controller: emailController,
                    ),
                    SizedBox(height: 22),
                    InputText(
                      hint: "Contraseña",
                      controller: passwordController,
                    ),
                    SizedBox(height: 22),
                    RoundedButton(
                      texto: "Iniciar Sesion",
                      funcion: () => {signIn()},
                    ),
                    SizedBox(height: 22),
                    Texto(texto: "¿Olvidaste tu contraseña?"),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SocialButton(
                          icono: FontAwesomeIcons.google,
                          texto: "Iniciar Sesión",
                        ),
                        SocialButton(
                          icono: FontAwesomeIcons.facebook,
                          texto: "Iniciar Sesión",
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Texto(
                          color: Palette().grayLetra,
                          texto: "¿No tienes una cuenta?",
                        ),
                        SizedBox(width: 6),
                        TextButton(
                          onPressed: () => {goRegistrarse(context)},
                          child: Texto(
                            texto: "Regístrate",
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 45),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }

  Future signIn() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(
        child: CircularProgressIndicator(),
      ),
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      print(e);
    }

    navigatorKey.currentState.popUntil((route) => route.isFirst);
  }

  goRegistrarse(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Registrarse()));
  }
}
