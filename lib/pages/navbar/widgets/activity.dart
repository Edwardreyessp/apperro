import 'package:apperro/pages/navbar/pages/agregar_actividad.dart';
import 'package:apperro/pages/registrar_perro.dart';
import 'package:apperro/palette.dart';
import 'package:apperro/widgets/rounded_button.dart';
import 'package:apperro/widgets/texto.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Activity extends StatefulWidget {
  const Activity({Key key}) : super(key: key);

  @override
  _ActivityState createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  List activities;
  bool flag = true;
  int len = 0;
  dynamic task;

  @override
  Widget build(BuildContext context) {
    actualizar();
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: 340,
        height: 175,
        decoration: BoxDecoration(
          border: Border.all(color: Palette().primario2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset('assets/images/perro.png'),
                    TextButton(
                      onPressed: () => {goRegistrarPerro(context)},
                      child: FaIcon(
                        FontAwesomeIcons.plusCircle,
                        size: 32,
                        color: Palette().primario,
                      ),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Texto(
                      texto: "Próximas tareas:",
                      weight: FontWeight.w700,
                    ),
                    Container(
                      width: 125,
                      height: 80,
                      child: ListView.builder(
                        itemCount: len,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.symmetric(vertical: 5),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.schedule,
                                  size: 32,
                                ),
                                SizedBox(width: 5),
                                Texto(texto: activities[index]['activity']),
                              ],
                            ),
                          );
                        },
                      ),
                    )
                  ],
                )
              ],
            ),
            RoundedButton(
              texto: "Agregar actividad",
              width: 269,
              height: 32,
              color: Palette().primario2,
              funcion: () => {goAgregar(context)},
            )
          ],
        ),
      ),
    );
  }

  goRegistrarPerro(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const RegistrarPerro()));
  }

  goAgregar(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const AgregarActividad()));
  }

  actualizar() {
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser.uid);

    documentReference.get().then((datasnapshot) => {
          activities = datasnapshot.data().values.elementAt(2),
          update(activities),
        });
  }

  update(List lastActivities) {
    if (flag) {
      setState(() {
        activities = lastActivities;
        flag = false;
        len = activities.length;
      });
    }
  }
}
