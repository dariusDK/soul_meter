import 'package:flutter/material.dart';
import 'package:soul_meter/login_view/login_page_view_desktop.dart';
import 'package:soul_meter/login_view/login_page_view_mobile.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MediaQuery.of(context).size.width < 600.0
            ? LoginPageMobile()
            : LoginPageDesktop(),
      ),
    );
  }
}
