import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:apperro/pages/iniciar_sesion.dart';
import 'package:apperro/pages/registrarse.dart';
import 'package:apperro/palette.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Color primario = Color.fromRGBO(33, 150, 83, 1);

    return Scaffold(
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'assets/images/fondo.jpg',
              ),
              fit: BoxFit.cover),
        ),
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
                Button(
                    color: Palette().primario,
                    texto: "Iniciar Sesión",
                    colorLetra: Colors.white,
                    funcion: () => {sesion(context)}),
                Button(
                  color: Colors.white,
                  texto: "Registrarse",
                  colorLetra: Palette().primario,
                  funcion: () => {resgitrarse(context)},
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 24, top: 50),
                  child: Center(
                    child: Text(
                      "© Todos los derechos reservados",
                      style: GoogleFonts.montserrat(
                        fontSize: 15,
                        color: Palette().primario,
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      )),
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

class Button extends StatelessWidget {
  const Button({
    Key key,
    @required this.color,
    @required this.colorLetra,
    @required this.texto,
    @required this.funcion,
  }) : super(key: key);

  final Color color, colorLetra;
  final String texto;
  final Function funcion;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: funcion,
      child: Container(
          child: Center(
            child: Text(
              texto,
              style: GoogleFonts.montserrat(
                  color: colorLetra, fontWeight: FontWeight.w600),
            ),
          ),
          margin: EdgeInsets.only(bottom: 10),
          width: 313,
          height: 42,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(50),
          )),
    );
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
