import 'package:flutter/material.dart';
import 'package:soul_meter/constants/constants.dart';
import 'package:soul_meter/widgets/search/search_bar_desktop.dart';
import 'dart:ui' as ui;

class SearchBarDesktopBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width / 3,
        padding: EdgeInsets.only(left: 50, top: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "How many soulmeter between you and...",
              style: TextStyle(
                fontSize: 66,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            SearchBarDesktop()
          ],
        ));
  }
}
