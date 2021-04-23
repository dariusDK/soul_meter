import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:soul_meter/constants/constants.dart';
import 'package:soul_meter/home_view/home_page_view.dart';
import 'package:soul_meter/login_view/login_page_view.dart';

void main() {
  bool isAuthucanted = false;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          return Application(
            isAuth: false,
          );
        });
  }
}

class Application extends StatelessWidget {
  final bool isAuth;

  const Application({Key key, this.isAuth}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: primarySwatch,
      ),
      home: isAuth ? HomePage() : LoginPage(), //değiş
      routes: <String, WidgetBuilder>{
        "/login": (BuildContext context) => LoginPage(),
        "/home": (BuildContext context) => HomePage(),
      },
    );
  }
}
