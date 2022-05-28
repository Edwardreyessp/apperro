import 'package:apperro/palette.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({
    Key key,
    @required this.icono,
    @required this.texto,
    this.funcion,
  }) : super(key: key);

  final IconData icono;
  final String texto;
  final Function funcion;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: funcion ?? () {},
      child: Container(
        width: 127,
        height: 48,
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          border: Border.all(color: Palette().primario2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(
              icono,
              color: Palette().primario2,
            ),
            SizedBox(width: 5),
            Text(
              texto,
              style: GoogleFonts.montserrat(
                color: Colors.black,
                fontSize: 13,
              ),
            )
          ],
        ),
      ),
    );
  }
}
