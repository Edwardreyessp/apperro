import 'package:apperro/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashPage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute(builder: (_) => SplashPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(
          'assets/logo.svg',
          semanticsLabel: 'APPerro Logo',
          color: Palette().primario,
          width: 111,
        ),
        key: const Key('splash_bloc_image'),
        widthFactor: 150,
      ),
    );
  }
}
