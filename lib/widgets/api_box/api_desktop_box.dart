import 'package:flutter/material.dart';
import 'package:soul_meter/widgets/buttons/api_buttons.dart';

class ApiDesktopBox extends StatefulWidget {
  @override
  _ApiDesktopBoxState createState() => _ApiDesktopBoxState();
}

class _ApiDesktopBoxState extends State<ApiDesktopBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(start: 20, end: 300, top: 200),
      width: 300,
      height: 500,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ApiButtonWidget("Spotify"),
          ApiButtonWidget("Netflix"),
          ApiButtonWidget("Steam"),
        ],
      ),
    );
  }
}
