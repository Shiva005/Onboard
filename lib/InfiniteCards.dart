import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:infinite_cards/infinite_cards.dart';

/** By:
 * https://pub.dev/packages/infinite_cards/
 */

class infiniteCards extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<infiniteCards> {
  InfiniteCardsController _controller;
  bool _isTypeSwitch = true;

  @override
  void initState() {
    super.initState();
    _controller = InfiniteCardsController(
      itemBuilder: _renderItem,
      itemCount: 5,
      animType: AnimType.SWITCH,
    );
  }

  Widget _renderItem(BuildContext context, int index) {
    return Image(
      image: AssetImage('assets/pic${index + 1}.jpg'),
    );
  }

  void _changeType(BuildContext context) {
    if (_isTypeSwitch) {
      _controller.reset(
        itemCount: 4,
        animType: AnimType.TO_FRONT,
        transformToBack: _customToBackTransform,
      );
    } else {
      _controller.reset(
        itemCount: 5,
        animType: AnimType.SWITCH,
        transformToBack: DefaultToBackTransform,
      );
    }
    _isTypeSwitch = !_isTypeSwitch;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        title: Text("InfiniteCards"),
      ),
      body: Column(
        children: <Widget>[
          InfiniteCards(
            background: Colors.blue[100],
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width * 1.3,
            controller: _controller,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                      topRight: Radius.circular(18),
                      bottomRight: Radius.circular(18),
                    ),
                    side: BorderSide(color: Colors.blue)),
                color: Colors.blue,
                onPressed: () {
                  _controller.reset(
                      animType:
                          _isTypeSwitch ? AnimType.SWITCH : AnimType.TO_FRONT);
                  _controller.previous();
                },
                child: Text(
                  "< Prev",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.red)),
                color: Colors.red,
                onPressed: () {
                  _changeType(context);
                },
                child: Text(
                  "Reset",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(18),
                      bottomLeft: Radius.circular(18),
                      topRight: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    side: BorderSide(color: Colors.blue)),
                color: Colors.blue,
                onPressed: () {
                  _controller.reset(animType: AnimType.TO_END);
                  _controller.next();
                },
                child: Text(
                  "Next >",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Transform _customToBackTransform(
    Widget item,
    double fraction,
    double curveFraction,
    double cardHeight,
    double cardWidth,
    int fromPosition,
    int toPosition) {
  int positionCount = fromPosition - toPosition;
  double scale = (0.8 - 0.1 * fromPosition) + (0.1 * fraction * positionCount);
  double rotateY;
  double translationX;
  if (fraction < 0.5) {
    translationX = cardWidth * fraction * 1.5;
    rotateY = math.pi / 2 * fraction;
  } else {
    translationX = cardWidth * 1.5 * (1 - fraction);
    rotateY = math.pi / 2 * (1 - fraction);
  }
  double interpolatorScale =
      0.8 - 0.1 * fromPosition + (0.1 * curveFraction * positionCount);
  double translationY = -cardHeight * (0.8 - interpolatorScale) * 0.5 -
      cardHeight * (0.02 * fromPosition - 0.02 * curveFraction * positionCount);
  return Transform.translate(
    offset: Offset(translationX, translationY),
    child: Transform.scale(
      scale: scale,
      child: Transform(
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.002)
          ..rotateY(rotateY),
        alignment: Alignment.center,
        child: item,
      ),
    ),
  );
}
