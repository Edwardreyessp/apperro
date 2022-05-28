import 'package:flutter/material.dart';
import 'package:apperro/main.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:apperro/pages/iniciar_sesion.dart';

class Registrarse extends StatefulWidget {
  const Registrarse({Key key}) : super(key: key);

  @override
  _RegistrarseState createState() => _RegistrarseState();
}

class _RegistrarseState extends State<Registrarse> {
  @override
  Widget build(BuildContext context) {
    final Color gray = Color.fromRGBO(136, 136, 136, 1);
    Color primario = Color.fromRGBO(33, 150, 83, 1);
    Color primario2 = Color.fromRGBO(111, 207, 151, 1);

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
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
              Button(
                color: primario,
                colorLetra: Colors.white,
                texto: "Iniciar Sesion",
                funcion: () => {},
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtonSociales(
                    primario2: primario2,
                    icono: FontAwesomeIcons.google,
                    texto: "Registrarse",
                    funcion: () {},
                  ),
                  ButtonSociales(
                    primario2: primario2,
                    icono: FontAwesomeIcons.facebook,
                    texto: "Registrarse",
                    funcion: () {},
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Texto(
                    color: gray,
                    size: 15,
                    texto: "¿Ya tienes una cuenta?",
                  ),
                  SizedBox(width: 6),
                  Texto(
                    color: Colors.black,
                    size: 15,
                    texto: "Inicia Sesión",
                  ),
                ],
              ),
              SizedBox(height: 45),
            ],
          ),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/fondo_registrarse.jpg'),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
