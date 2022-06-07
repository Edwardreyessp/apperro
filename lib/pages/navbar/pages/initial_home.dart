import 'package:apperro/pages/navbar/widgets/announcement.dart';
import 'package:apperro/pages/registrar_perro.dart';
import 'package:flutter/material.dart';

class InitialHome extends StatelessWidget {
  const InitialHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Announcement(
              name: 'assets/images/perro.png',
              text: 'Agrega a tu perro para descurbrir nuevas funciones!',
              textButton: 'Agregar',
              imageHeight: 98.16,
              imageWidth: 70,
              funcion: () => {agregar(context)},
            ),
            Announcement(
              name: 'assets/images/perro2.png',
              text: 'Conoce lo necesario para tener un perro feliz',
              textButton: 'Ver más',
              textWidth: 185,
            ),
            Announcement(
              name: 'assets/images/pethouse.png',
              text: 'Encuentra a tu amigo ideal',
              textButton: 'Adoptar',
            ),
            Announcement(
              name: 'assets/images/veterinario.png',
              text: '¿Eres veterinario?',
              textButton: 'Ayudar',
            ),
            SizedBox(height: 35),
          ],
        ),
      ),
    );
  }

  agregar(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const RegistrarPerro()));
  }
}
