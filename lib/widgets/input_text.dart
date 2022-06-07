import 'package:apperro/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class InputText extends StatelessWidget {
  const InputText({
    Key key,
    @required this.hint,
    this.controller,
    this.inputType,
    this.formatter,
  }) : super(key: key);

  final String hint;
  final TextEditingController controller;
  final TextInputType inputType;
  final TextInputFormatter formatter;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 313,
      height: 42,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: controller ?? null,
        style: GoogleFonts.montserrat(color: Palette().grayLetra),
        keyboardType: inputType ?? TextInputType.text,
        inputFormatters: [
          formatter ?? FilteringTextInputFormatter.singleLineFormatter
        ],
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
