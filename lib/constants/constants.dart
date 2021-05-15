import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:soul_meter/user/user.dart';

///      Dev Mode
bool isLocal = false;

/// canlıya geçince değiştir
const primarySwatch = Colors.blue;
ButtonStyle defaultButtonDecoration =
    ElevatedButton.styleFrom(primary: Colors.green, minimumSize: Size(130, 20));
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

ButtonStyle apiButtonDecoration = ElevatedButton.styleFrom(
  // context gerek olduğundan kullanılmıyo
  primary: Colors.green,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
  minimumSize: Size(200, 40),
);
PopupMenuItem appBarMenuItem = PopupMenuItem(
    child: Row(children: [
  Icon(Icons.account_balance_outlined),
  Text("settings"),
]));

var isSpotifySelected = ValueNotifier(false);
var isNetflixSelected = ValueNotifier(false);
var isSteamSelected = ValueNotifier(false);
var rateResult = ValueNotifier(0.0);
var isRatingOver = ValueNotifier(false);
var isRatingStart = ValueNotifier(false);
var currentUser;

String spAuthCode = "";
String userEmail = "";
String userName = "";
String serverUrl = "managed-uaesyu2fxa-et.a.run.app";

//-----------Spotiffy---------
String spClientID = "f1c7433d34324ec5bd7edc2885ea0e5c";
String spResponseType = "code";
String spRedirectUrl = "https://managed-uaesyu2fxa-et.a.run.app/spauth";
String spScope =
    "user-read-private%20user-read-email%20user-top-read%20user-read-playback-state%20user-library-read%20playlist-read-private%20playlist-read-collaborative";

//-----------------------------------
String spAuthUrl = "https://accounts.spotify.com/authorize";
FirebaseAuth auth;
ValueNotifier<Map<String, bool>> states = ValueNotifier({});
