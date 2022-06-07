import 'package:apperro/palette.dart';
import 'package:apperro/widgets/texto.dart';
import 'package:flutter/material.dart';

class Food extends StatelessWidget {
  const Food({
    Key key,
    @required PageController controller,
  })  : _controller = controller,
        super(key: key);

  final PageController _controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: double.infinity,
        margin: EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          border: Border.all(color: Palette().primario2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 50,
              width: double.infinity,
              child: PageView(
                controller: _controller,
                onPageChanged: (value) => _onchanged(value),
                children: [
                  Column(
                    children: [
                      Texto(texto: "Hola"),
                    ],
                  ),
                  Column(
                    children: [
                      Texto(texto: "Adiós"),
                    ],
                  ),
                ],
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
