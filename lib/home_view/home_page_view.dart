import 'package:flutter/material.dart';
import 'package:soul_meter/constants/constants.dart';
import 'package:soul_meter/functions/basic_functions.dart';
import 'package:soul_meter/home_view/home_page_view_desktop.dart';
import 'dart:js' as js;

class HomePage extends StatefulWidget {
  HomePage() {
    getUserStatus(userEmail).then((value) => print(value));
  }
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomePageDesktop(),
    );
  }
}
