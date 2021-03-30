import 'package:flutter/material.dart';

const primarySwatch = Colors.blue;
ButtonStyle defaultButtonDecoration =
    ElevatedButton.styleFrom(primary: Colors.green);
String situation = "Login";
String createSituation = "Create Account";
String loginButtonText = "Log in";
String createButtonText = "Create Account";
Color loginBoxColor = Colors.white;
TextStyle situationTextStyle = TextStyle(fontSize: 36);
TextStyle clickableText = TextStyle(color: Colors.blue);
String emailValidRegex = "[\w-]+@([\w-]+\.)+[\w-]+";
var mobileLoginTabButtonStyleActive = ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.blue[100]),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
    )));
var mobileLoginTabButtonStylePassive = ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
    )));
var loginBoxDecoration = BoxDecoration(
    borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
    color: loginBoxColor,
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.2),
        spreadRadius: 5,
        blurRadius: 10,
        offset: Offset(0, 5),
      )
    ]);

ButtonStyle appBarButtonDecoration = ElevatedButton.styleFrom(
    primary: Colors.green,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    );
