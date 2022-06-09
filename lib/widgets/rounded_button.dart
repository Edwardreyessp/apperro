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
    this.width,
    this.height,
  }) : super(key: key);

  final String texto;
  final Color color, colorLetra;
  final Function funcion;
  final double width, height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 313,
      height: height ?? 42,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(color ?? Palette().primario),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          )),
        ),
        onPressed: funcion ?? () {},
        child: Center(
          child: Text(
            texto,
            style: GoogleFonts.montserrat(
              color: colorLetra ?? Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
