import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Texto extends StatelessWidget {
  const Texto({
    Key key,
    @required this.texto,
    this.color,
    this.size,
    this.align,
    this.weight,
  }) : super(key: key);

  final String texto;
  final Color color;
  final double size;
  final TextAlign align;
  final FontWeight weight;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        texto,
        textAlign: align ?? TextAlign.center,
        style: GoogleFonts.montserrat(
          fontSize: size ?? 15,
          color: color ?? Colors.black,
          fontWeight: weight ?? FontWeight.w400,
        ),
      ),
    );
  }
}
