import 'package:apperro/widgets/rounded_button.dart';
import 'package:flutter/material.dart';

class Ubicacion extends StatelessWidget {
  const Ubicacion({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30, bottom: 20),
          child: RoundedButton(
            texto: "Comming soon...",
            color: Colors.redAccent,
          ),
        ),
        Container(
          height: 350,
          child: Image.asset('assets/images/map.png'),
        ),
        SizedBox(height: 20),
        RoundedButton(
          texto: "Presiona para buscar lugares",
          color: Colors.redAccent,
        ),
        SizedBox(height: 20),
        RoundedButton(
          texto: "Agregar nueva ubicación",
          color: Colors.redAccent,
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
