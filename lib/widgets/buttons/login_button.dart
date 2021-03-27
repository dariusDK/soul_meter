import 'package:flutter/material.dart';
import 'package:soul_meter/constants/constants.dart';

class LoginButtonWidget extends StatefulWidget {
  @override
  _LoginButtonWidgetState createState() => _LoginButtonWidgetState();
}

class _LoginButtonWidgetState extends State<LoginButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        child: Text("tıkla"),
        style: defaultButtonDecoration,
        onPressed: () {
          situation = "Kaydol";
        },
      ),
    );
  }
}
