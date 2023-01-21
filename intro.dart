import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

class IntroPageWidget extends StatelessWidget {
  const IntroPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 375,
        height: 812,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(255, 31, 72, 1),
        ),
        child: Stack(children: <Widget>[
          Positioned(
              top: 0,
              left: 0,
              child: SizedBox(
                  width: 375,
                  height: 812,
                  // decoration: BoxDecoration(),
                  child: Stack(children: <Widget>[
                    Positioned(
                        top: 434,
                        left: 246,
                        child: Container(
                            width: 40,
                            height: 41.095890045166016,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                topRight: Radius.circular(12),
                                bottomLeft: Radius.circular(12),
                                bottomRight: Radius.circular(12),
                              ),
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/Tongue_png232.png'),
                                  fit: BoxFit.fitWidth),
                            ))),
                    // Positioned(
                    //     top: 628.12841796875,
                    //     left: 205,
                    //     child: Transform.rotate(
                    //       angle: 1.3499904704507069 * (Math.pi / 180),
                    //       child: Container(
                    //           width: 175.23275756835938,
                    //           height: 204.88526916503906,
                    //           decoration: BoxDecoration(
                    //             image: DecorationImage(
                    //                 image: AssetImage(
                    //                     'assets/images/Junkfoodtransparentbackground1.png'),
                    //                 fit: BoxFit.fitWidth),
                    //           )),
                    //     )),
                    Positioned(
                        top: 323,
                        left: 71,
                        child: Container(
                            width: 232,
                            height: 165,
                            child: const CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/images/Foodie1.png'),
                            ))),
                  ]))),
        ]));
  }
}
