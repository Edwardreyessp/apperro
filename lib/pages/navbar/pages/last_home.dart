import 'package:flutter/material.dart';

class LastHome extends StatelessWidget {
  const LastHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Text("Los perros despertaron, cabrones"),
      ),
    );
  }
}
