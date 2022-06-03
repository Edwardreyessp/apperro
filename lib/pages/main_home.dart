import 'package:apperro/pages/iniciar_sesion.dart';
import 'package:apperro/pages/registrarse.dart';
import 'package:apperro/palette.dart';
import 'package:apperro/widgets/rounded_button.dart';
import 'package:apperro/widgets/texto.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class MainHome extends StatelessWidget {
  const MainHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/images/fondo.jpg',
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 26, top: 19),
                    child: Logo(color: Palette().primario),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RoundedButton(
                    texto: "Iniciar Sesión",
                    funcion: () => {sesion(context)},
                  ),
                  SizedBox(height: 20),
                  RoundedButton(
                    color: Colors.white,
                    texto: "Registrarse",
                    colorLetra: Palette().primario,
                    funcion: () => {
                      resgitrarse(context),
                    },
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 24, top: 50),
                    child: Texto(
                      color: Palette().primario,
                      texto: "© Todos los derechos reservados",
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  sesion(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const IniciarSesion()));
  }

  resgitrarse(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Registrarse()));
  }
}

class Logo extends StatelessWidget {
  const Logo({Key key, this.color}) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: SvgPicture.asset(
          'assets/images/logo.svg',
          semanticsLabel: 'APPerro Logo',
          color: color,
          width: 111,
        ),
      ),
    );
  }
}
