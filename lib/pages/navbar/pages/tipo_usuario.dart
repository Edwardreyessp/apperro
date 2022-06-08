import 'package:apperro/pages/navbar/widgets/announcement.dart';
import 'package:apperro/palette.dart';
import 'package:apperro/widgets/texto.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:apperro/main.dart';

class TipoUsuario extends StatelessWidget {
  const TipoUsuario({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser.uid);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Texto(
              texto: "¡Cuéntanos más sobre ti!",
              size: 20,
              weight: FontWeight.w700,
            ),
            SizedBox(height: 30),
            SvgPicture.asset(
              'assets/images/logo.svg',
              semanticsLabel: 'APPerro Logo',
              color: Palette().primario,
              width: 111,
            ),
            Announcement(
              name: 'assets/images/perro2.png',
              text: "Cuida a tus propios perros",
              textButton: "Cuidar",
              widthButton: 160,
              funcion: () => {tipoUsuario(documentReference, "Dueño", context)},
            ),
            Announcement(
              name: 'assets/images/pethouse.png',
              text: "¿Eres un centro de adopción?",
              textButton: "Brindar servicio",
              widthButton: 160,
              funcion: () => {
                tipoUsuario(documentReference, "Centro Veterinario", context)
              },
            ),
            Announcement(
              name: 'assets/images/veterinario.png',
              text: "¿Eres veterinario?",
              textButton: "Ayudar",
              widthButton: 160,
              funcion: () =>
                  {tipoUsuario(documentReference, "Veterinario", context)},
            ),
          ],
        ),
      ),
    );
  }

  tipoUsuario(DocumentReference doc, String type, BuildContext context) {
    doc.update({
      'typeUser': type,
    });
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MainPage()));
  }
}
