import 'package:flutter/material.dart';

const primarySwatch = Colors.blue;
ButtonStyle defaultButtonDecoration =
    ElevatedButton.styleFrom(primary: Colors.black);
String situation = "Login";
String createSituation = "Create Account";
String loginButtonText = "Log in";
String createButtonText = "Create Account";
Color loginBoxColor = Colors.grey;
TextStyle situationTextStyle = TextStyle(fontSize: 36);
TextStyle clickableText = TextStyle(color: Colors.blue);
String emailValidRegex = "[\w-]+@([\w-]+\.)+[\w-]+";
var mobileLoginTabButtonStyle = ButtonStyle(
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
  borderRadius: BorderRadius.only(
      topLeft: Radius.circular(9), topRight: Radius.circular(9)),
)));
