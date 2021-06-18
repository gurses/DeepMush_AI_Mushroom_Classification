import 'dart:math';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

class Info extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return InfoState();
  }
}

class InfoState extends State<Info> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(230, 233, 242, 1),
      //backgroundColor: Colors.white,
      body: Container(
          child: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <
            Widget>[
          ClipPath(
            clipper: CurvedBottomClipper(),
            child: Container(
              margin: EdgeInsets.only(top: 0),
              color: Color.fromRGBO(255, 219, 108, 1),
              height: 300.0,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 0),
                  child: Image(
                    image: AssetImage(
                      'assets/info/info.png',
                    ),
                    width: 450,
                    height: 450,
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 30, top: 35, right: 30, bottom: 50),
            width: 330,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin:
                      EdgeInsets.only(left: 10, top: 15, right: 10, bottom: 15),
                  alignment: Alignment.center,
                  child: Image(
                    image: AssetImage(
                      'assets/info/info_screen.gif',
                    ),
                    width: 85,
                    height: 85,
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(left: 10, top: 5, right: 10, bottom: 0),
                  alignment: Alignment.center,
                  child: Text("whatdeepmush".tr,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Comfortaa',
                          fontSize: 18,
                          fontWeight: FontWeight.w700)),
                ),
                Divider(
                  color: Colors.black,
                  thickness: 1.6,
                  indent: 60,
                  endIndent: 60,
                ),
                Container(
                  margin:
                      EdgeInsets.only(left: 13, top: 15, right: 8, bottom: 5),
                  child: Text("whatdeepmushtext".tr,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Comfortaa',
                          fontSize: 15,
                          fontWeight: FontWeight.w600)),
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: new BorderRadius.circular(30.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // gölgenin pozisyonunu değiştir
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 30, top: 0, right: 30, bottom: 50),
            width: 330,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin:
                      EdgeInsets.only(left: 10, top: 15, right: 10, bottom: 15),
                  alignment: Alignment.center,
                  child: Image(
                    image: AssetImage(
                      'assets/info/ayar.gif',
                    ),
                    width: 90,
                    height: 90,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin:
                      EdgeInsets.only(left: 10, top: 5, right: 10, bottom: 0),
                  child: Text("howisworking".tr,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Comfortaa',
                          fontSize: 18,
                          fontWeight: FontWeight.w700)),
                ),
                Divider(
                  color: Colors.black,
                  thickness: 1.6,
                  indent: 60,
                  endIndent: 60,
                ),
                Container(
                  margin:
                      EdgeInsets.only(left: 13, top: 15, right: 8, bottom: 5),
                  child: Text("howisworkingtext".tr,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Comfortaa',
                          fontSize: 15,
                          fontWeight: FontWeight.w600)),
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: new BorderRadius.circular(30.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // gölgenin pozisyonunu değiştir
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 30, top: 10, right: 30, bottom: 50),
            width: 330,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin:
                      EdgeInsets.only(left: 10, top: 15, right: 10, bottom: 15),
                  alignment: Alignment.center,
                  child: Image(
                    image: AssetImage(
                      'assets/info/dikkat.gif',
                    ),
                    width: 90,
                    height: 90,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin:
                      EdgeInsets.only(left: 10, top: 5, right: 10, bottom: 0),
                  child: Text("attention".tr,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Comfortaa',
                          fontSize: 18,
                          fontWeight: FontWeight.w700)),
                ),
                Divider(
                  color: Colors.black,
                  thickness: 1.6,
                  indent: 60,
                  endIndent: 60,
                ),
                Container(
                  margin:
                      EdgeInsets.only(left: 13, top: 15, right: 13, bottom: 5),
                  child: Text("attentiontext".tr,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Comfortaa',
                          fontSize: 15,
                          fontWeight: FontWeight.w600)),
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: new BorderRadius.circular(30.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // gölgenin pozisyonunu değiştir
                ),
              ],
            ),
          ),
        ]),
      )),
    );
  }
}

class CurvedBottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final roundingHeight = size.height * 3 / 5;

    final filledRectangle =
        Rect.fromLTRB(0, 0, size.width, size.height - roundingHeight);

    final roundingRectangle = Rect.fromLTRB(
        -5, size.height - roundingHeight * 2, size.width + 5, size.height);

    final path = Path();
    path.addRect(filledRectangle);

    path.arcTo(roundingRectangle, pi, -pi, true);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
