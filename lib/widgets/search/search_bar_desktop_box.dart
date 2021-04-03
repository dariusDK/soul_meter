import 'package:flutter/material.dart';
import 'package:soul_meter/constants/constants.dart';
import 'package:soul_meter/widgets/search/search_bar_desktop.dart';
import 'dart:ui' as ui;

class SearchBarDesktopBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 600,
        height: 185,
        child: Column(
          children: [
            Text(
              "Find Your Soulmate",
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
