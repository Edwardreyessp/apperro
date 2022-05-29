import 'package:apperro/palette.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavHome extends StatelessWidget {
  const NavHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            Container(
              child: Text("4"),
            ),
            Container(
              child: Text("5"),
            ),
          ],
        ),
      ),
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
