import 'package:apperro/pages/iniciar_sesion.dart';
import 'package:apperro/widgets/input_text.dart';
import 'package:apperro/widgets/rounded_button.dart';
import 'package:apperro/widgets/texto.dart';
import 'package:apperro/widgets/social_button.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:apperro/palette.dart';
import 'package:apperro/main.dart';
import 'package:email_validator/email_validator.dart';

class Registrarse extends StatefulWidget {
  const Registrarse({Key key}) : super(key: key);

  @override
  _RegistrarseState createState() => _RegistrarseState();
}

class _RegistrarseState extends State<Registrarse> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  bool emailFlag = true;
  bool passwordFlag = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/fondo_registrarse.jpg'),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(height: 300),
              InputText(hint: "Fecha de nacimiento"),
              SizedBox(height: 22),
              InputText(
                hint: "Correo",
                controller: emailController,
              ),
              Texto(
                texto: emailFlag ? "" : "email inválido",
                color: Colors.redAccent,
              ),
              SizedBox(height: 5),
              InputText(
                hint: "Contraseña",
                controller: passwordController,
              ),
              Texto(
                texto: passwordFlag ? "" : "Debe tener más 6 caractéres",
                color: Colors.redAccent,
              ),
              SizedBox(height: 22),
              RoundedButton(
                texto: "Registrarse",
                funcion: () => {validacion()},
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialButton(
                    icono: FontAwesomeIcons.google,
                    texto: "Registrarse",
                  ),
                  SocialButton(
                    icono: FontAwesomeIcons.facebook,
                    texto: "Registrarse",
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Texto(
                    color: Palette().grayLetra,
                    texto: "¿Ya tienes una cuenta?",
                  ),
                  SizedBox(width: 6),
                  TextButton(
                    onPressed: () => {goIniciarSesion(context)},
                    child: Texto(texto: "Inicia Sesión"),
                  ),
                ],
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  goIniciarSesion(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const IniciarSesion()));
  }

  void validacion() {
    if (emailController.text.isEmpty ||
        !EmailValidator.validate(emailController.text.trim())) {
      setState(() {
        emailFlag = false;
      });
    } else {
      setState(() {
        emailFlag = true;
      });
    }

    if (passwordController.text.isEmpty ||
        !(passwordController.text.trim().length >= 6)) {
      setState(() {
        passwordFlag = false;
      });
    } else {
      setState(() {
        passwordFlag = true;
      });
    }

    if (emailFlag && passwordFlag) signUp();
  }

  Future signUp() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(
        child: CircularProgressIndicator(),
      ),
    );

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      print(e);
    }

    navigatorKey.currentState.popUntil((route) => route.isFirst);
  }
}
