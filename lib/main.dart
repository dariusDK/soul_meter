import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:soul_meter/constants/constants.dart';
import 'package:soul_meter/home_view/home_page_view.dart';
import 'package:soul_meter/login_view/login_page_view.dart';

void main() {
  Firebase.initializeApp().then((value) {
    if (value != null) {
      auth = FirebaseAuth.instanceFor(app: value);
      runApp(MyApp());
    } else
      print("firebase bağlantısı kurulamadı.");
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Application();
  }
}

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: primarySwatch,
      ),
      home: MainPage(), //değiş
      routes: <String, WidgetBuilder>{
        "/login": (BuildContext context) => LoginPage(),
        "/home": (BuildContext context) => HomePage(),
      },
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
        stream: auth.authStateChanges(),
        builder: (context, snapshot) {
          return Container(
              child: auth.currentUser != null ? HomePage() : LoginPage());
        });
  }
}
