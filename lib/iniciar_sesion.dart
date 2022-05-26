import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:apperro/main.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:apperro/home.dart';

class IniciarSesion extends StatelessWidget {
  const IniciarSesion({Key key}) : super(key: key);

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
            InputText(
              hint: "Correo",
            ),
            SizedBox(
              height: 22,
            ),
            InputText(
              hint: "Contraseña",
            ),
            SizedBox(
              height: 22,
            ),
            Button(
                color: primario,
                colorLetra: Colors.white,
                texto: "Iniciar Sesion",
                funcion: () => {goHome(context)}),
            SizedBox(
              height: 22,
            ),
            Text(
              "¿Olvidaste tu contraseña?",
              style: GoogleFonts.montserrat(fontSize: 15),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonSociales(
                  primario2: primario2,
                  icono: FontAwesomeIcons.google,
                  texto: "Iniciar Sesión",
                ),
                ButtonSociales(
                  primario2: primario2,
                  icono: FontAwesomeIcons.facebook,
                  texto: "Iniciar Sesión",
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Texto(
                  color: gray,
                  size: 15,
                  texto: "¿No tienes una cuenta?",
                ),
                SizedBox(
                  width: 6,
                ),
                Texto(
                  color: Colors.black,
                  size: 15,
                  texto: "Regístrate",
                ),
              ],
            ),
            SizedBox(
              height: 45,
            ),
          ],
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'assets/images/fondo_inicio_sesion.jpg',
              ),
              fit: BoxFit.fill),
        ),
      ),
    ));
  }

  goHome(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Home()));
  }
}

class Texto extends StatelessWidget {
  const Texto({
    Key key,
    @required this.color,
    @required this.texto,
    @required this.size,
  }) : super(key: key);

  final Color color;
  final String texto;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Text(
      texto,
      style: GoogleFonts.montserrat(fontSize: size, color: color),
    );
  }
}

class ButtonSociales extends StatelessWidget {
  const ButtonSociales({
    Key key,
    @required this.primario2,
    @required this.icono,
    @required this.texto,
  }) : super(key: key);

  final Color primario2;
  final IconData icono;
  final String texto;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {},
        child: Container(
          width: 127,
          height: 48,
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              border: Border.all(color: primario2),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(
                icono,
                color: primario2,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                texto,
                style:
                    GoogleFonts.montserrat(color: Colors.black, fontSize: 13),
              )
            ],
          ),
        ));
  }
}

class InputText extends StatelessWidget {
  const InputText({
    Key key,
    @required this.hint,
  }) : super(key: key);

  final String hint;

  @override
  Widget build(BuildContext context) {
    final Color gray = Color.fromRGBO(136, 136, 136, 1);
    final Color input = Color.fromRGBO(236, 240, 242, 1);
    return Container(
      width: 313,
      height: 42,
      child: TextField(
          style: GoogleFonts.montserrat(color: gray),
          decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(30, 0, 0, 5),
              border: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide.none),
              hintText: hint,
              hintStyle: GoogleFonts.montserrat(color: gray),
              fillColor: input,
              filled: true)),
    );
  }
}
