import 'package:apperro/palette.dart';
import 'package:apperro/widgets/rounded_button.dart';
import 'package:apperro/widgets/texto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return DefaultTabController(
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
            HomeBar(),
            Container(
              child: Text("2"),
            ),
            Container(
              child: Text("3"),
            ),
            Ubicacion(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Texto(texto: user.email),
                RoundedButton(
                  texto: "Cerrar Sesión",
                  funcion: () => {FirebaseAuth.instance.signOut()},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Ubicacion extends StatelessWidget {
  const Ubicacion({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RoundedButton(
          texto: "Comming soon...",
          color: Colors.redAccent,
        ),
        Container(
          height: 350,
          child: Image.asset('assets/map.png'),
        ),
        SizedBox(height: 20),
        RoundedButton(
          texto: "Presiona para buscar lugares",
          color: Colors.redAccent,
        ),
        RoundedButton(
          texto: "Agregar nueva ubicación",
          color: Colors.redAccent,
        ),
      ],
    );
  }
}

class HomeBar extends StatelessWidget {
  const HomeBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("1"),
    );
  }
}
