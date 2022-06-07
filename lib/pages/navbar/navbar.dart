import 'package:apperro/pages/navbar/pages/comida.dart';
import 'package:apperro/pages/navbar/pages/initial_home.dart';
import 'package:apperro/pages/navbar/pages/last_home.dart';
import 'package:apperro/pages/navbar/pages/ubicacion.dart';
import 'package:apperro/palette.dart';
import 'package:apperro/widgets/rounded_button.dart';
import 'package:apperro/widgets/texto.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key key}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  bool flag = true;
  bool flag2 = true;
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    if (flag2) {
      FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser.uid)
          .collection('perros')
          .limit(1)
          .get()
          .then((snapshot) {
        if (snapshot.size == 0) {
          print(flag);
          setState(() {
            flag = false;
          });
        } else {
          setState(() {
            flag = true;
          });
        }
      });
      setState(() {
        flag2 = false;
      });
    }

    if (flag) {
      return Scaffold(
        body: DefaultTabController(
          length: 5,
          child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              elevation: 2,
              title: Text(
                "APPerro",
                style: GoogleFonts.nunito(
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                  color: Palette().primario,
                ),
              ),
              backgroundColor: Colors.white,
              toolbarHeight: 120,
              bottom: TabBar(
                indicatorColor: Palette().primario,
                labelColor: Palette().primario,
                unselectedLabelColor: Palette().primario2,
                tabs: [
                  Tab(
                    icon: Icon(Icons.home_rounded, size: 40),
                    iconMargin: EdgeInsets.only(top: 100),
                  ),
                  Tab(
                    icon: FaIcon(FontAwesomeIcons.bone, size: 30),
                  ),
                  Tab(
                    icon: Icon(Icons.notifications_rounded, size: 35),
                  ),
                  Tab(
                    icon: FaIcon(FontAwesomeIcons.mapMarkedAlt, size: 32),
                  ),
                  Tab(
                    icon: Icon(Icons.menu_rounded, size: 40),
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                LastHome(),
                Comida(),
                Container(
                  child: Text("3"),
                ),
                Ubicacion(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Texto(texto: user.email),
                    SizedBox(height: 20),
                    RoundedButton(
                      texto: "Cerrar Sesión",
                      funcion: () => {FirebaseAuth.instance.signOut()},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      return Scaffold(
        body: DefaultTabController(
          length: 5,
          child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              elevation: 2,
              title: Text(
                "APPerro",
                style: GoogleFonts.nunito(
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                  color: Palette().primario,
                ),
              ),
              backgroundColor: Colors.white,
              toolbarHeight: 120,
              bottom: TabBar(
                indicatorColor: Palette().primario,
                labelColor: Palette().primario,
                unselectedLabelColor: Palette().primario2,
                tabs: [
                  Tab(
                    icon: Icon(Icons.home_rounded, size: 40),
                    iconMargin: EdgeInsets.only(top: 100),
                  ),
                  Tab(
                    icon: FaIcon(FontAwesomeIcons.bone, size: 30),
                  ),
                  Tab(
                    icon: Icon(Icons.notifications_rounded, size: 35),
                  ),
                  Tab(
                    icon: FaIcon(FontAwesomeIcons.mapMarkedAlt, size: 32),
                  ),
                  Tab(
                    icon: Icon(Icons.menu_rounded, size: 40),
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                InitialHome(),
                Comida(),
                Container(
                  child: Text("3"),
                ),
                Ubicacion(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Texto(texto: user.email),
                    SizedBox(height: 20),
                    RoundedButton(
                      texto: "Cerrar Sesión",
                      funcion: () => {FirebaseAuth.instance.signOut()},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}
