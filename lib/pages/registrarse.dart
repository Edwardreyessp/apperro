import 'package:apperro/model/user.dart';
import 'package:apperro/pages/iniciar_sesion.dart';
import 'package:apperro/widgets/input_text.dart';
import 'package:apperro/widgets/rounded_button.dart';
import 'package:apperro/widgets/texto.dart';
import 'package:apperro/widgets/social_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  final dateController = TextEditingController();
  final userController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    dateController.dispose();
    userController.dispose();
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
              InputText(
                hint: "Fecha de nacimiento",
                controller: dateController,
                inputType: TextInputType.datetime,
                formatter: FilteringTextInputFormatter.allow(RegExp('[0-9/]')),
              ),
              InputText(
                hint: "Usuario",
                controller: userController,
              ),
              InputText(
                hint: "Correo",
                controller: emailController,
                inputType: TextInputType.emailAddress,
              ),
              Email(emailFlag: emailFlag),
              InputText(
                hint: "Contraseña",
                controller: passwordController,
                inputType: TextInputType.visiblePassword,
              ),
              Password(passwordFlag: passwordFlag),
              SizedBox(height: 10),
              RoundedButton(
                texto: "Registrarse",
                funcion: () => {validacion()},
              ),
              SizedBox(height: 20),
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
              SizedBox(height: 20),
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

    final docUser = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser.uid);

    final user = MyUser(
      id: FirebaseAuth.instance.currentUser.uid,
      name: userController.text.trim(),
      email: emailController.text.trim(),
      birthday: dateController.text.trim(),
    );

    await docUser.set(user.toJson());
  }
}

class Password extends StatelessWidget {
  const Password({
    Key key,
    @required this.passwordFlag,
  }) : super(key: key);

  final bool passwordFlag;

  @override
  Widget build(BuildContext context) {
    if (passwordFlag) {
      return Container();
    } else {
      return Texto(
        texto: passwordFlag ? "" : "Debe tener más 6 caractéres",
        color: Colors.redAccent,
      );
    }
  }
}

class Email extends StatelessWidget {
  const Email({
    Key key,
    @required this.emailFlag,
  }) : super(key: key);

  final bool emailFlag;

  @override
  Widget build(BuildContext context) {
    if (emailFlag) {
      return Container();
    } else {
      return Texto(
        texto: emailFlag ? "" : "email inválido",
        color: Colors.redAccent,
      );
    }
  }
}
