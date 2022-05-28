import 'package:apperro/widgets/input_text.dart';
import 'package:apperro/widgets/rounded_button.dart';
import 'package:apperro/widgets/texto.dart';
import 'package:apperro/widgets/social_button.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:apperro/pages/iniciar_sesion.dart';

import '../palette.dart';

class Registrarse extends StatefulWidget {
  const Registrarse({Key key}) : super(key: key);

  @override
  _RegistrarseState createState() => _RegistrarseState();
}

class _RegistrarseState extends State<Registrarse> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/fondo_registrarse.jpg'),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InputText(hint: "Fecha de nacimiento"),
              SizedBox(height: 22),
              InputText(hint: "Usuario"),
              SizedBox(height: 22),
              InputText(hint: "Correo"),
              SizedBox(height: 22),
              InputText(hint: "Contraseña"),
              SizedBox(height: 22),
              RoundedButton(
                texto: "Iniciar Sesion",
                funcion: () => {},
              ),
              SizedBox(height: 5),
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
                  Texto(texto: "Inicia Sesión"),
                ],
              ),
              SizedBox(height: 45),
            ],
          ),
        ),
      ),
    );
  }
}
