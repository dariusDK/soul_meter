import 'package:flutter/material.dart';
import 'package:soul_meter/widgets/api_box/api_desktop_box.dart';
import 'package:soul_meter/widgets/custom_appbar/custom_desktop_appbar.dart';
import 'package:soul_meter/widgets/desktop/home/desktop_result_box.dart';

import 'package:soul_meter/widgets/search/search_bar_desktop_box.dart';

class HomePageDesktop extends StatefulWidget {
  @override
  _HomePageDesktopState createState() => _HomePageDesktopState();
}

class _HomePageDesktopState extends State<HomePageDesktop> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CustomDesktopAppBar(),
          Container(
            child: Row(
              children: [
                ApiDesktopBox(),
                SearchBarDesktopBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
