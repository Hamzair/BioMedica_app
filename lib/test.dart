import 'package:flutter/material.dart';

class GroupchatWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator GroupchatWidget - GROUP
    return Container(
        width: 81.14239501953125,
        height: 88.2605972290039,
        child: Stack(children: <Widget>[
          Positioned(
              top: 0,
              left: 0.4469856321811676,
              child: Container(
                  width: 80.6954116821289,
                  height: 88.2605972290039,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5.873500823974609),
                      topRight: Radius.circular(5.873500823974609),
                      bottomLeft: Radius.circular(5.873500823974609),
                      bottomRight: Radius.circular(5.873500823974609),
                    ),
                    color: Color.fromRGBO(18, 26, 26, 0.25),
                    border: Border.all(
                      color: Color.fromRGBO(0, 28, 49, 1),
                      width: 1.2000000476837158,
                    ),
                  ))),
          Positioned(
              top: 112.7807388305664,
              left: -101.45919799804688,
              child: Container(
                  width: 33.325626373291016,
                  height: 33.325626373291016,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24.744491577148438),
                      topRight: Radius.circular(24.744491577148438),
                      bottomLeft: Radius.circular(24.744491577148438),
                      bottomRight: Radius.circular(24.744491577148438),
                    ),
                    color: Color.fromRGBO(189, 53, 236, 0.6499999761581421),
                  ),
                  child: Stack(children: <Widget>[
                    Positioned(
                        top: 8.405122756958008,
                        left: 8.771068572998047,
                        child: Container(
                            width: 17.620500564575195,
                            height: 17.620500564575195,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/Image5.png'),
                                  fit: BoxFit.fitWidth),
                            ))),
                  ]))),
          Positioned(
              top: 7.043466567993164,
              left: 0.00001272531517315656,
              child: Container(
                  width: 80.6954116821289,
                  height: 62.30409240722656,
                  child: Stack(children: <Widget>[
                    Positioned(
                        top: 0,
                        left: 26.47811508178711,
                        child: Container(
                            width: 25.229337692260742,
                            height: 35.304237365722656,
                            child: Stack(children: <Widget>[
                              Positioned(
                                  top: 4.751240253448486,
                                  left: 1.8297017812728882,
                                  child: Container(
                                      width: 23.399608612060547,
                                      height: 23.399608612060547,
                                      child: Stack(children: <Widget>[
                                        Positioned(
                                          top: 0,
                                          left: 0,
                                          child: Text('siuu'),
                                        ),
                                      ]))),
                              Positioned(
                                  top: 0,
                                  left: 0,
                                  child: Container(
                                      width: 25.217313766479492,
                                      height: 35.304237365722656,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/Untitleddesign341.png'),
                                            fit: BoxFit.fitWidth),
                                      ))),
                            ]))),
                    Positioned(
                        top: 45.912837982177734,
                        left: 0,
                        child: Text(
                          'Physiology',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontFamily: 'Jost',
                              fontSize: 13,
                              letterSpacing: 0.1468375325202942,
                              fontWeight: FontWeight.normal,
                              height: 1.5 /*PERCENT not supported*/
                              ),
                        )),
                  ]))),
        ]));
  }
}
