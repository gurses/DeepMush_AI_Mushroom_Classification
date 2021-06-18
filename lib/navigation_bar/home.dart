import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';

import 'package:image_picker/image_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State {
  List _outputs;
  File _image;
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _loading = true;

    loadModel().then((value) {
      setState(() {
        _loading = false;
      });
    });
  }

  pickImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (image == null) return null;
    setState(() {
      _loading = true;
      _image = image;
    });
    classifyImage(image);
  }

  pickImageCamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    if (image == null) return null;
    setState(() {
      _loading = true;
      _image = image;
    });
    classifyImage(image);
  }

  classifyImage(File image) async {
    var output = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 2,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      _loading = false;
      _outputs = output;
    });
  }

  loadModel() async {
    await Tflite.loadModel(
      model: "assets/model.tflite",
      labels: "assets/labels.txt",
    );
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(230, 233, 242, 1),
      //backgroundColor: Colors.white,
      body: Center(
          child: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <
            Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
          ),
          _image == null
              ? Container(
                  margin:
                      EdgeInsets.only(left: 10, top: 5, right: 10, bottom: 30),
                  width: 330,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(
                            left: 10, top: 10, right: 10, bottom: 3),
                        alignment: Alignment.center,
                        // color: Color.fromRGBO(247, 248, 251, 1),
                        child: Image(
                          image: AssetImage(
                            "assets/home_image/arama.png",
                          ),
                          width: 200,
                          height: 200,
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                            left: 4, top: 5, right: 4, bottom: 0),
                        child: Text(
                          "arama".tr,
                          style: TextStyle(
                            fontFamily: 'Comfortaa',
                            fontWeight: FontWeight.w700,
                            fontSize: 21,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                            left: 15, top: 0, right: 15, bottom: 10),
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
                )
              : ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child: Image.file(_image,
                      width: 300, height: 250, fit: BoxFit.cover),
                ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                  onTap: () {
                    pickImageCamera();
                    // _showMyDialog();

                    Fluttertoast.showToast(
                        msg: "toastcamera".tr,
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Color.fromRGBO(230, 233, 242, 1),
                        textColor: Colors.black,
                        fontSize: 16.0);
                  }, // handle y// handle your onTap here
                  child: Container(
                    margin: EdgeInsets.only(
                        left: 10, top: 10, right: 20, bottom: 20),
                    width: 110,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(
                              left: 10, top: 10, right: 10, bottom: 3),
                          alignment: Alignment.center,
                          // color: Color.fromRGBO(247, 248, 251, 1),
                          child: Image(
                            image: AssetImage(
                              "assets/home_image/camera.png",
                            ),
                            width: 60,
                            height: 60,
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(
                              left: 4, top: 5, right: 4, bottom: 0),
                          child: Text(
                            "camera".tr,
                            style: TextStyle(
                              fontFamily: 'Comfortaa',
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(
                              left: 15, top: 0, right: 15, bottom: 10),
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
                  )),
              InkWell(
                  onTap: () {
                    pickImage();
                    // _showMyDialog();
                    Fluttertoast.showToast(
                        msg: "toastgallery".tr,
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Color.fromRGBO(230, 233, 242, 1),
                        textColor: Colors.black,
                        fontSize: 16.0);
                  }, // handle your onTap here
                  child: Container(
                    margin: EdgeInsets.only(
                        left: 15, top: 10, right: 10, bottom: 20),
                    width: 110,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(
                              left: 10, top: 10, right: 10, bottom: 3),
                          alignment: Alignment.center,
                          child: Image(
                            image: AssetImage(
                              "assets/home_image/gallery.png",
                            ),
                            width: 60,
                            height: 60,
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(
                              left: 4, top: 5, right: 4, bottom: 0),
                          child: Text(
                            "gallery".tr,
                            style: TextStyle(
                                fontFamily: 'Comfortaa',
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w700),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(
                              left: 15, top: 0, right: 15, bottom: 10),
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
                  )),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          _outputs != null && _outputs[0]['label'] == "0 Poisonous"
              ? Container(
                  margin:
                      EdgeInsets.only(left: 10, top: 10, right: 20, bottom: 20),
                  width: 220,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(
                            left: 10, top: 10, right: 10, bottom: 3),
                        alignment: Alignment.center,
                        // color: Color.fromRGBO(247, 248, 251, 1),
                        child: Image(
                          image: AssetImage(
                            "assets/home_image/poisonous.png",
                          ),
                          width: 80,
                          height: 80,
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                            left: 4, top: 5, right: 4, bottom: 0),
                        child: Text(
                          "poisonous".tr,
                          style: TextStyle(
                            fontFamily: 'Comfortaa',
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Colors.red,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                            left: 15, top: 0, right: 15, bottom: 10),
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
                )
              : Container(),
          _outputs != null && _outputs[0]['label'] == "1 Edible   "
              ? Container(
                  margin:
                      EdgeInsets.only(left: 10, top: 10, right: 20, bottom: 20),
                  width: 220,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(
                            left: 10, top: 10, right: 10, bottom: 3),
                        alignment: Alignment.center,
                        // color: Color.fromRGBO(247, 248, 251, 1),
                        child: Image(
                          image: AssetImage(
                            "assets/home_image/edible.png",
                          ),
                          width: 80,
                          height: 80,
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                            left: 4, top: 5, right: 4, bottom: 0),
                        child: Text(
                          "non-poisonous".tr,
                          style: TextStyle(
                            fontFamily: 'Comfortaa',
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Colors.green,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                            left: 15, top: 0, right: 15, bottom: 10),
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
                )
              : Container(),
          _outputs != null && _outputs[0]['label'] == "2 Undefined"
              ? Container(
                  margin:
                      EdgeInsets.only(left: 10, top: 10, right: 20, bottom: 20),
                  width: 220,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(
                            left: 10, top: 10, right: 10, bottom: 3),
                        alignment: Alignment.center,
                        // color: Color.fromRGBO(247, 248, 251, 1),
                        child: Image(
                          image: AssetImage(
                            "assets/home_image/undefined.png",
                          ),
                          width: 80,
                          height: 80,
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                            left: 4, top: 5, right: 4, bottom: 0),
                        child: Text(
                          "undefined".tr,
                          style: TextStyle(
                            fontFamily: 'Comfortaa',
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Color.fromRGBO(31, 207, 193, 1),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                            left: 15, top: 0, right: 15, bottom: 10),
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
                )
              : Container(),
          SizedBox(
            height: 10,
          ),
          _outputs == null
              ? Container(
                  margin:
                      EdgeInsets.only(left: 30, top: 0, right: 30, bottom: 30),
                  width: 300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(
                            left: 10, top: 10, right: 10, bottom: 0),
                        alignment: Alignment.center,
                        child: Image(
                          image: AssetImage(
                            'assets/home_image/logo.gif',
                          ),
                          width: 50,
                          height: 50,
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                            left: 4, top: 0, right: 4, bottom: 0),
                        child: Text(
                          "takephptporgalery".tr,
                          style: TextStyle(
                              fontFamily: 'Comfortaa',
                              fontSize: 16,
                              color: Colors.green,
                              fontWeight: FontWeight.w700),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                            left: 15, top: 0, right: 15, bottom: 10),
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
                )
              : Container(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 20),

                    //color: Color.fromRGBO(0, 239, 209, 1),
                    child: Text(
                      "dg".tr +
                          "${_outputs[0]['label'].substring(11)} : ${(_outputs[0]['confidence'] * 100).toStringAsFixed(1)} %",
                      style: TextStyle(
                          fontFamily: 'Comfortaa',
                          fontSize: 19,
                          color: Color.fromRGBO(0, 172, 234, 1),
                          fontWeight: FontWeight.w700),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
        ]),
      )),
    );
  }
}
