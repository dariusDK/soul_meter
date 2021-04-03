import 'package:flutter/material.dart';
import 'package:soul_meter/constants/constants.dart';
import 'package:soul_meter/widgets/buttons/home_appbar_button.dart';

class CustomDesktopAppBar extends StatefulWidget {
  @override
  _CustomDesktopAppBarState createState() => _CustomDesktopAppBarState();
}

class _CustomDesktopAppBarState extends State<CustomDesktopAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        margin: EdgeInsets.only(top: 10, right: 10, left: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            //color: Colors.grey.shade100, //tema rengi
            boxShadow: kElevationToShadow[24],
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.purple, Colors.blue])),
        child: Center(
          child: Row(
            children: [
              ValueListenableBuilder(
                  valueListenable: isSpotifySelected,
                  builder: (context, value, child) {
                    return Visibility(
                        visible: value, child: HomeAppbarButton());
                  })
            ],
          ),
        ));
  }
}
