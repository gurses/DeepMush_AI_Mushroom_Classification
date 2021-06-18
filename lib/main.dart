import 'package:flutter/material.dart';
import 'package:tflite_example/navigation_bar/info.dart';
import 'package:tflite_example/navigation_bar/home.dart';
import 'package:tflite_example/navigation_bar/mushrooms.dart';
import 'package:tflite_example/navigation_bar/settings.dart';
import 'package:animated_splash/animated_splash.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:tflite_example/translate.dart';
import 'translate.dart';
import 'package:share/share.dart';

void main() {
  Function duringSplash = () {
    print('Something background process');
    int a = 123 + 23;
    print(a);

    if (a > 100)
      return 1;
    else
      return 2;
  };

  Map<int, Widget> op = {1: MyApp()};

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: AnimatedSplash(
      imagePath: 'assets/mushrooms.gif',
      home: MyApp(),
      customFunction: duringSplash,
      duration: 3100,
      type: AnimatedSplashType.BackgroundProcess,
      outputAndHome: op,
    ),
  ));
}

class MyApp extends StatelessWidget {
  final keyIsFirstLoaded = 'is_first_loaded';
  String text =
      'https://play.google.com/store/apps/details?id=com.deepmush_app&hl=tr';
  String subject = 'Download the app.';
  List<String> imagePaths = [];
  bool clicked = false;
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () {
      showDialogIfFirstLoaded(context);
    });
    return GetMaterialApp(
        translations: Messages(), // your translations
        locale: Get.deviceLocale,
        fallbackLocale: Locale('en',
            'US'), // specify the fallback locale in case an invalid locale is selected.
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
                actions: [
                  IconButton(
                    color: Color.fromRGBO(8, 56, 99, 1),
                    icon: Icon(Icons.share),
                    onPressed: () {
                      _onShare(context);
                    },
                  )
                ],
                title: Text('DeepMush',
                    style: TextStyle(
                      fontFamily: 'Comfortaa',
                      color: Color.fromRGBO(8, 56, 99, 1),
                    )),
                backgroundColor: Color.fromRGBO(230, 233, 242, 1),
                centerTitle: true),
            //backgroundColor: Color.fromRGBO(61, 62, 61, 1)),
            body: Center(child: Demo())));
  }

  showDialogIfFirstLoaded(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstLoaded = prefs.getBool(keyIsFirstLoaded);
    if (isFirstLoaded == null) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          // return object of type Dialog
          return WillPopScope(
              onWillPop: () async => false,
              child: AlertDialog(
                title: Column(children: [
                  Image.asset(
                    'assets/info/dikkat.gif',
                    width: 80,
                    height: 80,
                    fit: BoxFit.contain,
                  ),
                  Text(
                    "attention".tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Comfortaa',
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                  Text("attentiongiris".tr,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontFamily: 'Comfortaa', fontSize: 15))
                ]),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                actions: <Widget>[
                  MaterialButton(
                    shape: StadiumBorder(),
                    minWidth: 100,
                    color: Colors.green,
                    child: Text('agree'.tr,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'Comfortaa',
                            fontSize: 15,
                            fontWeight: FontWeight.w700)),
                    onPressed: () {
                      // Close the dialog
                      Navigator.of(context).pop();
                      prefs.setBool(keyIsFirstLoaded, false);
                    },
                  ),
                ],
              ));
        },
      );
    }
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

class Demo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DemoState();
  }
}

class DemoState extends State<Demo> {
  final List<Widget> tabs = [
    HomePage(),
    Mushrooms(),
    Info(),
    Settings(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();

  int _selectedIndex = 0;

  Widget _bottomNavigationBar(int selectedIndex) => Container(
        child: BottomNavigationBar(
          elevation: 2.5,
          type: BottomNavigationBarType.fixed,
          onTap: (int index) => setState(() => _selectedIndex = index),
          currentIndex: selectedIndex,
          selectedItemColor: Color.fromRGBO(0, 239, 209, 1),
          unselectedFontSize: 12,
          selectedFontSize: 14,
          unselectedItemColor: Color.fromRGBO(0, 172, 234, 1),
          backgroundColor: Color.fromRGBO(233, 234, 237, 1),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/Icons/icon_home.png")),
              title: Text(
                'home'.tr,
                style: TextStyle(
                    fontFamily: 'Comfortaa',
                    color: Color.fromRGBO(8, 56, 99, 1),
                    fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              ),
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/Icons/icon_mushrooms.png")),
              title: Text(
                'mushrooms'.tr,
                style: TextStyle(
                    fontFamily: 'Comfortaa',
                    color: Color.fromRGBO(8, 56, 99, 1),
                    fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              ),
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/Icons/icon_info.png")),
              title: Text(
                'DeepMush',
                style: TextStyle(
                    fontFamily: 'Comfortaa',
                    color: Color.fromRGBO(8, 56, 99, 1),
                    fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              ),
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/Icons/icon_settings.png")),
              title: Text(
                'settings'.tr,
                style: TextStyle(
                    fontFamily: 'Comfortaa',
                    color: Color.fromRGBO(8, 56, 99, 1),
                    fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomNavigationBar(_selectedIndex),
      body: PageStorage(
        child: tabs[_selectedIndex],
        bucket: bucket,
      ),
    );
  }
}
