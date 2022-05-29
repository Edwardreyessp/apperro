import 'package:apperro/widgets/input_text.dart';
import 'package:apperro/widgets/rounded_button.dart';
import 'package:apperro/widgets/texto.dart';
import 'package:apperro/widgets/social_button.dart';

import 'package:apperro/palette.dart';
import 'package:flutter/material.dart';
import 'package:apperro/pages/navhome.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IniciarSesion extends StatelessWidget {
  const IniciarSesion({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/images/fondo_inicio_sesion.jpg',
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InputText(hint: "Correo"),
              SizedBox(height: 22),
              InputText(hint: "Contraseña"),
              SizedBox(height: 22),
              RoundedButton(
                texto: "Iniciar Sesion",
                funcion: () => {goHome(context)},
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
                  Texto(texto: "Regístrate"),
                ],
              ),
              SizedBox(height: 45),
            ],
          ),
        ),
      ),
    );
  }

  goHome(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const NavHome()));
  }
}
