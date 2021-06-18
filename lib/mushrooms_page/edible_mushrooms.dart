import 'dart:math';

import 'package:flutter/material.dart';

import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';
import 'package:get/get.dart';

class EdibleMushRoute extends StatelessWidget {
  String text =
      'https://play.google.com/store/apps/details?id=com.deepmush_app&hl=tr';
  String subject = 'Download the app.';
  List<String> imagePaths = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(230, 233, 242, 1),
      appBar: AppBar(
          leading: BackButton(color: Colors.black),
          title: SelectableText('ediblemushrooms'.tr,
              style: TextStyle(
                fontFamily: 'Comfortaa',
                color: Color.fromRGBO(8, 56, 99, 1),
              )),
          backgroundColor: Color.fromRGBO(230, 233, 242, 1),
          centerTitle: true),
      //backgroundColor: Color.fromRGBO(61, 62, 61, 1)),
      body: Container(
          child: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <
            Widget>[
          ClipPath(
            clipper: CurvedBottomClipper(),
            child: Container(
              margin: EdgeInsets.only(top: 0),
              color: Color.fromRGBO(250, 211, 127, 1),
              height: 300.0,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 0),
                  child: Image(
                    image: AssetImage(
                      'assets/about_mushrooms/arastirma.png',
                    ),
                    width: 400,
                    height: 400,
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 30, top: 35, right: 30, bottom: 50),
            width: 400,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  margin:
                      EdgeInsets.only(left: 10, top: 15, right: 10, bottom: 15),
                  child: Image(
                    image: AssetImage(
                      'assets/about_mushrooms/mushrooms_page.png',
                    ),
                    width: 180,
                    height: 180,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin:
                      EdgeInsets.only(left: 10, top: 15, right: 10, bottom: 0),
                  child: SelectableText(
                    'ediblemushrooms'.tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Comfortaa',
                        fontSize: 25,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Divider(
                  color: Colors.black,
                  thickness: 1.6,
                  indent: 35,
                  endIndent: 35,
                ),
                Container(
                  margin:
                      EdgeInsets.only(left: 10, top: 25, right: 10, bottom: 5),
                  child: SelectableText(
                    "edibletext".tr,
                    style: TextStyle(
                        fontFamily: 'Comfortaa',
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: new BorderRadius.circular(16.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // gölgenin pozisyonunu değiştir
                ),
              ],
            ),
          )
        ]),
      )),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        backgroundColor: Color.fromRGBO(250, 211, 127, 1),
        children: [
          SpeedDialChild(
              child: Icon(Icons.contact_mail),
              label: "contact".tr,
              backgroundColor: Color.fromRGBO(250, 211, 127, 1),
              onTap: () {
                _launchMail();
              }),
          SpeedDialChild(
              child: Icon(Icons.star_rate),
              label: "rate".tr,
              backgroundColor: Color.fromRGBO(250, 211, 127, 1),
              onTap: () => _launchGooglePlay()),
          SpeedDialChild(
              child: Icon(Icons.share),
              label: "share".tr,
              backgroundColor: Color.fromRGBO(250, 231, 127, 1),
              onTap: () => {
                    _onShare(context),
                  }),
        ],
      ),
    );
  }

  _onShare(BuildContext context) async {
    final RenderBox box = context.findRenderObject() as RenderBox;

    if (imagePaths.isNotEmpty) {
      await Share.shareFiles(imagePaths,
          text: text,
          subject: subject,
          sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
    } else {
      await Share.share(text,
          subject: subject,
          sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
    }
  }
}

_launchMail() async {
  const url = 'mailto:gursesarmuttcu@gmail.com?subject=News&body=New%20plugin';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchGooglePlay() async {
  const url =
      'https://play.google.com/store/apps/details?id=com.deepmush_app&hl=tr';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
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
