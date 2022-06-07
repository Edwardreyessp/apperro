import 'package:apperro/palette.dart';
import 'package:apperro/widgets/texto.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

final _controller = PageController();

class Carousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          border: Border.all(color: Palette().primario2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                child: PageView(
                  onPageChanged: (value) => _onchanged(value),
                  controller: _controller,
                  children: [
                    Food(),
                    NoFood(),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: SmoothPageIndicator(
                controller: _controller,
                count: 2,
                effect: WormEffect(
                  dotColor: Colors.black12,
                  activeDotColor: Color(0xFFC4C4C4),
                  dotWidth: 10,
                  dotHeight: 10,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onchanged(int index) {
    _controller.animateToPage(
      index,
      duration: Duration(milliseconds: 500),
      curve: Curves.fastOutSlowIn,
    );
  }
}

class NoFood extends StatelessWidget {
  const NoFood({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/images/no_food.png'),
        SizedBox(height: 20),
        Texto(texto: "Comida no recomendada", weight: FontWeight.w700),
        SizedBox(height: 20),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFood(texto: "Huesos"),
                TextFood(texto: "Uva"),
                TextFood(texto: "Cebolla"),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icono(color: Palette().rojo),
                Icono(color: Palette().rojo),
                Icono(color: Palette().rojo),
              ],
            ),
          ],
        )
      ],
    );
  }
}

class Food extends StatelessWidget {
  const Food({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/images/food.png'),
        SizedBox(height: 20),
        Texto(texto: "Comida recomendada", weight: FontWeight.w700),
        SizedBox(height: 20),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFood(texto: "Pescado"),
                TextFood(texto: "Carne"),
                TextFood(texto: "Piña"),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icono(),
                Icono(),
                Icono(),
              ],
            ),
          ],
        )
      ],
    );
  }
}

class TextFood extends StatelessWidget {
  const TextFood({
    Key key,
    @required this.texto,
  }) : super(key: key);

  final String texto;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Texto(texto: texto),
    );
  }
}

class Icono extends StatelessWidget {
  const Icono({
    Key key,
    this.color,
  }) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: FaIcon(
        FontAwesomeIcons.solidCheckCircle,
        size: 18,
        color: color ?? Palette().primario2,
      ),
    );
  }
}
