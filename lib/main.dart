import 'package:flutter/material.dart';
import 'package:soul_meter/constants/constants.dart';
import 'package:soul_meter/home_view/home_page_view.dart';
import 'package:soul_meter/login_view/login_page_view.dart';
import 'dart:ui';
import 'constants/state_container.dart';

void main() {
  bool isAuthucanted = false;
  runApp(MyApp(isAuthucanted));
}

class MyApp extends StatelessWidget {
  final bool isAuth;
  MyApp(this.isAuth);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: primarySwatch,
      ),
      home: !isAuth ? HomePage() : LoginPage(), //değiş
      routes: <String, WidgetBuilder>{
        "/login": (BuildContext context) => LoginPage(),
        "/home": (BuildContext context) => HomePage(),
      },
    );
  }
}
