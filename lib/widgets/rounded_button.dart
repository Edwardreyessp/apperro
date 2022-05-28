import 'package:apperro/palette.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key key,
    @required this.texto,
    this.color,
    this.colorLetra,
    this.funcion,
    this.size,
    this.width,
    this.height,
  }) : super(key: key);

  final String texto;
  final Color color, colorLetra;
  final Function funcion;
  final double size, width, height;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: funcion ?? () {},
      child: Container(
        child: Center(
          child: Text(
            texto,
            style: GoogleFonts.montserrat(
              color: colorLetra ?? Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        margin: EdgeInsets.only(bottom: 10),
        width: width ?? 313,
        height: height ?? 42,
        decoration: BoxDecoration(
          color: color ?? Palette().primario,
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }
}
