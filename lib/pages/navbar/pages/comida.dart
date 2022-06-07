import 'package:apperro/pages/navbar/widgets/carousel.dart';
import 'package:apperro/palette.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Comida extends StatefulWidget {
  @override
  _ComidaState createState() => _ComidaState();
}

class _ComidaState extends State<Comida> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 26, vertical: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Alimento',
                style: GoogleFonts.comicNeue(
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                  color: Palette().primario,
                ),
              ),
            ],
          ),
          Carousel(),
        ],
      ),
    );
  }
}
