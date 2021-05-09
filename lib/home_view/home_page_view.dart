import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:soul_meter/constants/constants.dart';
import 'package:soul_meter/functions/basic_functions.dart';
import 'package:soul_meter/home_view/home_page_view_desktop.dart';

import 'package:soul_meter/home_view/home_page_view_mobile.dart';
import 'package:soul_meter/widgets/custom_appbar/custom_mobile_side_bar.dart';

import 'package:soul_meter/widgets/custom_appbar/mobile_appbar.dart';

import 'package:soul_meter/widgets/custom_appbar/mobile_appbar.dart';

class HomePage extends StatefulWidget {
  /*HomePage() {
    auth.authStateChanges().last.then((value) => getUserStatus(value.email));
  }*/
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User>(
          stream: auth.authStateChanges(),
          builder: (context, snapshot) {
            snapshot.data != null ? getUserStatus(snapshot.data.email) : null;
            return Center(
              child: MediaQuery.of(context).size.width > 600.0
                  ? HomePageDesktop()
                  : MobileAppbar(),
            );
          }),
      //appBar: MediaQuery.of(context).size.width < 600.0 ? MobileAppbar() : null,
    );
  }
}
