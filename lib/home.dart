import 'package:apperro/iniciar_sesion.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color primario = Color.fromRGBO(33, 150, 83, 1);
    Color primario2 = Color.fromRGBO(111, 207, 151, 1);
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("APPerro", style: GoogleFonts.montserrat(fontSize: 40, fontWeight: FontWeight.w400, color: primario),),
          backgroundColor: Colors.white,
          toolbarHeight: 150,
          bottom: TabBar(
            indicatorColor: primario,
            labelPadding: EdgeInsets.zero,
            tabs: [
              Tab(text: "", icon: Icon(Icons.home, color: primario2, size: 50,), iconMargin: EdgeInsets.only(bottom: 2),),
              Tab(text: "", icon: FaIcon(FontAwesomeIcons.bone, color: primario2,),),
              Tab(text: "", icon: Icon(Icons.notifications, color: primario2,),),
              Tab(text: "", icon: Icon(Icons.menu, color: primario2,),),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Container(
              child: Text("1"),
            ),
            Container(
              child: Text("2"),
            ),
            Container(
              child: Text("3"),
            ),
            Container(
              child: Text("4"),
            ),
          ],
        ),
      ),
    );
  }
}