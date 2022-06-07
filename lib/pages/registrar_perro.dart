import 'package:apperro/model/perro.dart';
import 'package:apperro/pages/navbar/navbar.dart';
import 'package:apperro/palette.dart';
import 'package:apperro/widgets/input_text.dart';
import 'package:apperro/widgets/rounded_button.dart';
import 'package:apperro/widgets/texto.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegistrarPerro extends StatefulWidget {
  const RegistrarPerro({Key key}) : super(key: key);

  @override
  _RegistrarPerroState createState() => _RegistrarPerroState();
}

class _RegistrarPerroState extends State<RegistrarPerro> {
  final nombreController = TextEditingController();
  final fechaController = TextEditingController();
  final edadController = TextEditingController();
  final sizeController = TextEditingController();
  final razaController = TextEditingController();
  final descController = TextEditingController();

  @override
  void dispose() {
    nombreController.dispose();
    fechaController.dispose();
    edadController.dispose();
    sizeController.dispose();
    razaController.dispose();
    descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Align(
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Texto(
                  texto: "¡Agrega a un amigo!",
                  size: 26,
                ),
                SizedBox(height: 20),
                SvgPicture.asset(
                  'assets/images/logo_apperro.svg',
                  semanticsLabel: 'APPerro Logo',
                  color: Palette().primario,
                  width: 111,
                ),
                SizedBox(height: 20),
                InputText(
                  hint: "Nombre",
                  controller: nombreController,
                ),
                InputText(
                  hint: "Fecha de nacimiento",
                  controller: fechaController,
                ),
                InputText(
                  hint: "Edad",
                  controller: edadController,
                  inputType: TextInputType.number,
                ),
                InputText(
                  hint: "Tamaño",
                  controller: sizeController,
                ),
                InputText(
                  hint: "Raza",
                  controller: razaController,
                ),
                InputText(
                  hint: "Descripción",
                  controller: descController,
                ),
                SizedBox(height: 10),
                RoundedButton(
                  texto: "Registrar amigo",
                  funcion: () => {registrar()},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future registrar() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(
        child: CircularProgressIndicator(),
      ),
    );

    final docPerro = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser.uid)
        .collection('perros')
        .doc();

    final perro = Perro(
      id: docPerro.id,
      name: nombreController.text.trim(),
      birthday: fechaController.text.trim(),
      age: edadController.text.trim(),
      size: sizeController.text.trim(),
      race: razaController.text.trim(),
      desc: descController.text.trim(),
    );

    await docPerro.set(perro.toJson());

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const NavBar()));
  }
}
