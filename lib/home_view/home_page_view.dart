import 'package:flutter/material.dart';
import 'package:soul_meter/constants/constants.dart';
import 'package:soul_meter/functions/basic_functions.dart';
import 'package:soul_meter/home_view/home_page_view_desktop.dart';

import 'package:soul_meter/home_view/home_page_view_mobile.dart';
import 'package:soul_meter/widgets/custom_appbar/custom_mobile_side_bar.dart';
import 'package:soul_meter/widgets/custom_appbar/drawer_mobile.dart';

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
      body: Center(
        child: MediaQuery.of(context).size.width < 600.0
            ? HomePageMobile()
            : HomePageDesktop(),
      ),
      drawer: MediaQuery.of(context).size.width < 600.0 ? DrawerMobile() : null,
    );
  }
}
