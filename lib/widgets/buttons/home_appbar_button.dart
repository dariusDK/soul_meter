import 'dart:html';

import 'package:flutter/material.dart';
import 'package:soul_meter/constants/constants.dart';

class HomeAppbarButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Tooltip(
          message: 'Spotify Datas',
          child: Text(
            'Spotify',
            style:
                TextStyle(color: Colors.black, decoration: TextDecoration.none),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            gradient: LinearGradient(colors: <Color>[Colors.red, Colors.amber]),
          ),
          height: 150,
          margin: EdgeInsets.all(30.0),
          textStyle: TextStyle(
            fontSize: 24,
          ),
          showDuration: Duration(seconds: 2),
          waitDuration: Duration(seconds: 1),
        ),
      ),
    );
  }
}
