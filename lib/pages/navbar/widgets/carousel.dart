import 'package:apperro/palette.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Carousel extends StatelessWidget {
  const Carousel({
    Key key,
    @required PageController controller,
  })  : _controller = controller,
        super(key: key);

  final PageController _controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 124,
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 50),
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
              children: [
                Image.asset('assets/images/food.png'),
                Image.asset('assets/images/no_food.png'),
              ],
            ),
          ),
          SmoothPageIndicator(
            controller: _controller,
            count: 2,
            onDotClicked: (index) => _onchanged(index),
            effect: WormEffect(
              activeDotColor: Color(0xFFC4C4C4),
              strokeWidth: 5,
              dotWidth: 10,
              dotHeight: 10,
            ),
          ),
        ],
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
