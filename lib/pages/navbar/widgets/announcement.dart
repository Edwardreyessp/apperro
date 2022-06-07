import 'package:apperro/palette.dart';
import 'package:apperro/widgets/rounded_button.dart';
import 'package:apperro/widgets/texto.dart';
import 'package:flutter/material.dart';

class Announcement extends StatelessWidget {
  const Announcement({
    Key key,
    @required this.name,
    @required this.text,
    @required this.textButton,
    this.imageWidth,
    this.imageHeight,
    this.textWidth,
    this.funcion,
  }) : super(key: key);

  final String name;
  final String text;
  final String textButton;
  final double imageWidth;
  final double imageHeight;
  final double textWidth;
  final Function funcion;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 35),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 340,
            height: 124,
            decoration: BoxDecoration(
              border: Border.all(color: Palette().primario2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  name,
                  height: imageHeight ?? 65,
                  width: imageWidth ?? 65,
                ),
                Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: textWidth ?? 160,
                        child: Texto(texto: text),
                      ),
                      RoundedButton(
                        texto: textButton,
                        width: 117,
                        height: 32,
                        color: Palette().primario2,
                        funcion: funcion,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
