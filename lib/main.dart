import 'package:apperro/pages/navbar/navbar.dart';
import 'package:apperro/pages/main_home.dart';
import 'package:apperro/pages/navbar/pages/tipo_usuario.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  await Firebase.initializeApp();
  runApp(MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'APPerro',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String data;
  bool flag = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshop) {
          if (snapshop.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshop.hasError) {
            return Center(
              child: Text("Algo salió mal..."),
            );
          } else if (snapshop.hasData) {
            actualizar();
            if (data == "") {
              return TipoUsuario();
            } else {
              return NavBar();
            }
          } else {
            return MainHome();
          }
        },
      ),
    );
  }

  actualizar() async {
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser.uid);
    documentReference.get().then((datasnapshot) => {
          data = datasnapshot.data().values.elementAt(1),
          actualizar2(data),
        });
  }

  actualizar2(String newdata) {
    if (flag) {
      setState(() {
        data = newdata;
        flag = false;
      });
    }
  }
}
