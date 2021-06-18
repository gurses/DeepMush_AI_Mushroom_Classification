import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tflite_example/mushrooms_page/about_mushrooms.dart';
import 'package:tflite_example/mushrooms_page/edible_mushrooms.dart';
import 'package:tflite_example/mushrooms_page/medical_assistance.dart';
import 'package:tflite_example/mushrooms_page/poisonous_mushrooms.dart';
import 'package:get/get.dart';

class Mushrooms extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MushroomsState();
  }
}

class MushroomsState extends State<Mushrooms> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color.fromRGBO(48, 48, 48, 1),
      backgroundColor: Color.fromRGBO(230, 233, 242, 1),
      body: Container(
          child: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <
            Widget>[
          ClipPath(
            clipper: CurvedBottomClipper(),
            child: Container(
              margin: EdgeInsets.only(top: 0),
              color: Color.fromRGBO(0, 239, 209, 1),
              height: 300.0,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 0),
                  child: Image(
                    image: AssetImage(
                      'assets/about_mushrooms/mushrooms.png',
                    ),
                    width: 300,
                    height: 300,
                  ),
                ),
              ),
            ),
          ),
          Container(
            child: ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutMushRoute()),
                );
              },
              leading: ImageIcon(
                AssetImage(
                  "assets/about_mushrooms/mushrooms_list1.png",
                ),
                color: Colors.amber,
              ),
              title: Text("mushrooms".tr,
                  style: TextStyle(
                      fontFamily: 'Comfortaa',
                      fontSize: 18,
                      fontWeight: FontWeight.w700)),
              subtitle: Text("moreinfo".tr,
                  style: TextStyle(
                      fontFamily: 'Comfortaa',
                      fontSize: 14,
                      fontWeight: FontWeight.w700)),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
              ),
            ),
            margin: EdgeInsets.only(left: 30, top: 30, right: 30, bottom: 10),
            height: 80,
            width: 320,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              // color: Color.fromRGBO(245, 177, 163, 1),
              borderRadius: new BorderRadius.circular(30.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), //gölgenin pozisyonunu değiştir
                ),
              ],
            ),
          ),
          Container(
            child: ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PoisonousMushRoute()),
                );
              },
              leading: ImageIcon(
                AssetImage(
                  "assets/about_mushrooms/mushrooms_list2.png",
                ),
                color: Colors.purple,
              ),
              title: Text("poisonousmushrooms".tr,
                  style: TextStyle(
                      fontFamily: 'Comfortaa',
                      fontSize: 18,
                      fontWeight: FontWeight.w700)),
              subtitle: Text("moreinfo".tr,
                  style: TextStyle(
                      fontFamily: 'Comfortaa',
                      fontSize: 14,
                      fontWeight: FontWeight.w700)),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
              ),
            ),
            margin: EdgeInsets.only(left: 30, top: 10, right: 30, bottom: 10),
            height: 80,
            width: 320,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              //color: Color.fromRGBO(196, 121, 242, 1),
              borderRadius: new BorderRadius.circular(30.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), //gölgenin pozisyonunu değiştir
                ),
              ],
            ),
          ),
          Container(
            child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EdibleMushRoute()),
                  );
                },
                leading: ImageIcon(
                  AssetImage(
                    "assets/about_mushrooms/mushrooms_list3.png",
                  ),
                  color: Colors.green,
                ),
                title: Text("ediblemushrooms".tr,
                    style: TextStyle(
                        fontFamily: 'Comfortaa',
                        fontSize: 18,
                        fontWeight: FontWeight.w700)),
                subtitle: Text("moreinfo".tr,
                    style: TextStyle(
                        fontFamily: 'Comfortaa',
                        fontSize: 14,
                        fontWeight: FontWeight.w700)),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                )),
            margin: EdgeInsets.only(left: 30, top: 10, right: 30, bottom: 10),
            height: 80,
            width: 320,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              //color: Color.fromRGBO(244, 175, 101, 1),
              borderRadius: new BorderRadius.circular(30.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), //gölgenin pozisyonunu değiştir
                ),
              ],
            ),
          ),
          Container(
            child: ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MedicalRoute()),
                );
              },
              leading: ImageIcon(
                AssetImage(
                  "assets/about_mushrooms/mushrooms_list4.png",
                ),
                color: Colors.red,
              ),
              title: Text('medicalassitance'.tr,
                  style: TextStyle(
                      fontFamily: 'Comfortaa',
                      fontSize: 18,
                      fontWeight: FontWeight.w700)),
              subtitle: Text("moreinfo".tr,
                  style: TextStyle(
                      fontFamily: 'Comfortaa',
                      fontSize: 13,
                      fontWeight: FontWeight.w700)),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
              ),
            ),
            margin: EdgeInsets.only(left: 30, top: 10, right: 30, bottom: 10),
            height: 80,
            width: 320,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              //color: Color.fromRGBO(154, 159, 248, 1),
              borderRadius: new BorderRadius.circular(30.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), //gölgenin pozisyonunu değiştir
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
