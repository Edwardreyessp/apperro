import 'package:apperro/palette.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputText extends StatelessWidget {
  const InputText({
    Key key,
    @required this.hint,
  }) : super(key: key);

  final String hint;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 313,
      height: 42,
      child: TextField(
        style: GoogleFonts.montserrat(color: Palette().grayLetra),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(30, 0, 0, 5),
          border: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide.none,
          ),
          hintText: hint,
          hintStyle: GoogleFonts.montserrat(color: Palette().grayLetra),
          fillColor: Palette().grayArea,
          filled: true,
        ),
      ),
    );
  }
}
