import 'package:flutter/material.dart';
import 'package:soul_meter/login_view/login_page_view_desktop.dart';
import 'package:soul_meter/login_view/login_page_view_mobile.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(Icons.menu),
        title: Text(
          "Soul Meter",
          style: TextStyle(
            color: Colors.lightBlue[300],
            fontSize: 36,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: MediaQuery.of(context).size.width < 600.0
            ? LoginPageMobile()
            : LoginPageDesktop(),
      ),
    );
  }
}
