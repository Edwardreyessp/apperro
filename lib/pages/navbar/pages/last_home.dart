import 'package:apperro/model/perro.dart';
import 'package:apperro/pages/navbar/widgets/activity.dart';
import 'package:apperro/palette.dart';
import 'package:apperro/widgets/texto.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LastHome extends StatelessWidget {
  const LastHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder<List<Perro>>(
          stream: readPerro(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Texto(texto: "Ayuda");
            } else if (snapshot.hasData) {
              final perros = snapshot.data;
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 26),
                child: Column(
                  children: [
                    Activity(),
                    SizedBox(height: 20),
                    Container(
                      child: Expanded(
                        child: ListView(
                          children: perros.map(buildPerro).toList(),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }

  Stream<List<Perro>> readPerro() => FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser.uid)
      .collection('perros')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Perro.fromJson(doc.data())).toList());
}

Widget buildPerro(Perro perro) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10),
    width: 308,
    height: 124,
    decoration: BoxDecoration(
      border: Border.all(color: Palette().primario2),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Texto(texto: "${perro.name}"),
  );
}
