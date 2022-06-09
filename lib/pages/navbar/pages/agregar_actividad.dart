import 'package:apperro/model/actividad.dart';
import 'package:apperro/pages/navbar/navbar.dart';
import 'package:apperro/pages/navbar/pages/last_home.dart';
import 'package:apperro/widgets/input_text.dart';
import 'package:apperro/widgets/rounded_button.dart';
import 'package:apperro/widgets/texto.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AgregarActividad extends StatefulWidget {
  const AgregarActividad({Key key}) : super(key: key);

  @override
  _AgregarActividadState createState() => _AgregarActividadState();
}

class _AgregarActividadState extends State<AgregarActividad> {
  final nameController = TextEditingController();
  final dateController = TextEditingController();
  final activityController = TextEditingController();
  List activities;
  bool flag = true;

  @override
  void dispose() {
    nameController.dispose();
    dateController.dispose();
    activityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Texto(
                texto: "¡Agregar Actividad!",
                weight: FontWeight.w700,
              ),
              SizedBox(height: 10),
              InputText(
                hint: "Nombre de tu amigo",
                controller: nameController,
              ),
              InputText(
                hint: "Fecha programada",
                controller: dateController,
              ),
              InputText(
                hint: "Actividad",
                controller: activityController,
              ),
              SizedBox(height: 10),
              RoundedButton(
                texto: "Agregar",
                funcion: () => {agregar(context)},
              ),
            ],
          ),
        ),
      ),
    );
  }

  agregar(BuildContext context) {
    Actividad activity = Actividad(
      dogName: nameController.text.trim(),
      time: dateController.text.trim(),
      activity: activityController.text.trim(),
    );

    DocumentReference documentReference = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser.uid);

    documentReference.get().then((datasnapshot) => {
          activities = datasnapshot.data().values.elementAt(2),
          actualizar(activities, activity.toJson()),
        });

    activities.add(activity.toJson());

    documentReference.update({
      'activities': activities,
    });

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const NavBar()));
  }

  actualizar(List newList, Map<String, dynamic> json) {
    if (flag) {
      setState(() {
        activities = newList;
        flag = false;
      });
    }
  }
}
