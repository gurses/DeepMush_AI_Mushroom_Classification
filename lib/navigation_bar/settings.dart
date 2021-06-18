import 'dart:math';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:loading_alert_dialog/loading_alert_dialog.dart';
import 'package:lottie/lottie.dart';

class Settings extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SettingsState();
  }
}

class SettingsState extends State<Settings> {
  String text =
      'https://play.google.com/store/apps/details?id=com.deepmush_app&hl=tr';
  String subject = 'Download the app.';
  List<String> imagePaths = [];
  int _randomNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(230, 233, 242, 1),
        //backgroundColor: Colors.white,
        body: Container(
          child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                ClipPath(
                  clipper: CurvedBottomClipper(),
                  child: Container(
                    margin: EdgeInsets.only(top: 0),
                    color: Color.fromRGBO(96, 182, 233, 1),
                    height: 300.0,
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 0),
                        child: Image(
                          image: AssetImage(
                            'assets/settings/settings.png',
                          ),
                          width: 410,
                          height: 410,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(left: 30, top: 30, right: 30, bottom: 30),
                  width: 330,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(
                            left: 10, top: 0, right: 10, bottom: 0),
                        alignment: Alignment.center,
                        child: Image(
                          image: AssetImage(
                            'assets/settings/settings.gif',
                          ),
                          width: 120,
                          height: 120,
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                            left: 10, top: 0, right: 10, bottom: 0),
                        child: Text(
                          "language".tr,
                          style: TextStyle(
                              fontFamily: 'Comfortaa',
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Divider(
                        color: Colors.black,
                        thickness: 1.6,
                        indent: 60,
                        endIndent: 60,
                      ),
                      Row(
                        //  Sağdan-Sola Hizalama
                        mainAxisAlignment: MainAxisAlignment.center,
                        //  Yukarıdan-Aşağıya Hizalama
                        crossAxisAlignment: CrossAxisAlignment.start,
                        //  Row içerisine eklenen diğer widgetların listesi
                        children: <Widget>[
                          InkWell(
                            onTap: () async {
                              _showAlert();
                              await Future.delayed(const Duration(seconds: 2),
                                  () {
                                Get.updateLocale(
                                    Get.locale = Locale('tr', 'TR'));
                              });
                            }, // handle your onTap here
                            child: Container(
                              margin: EdgeInsets.only(
                                  left: 10, top: 25, right: 10, bottom: 5),
                              width: 45,
                              height: 45,
                              child: Center(
                                child: Image.asset(
                                  "assets/language_icon/turkey.png",
                                  width: 45,
                                  height: 45,
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              _showAlert();
                              await Future.delayed(const Duration(seconds: 2),
                                  () {
                                Get.updateLocale(
                                    Get.locale = Locale('en', 'US'));
                              });
                            }, // handle your onTap here
                            child: Container(
                              margin: EdgeInsets.only(
                                  left: 10, top: 25, right: 10, bottom: 5),
                              width: 45,
                              height: 45,
                              child: Center(
                                child: Image.asset(
                                  "assets/language_icon/english.png",
                                  width: 45,
                                  height: 45,
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {}, // handle your onTap here
                            child: Container(
                              margin: EdgeInsets.only(
                                  left: 10, top: 25, right: 10, bottom: 5),
                              width: 45,
                              height: 45,
                              child: Center(
                                child: Image.asset(
                                  "assets/language_icon/spain.png",
                                  width: 45,
                                  height: 45,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                            left: 15, top: 15, right: 15, bottom: 5),
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
                  margin:
                      EdgeInsets.only(left: 30, top: 0, right: 30, bottom: 30),
                  width: 330,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                            left: 10, top: 15, right: 10, bottom: 0),
                        child: Text(
                          "social".tr,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Comfortaa',
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Divider(
                        color: Colors.black,
                        thickness: 1.6,
                        indent: 60,
                        endIndent: 60,
                      ),
                      Row(
                        //  Sağdan-Sola Hizalama
                        mainAxisAlignment: MainAxisAlignment.center,
                        //  Yukarıdan-Aşağıya Hizalama
                        crossAxisAlignment: CrossAxisAlignment.start,
                        //  Row içerisine eklenen diğer widgetların listesi
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              _launchFacebook();
                            }, // handle your onTap here
                            child: Container(
                              margin: EdgeInsets.only(
                                  left: 10, top: 25, right: 0, bottom: 15),
                              width: 45,
                              height: 45,
                              child: Center(
                                child: Image.asset(
                                  "assets/social_media/facebook.png",
                                  width: 45,
                                  height: 45,
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              _launchWhatsApp();
                            }, // handle your onTap here
                            child: Container(
                              margin: EdgeInsets.only(
                                  left: 10, top: 25, right: 0, bottom: 15),
                              width: 45,
                              height: 45,
                              child: Center(
                                child: Image.asset(
                                  "assets/social_media/whatsapp.png",
                                  width: 45,
                                  height: 45,
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              _launchInstagram();
                            }, // handle your onTap here
                            child: Container(
                              margin: EdgeInsets.only(
                                  left: 10, top: 25, right: 0, bottom: 15),
                              width: 45,
                              height: 45,
                              child: Center(
                                child: Image.asset(
                                  "assets/social_media/instagram.png",
                                  width: 45,
                                  height: 45,
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              _launchGithub();
                            }, // handle your onTap here
                            child: Container(
                              margin: EdgeInsets.only(
                                  left: 15, top: 25, right: 10, bottom: 30),
                              width: 45,
                              height: 45,
                              child: Center(
                                child: Image.asset(
                                  "assets/social_media/github.png",
                                  width: 45,
                                  height: 45,
                                ),
                              ),
                            ),
                          ),
                        ],
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
                  margin:
                      EdgeInsets.only(left: 30, top: 0, right: 30, bottom: 30),
                  width: 330,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                            left: 10, top: 15, right: 10, bottom: 0),
                        child: Text(
                          "shareDeepMush".tr,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Comfortaa',
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Divider(
                        color: Colors.black,
                        thickness: 1.6,
                        indent: 60,
                        endIndent: 60,
                      ),
                      Row(
                        //  Sağdan-Sola Hizalama
                        mainAxisAlignment: MainAxisAlignment.center,
                        //  Yukarıdan-Aşağıya Hizalama
                        crossAxisAlignment: CrossAxisAlignment.start,
                        //  Row içerisine eklenen diğer widgetların listesi
                        children: <Widget>[
                          InkWell(
                              onTap: () {
                                _onShare(context);
                              }, // handle your onTap here
                              child: Container(
                                margin: EdgeInsets.only(
                                    left: 10, top: 10, right: 20, bottom: 5),
                                width: 110,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: 10,
                                          top: 10,
                                          right: 10,
                                          bottom: 3),
                                      alignment: Alignment.center,
                                      // color: Color.fromRGBO(247, 248, 251, 1),
                                      child: Image(
                                        image: AssetImage(
                                          "assets/settings/share.png",
                                        ),
                                        width: 40,
                                        height: 40,
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      margin: EdgeInsets.only(
                                          left: 4, top: 5, right: 4, bottom: 0),
                                      child: Text(
                                        "share".tr,
                                        style: TextStyle(
                                            fontFamily: 'Comfortaa',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      margin: EdgeInsets.only(
                                          left: 15,
                                          top: 0,
                                          right: 15,
                                          bottom: 10),
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
                                      offset: Offset(0,
                                          3), // gölgenin pozisyonunu değiştir
                                    ),
                                  ],
                                ),
                              )),
                        ],
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                            left: 15, top: 15, right: 15, bottom: 5),
                        child: Text(
                          "share_rate".tr,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Comfortaa',
                              fontSize: 17,
                              fontWeight: FontWeight.w700),
                        ),
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
                  margin:
                      EdgeInsets.only(left: 30, top: 0, right: 30, bottom: 30),
                  width: 330,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                            left: 10, top: 15, right: 10, bottom: 0),
                        child: Text(
                          "feedback".tr,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Comfortaa',
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Divider(
                        color: Colors.black,
                        thickness: 1.6,
                        indent: 60,
                        endIndent: 60,
                      ),
                      Row(
                        //  Sağdan-Sola Hizalama
                        mainAxisAlignment: MainAxisAlignment.center,
                        //  Yukarıdan-Aşağıya Hizalama
                        crossAxisAlignment: CrossAxisAlignment.start,
                        //  Row içerisine eklenen diğer widgetların listesi
                        children: <Widget>[
                          InkWell(
                              onTap: () {
                                _launchGooglePlay();
                                Fluttertoast.showToast(
                                    msg: "toastgoogleplay".tr,
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor:
                                        Color.fromRGBO(63, 194, 130, 1),
                                    textColor: Colors.black,
                                    fontSize: 16.0);
                              }, // handle your onTap here
                              child: Container(
                                margin: EdgeInsets.only(
                                    left: 10, top: 10, right: 10, bottom: 10),
                                width: 110,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: 10,
                                          top: 10,
                                          right: 10,
                                          bottom: 3),
                                      alignment: Alignment.center,
                                      // color: Color.fromRGBO(247, 248, 251, 1),
                                      child: Image(
                                        image: AssetImage(
                                          "assets/social_media/google_play.png",
                                        ),
                                        width: 40,
                                        height: 40,
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      margin: EdgeInsets.only(
                                          left: 4, top: 5, right: 4, bottom: 0),
                                      child: Text(
                                        "rate".tr,
                                        style: TextStyle(
                                            fontFamily: 'Comfortaa',
                                            fontSize: 17,
                                            fontWeight: FontWeight.w700),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      margin: EdgeInsets.only(
                                          left: 15,
                                          top: 0,
                                          right: 15,
                                          bottom: 10),
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
                                      offset: Offset(0,
                                          3), // gölgenin pozisyonunu değiştir
                                    ),
                                  ],
                                ),
                              )),
                          InkWell(
                              onTap: () {
                                _launchMail();
                                Fluttertoast.showToast(
                                    msg: "toastmail".tr,
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor:
                                        Color.fromRGBO(63, 194, 130, 1),
                                    textColor: Colors.black,
                                    fontSize: 16.0);
                              }, // handle your onTap here
                              child: Container(
                                margin: EdgeInsets.only(
                                    left: 10, top: 10, right: 20, bottom: 10),
                                width: 110,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: 10,
                                          top: 10,
                                          right: 10,
                                          bottom: 3),
                                      alignment: Alignment.center,
                                      // color: Color.fromRGBO(247, 248, 251, 1),
                                      child: Image(
                                        image: AssetImage(
                                          "assets/social_media/gmail.png",
                                        ),
                                        width: 40,
                                        height: 40,
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      margin: EdgeInsets.only(
                                          left: 4, top: 5, right: 4, bottom: 0),
                                      child: Text(
                                        "contact".tr,
                                        style: TextStyle(
                                            fontFamily: 'Comfortaa',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      margin: EdgeInsets.only(
                                          left: 15,
                                          top: 0,
                                          right: 15,
                                          bottom: 10),
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
                                      offset: Offset(0,
                                          3), // gölgenin pozisyonunu değiştir
                                    ),
                                  ],
                                ),
                              )),
                        ],
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                            left: 15, top: 15, right: 15, bottom: 5),
                        child: Text(
                          "rate_mail".tr,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Comfortaa',
                              fontSize: 15,
                              fontWeight: FontWeight.w700),
                        ),
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
              ])),
        ));
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

  void _showAlert() {
    LoadingAlertDialog.showLoadingAlertDialog<int>(
      context: context,
      builder: (
        context,
      ) =>
          Card(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: <Widget>[
              Lottie.asset('assets/loading.json'),
              Text(
                "pls".tr,
                style: TextStyle(
                    fontFamily: 'Comfortaa',
                    fontSize: 14,
                    fontWeight: FontWeight.w700),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
          ),
        ),
        color: Colors.white,
      ),
      computation: Future.delayed(
        Duration(
          seconds: 4,
        ),
        () {
          final randomNumber = Random().nextInt(100);
          return randomNumber;
        },
      ),
    ).then(
      (number) {
        if (number != null) {
          setState(() {
            _randomNumber = number;
          });
        }
      },
    );
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

_launchMail() async {
  const url = 'mailto:gursesarmuttcu@gmail.com?subject=News&body=New%20plugin';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchWhatsApp() async {
  const url =
      "https://wa.me/?text=https://play.google.com/store/apps/details?id=com.deepmush_app&hl=tr";
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw "Could not launch $url";
  }
}

_launchFacebook() async {
  const url = 'https://www.facebook.com/gursesarmutcuu/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchInstagram() async {
  const url = 'https://www.instagram.com/gursesarmuttcu/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchGithub() async {
  const url = 'https://github.com/gurses';
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
