import 'package:flutter/material.dart';
import 'package:soul_meter/constants/constants.dart';

class LoginSituationWidget extends StatefulWidget {
  const LoginSituationWidget(this.situation);

  @override
  _State createState() => _State();
  final String situation;
}

class _State extends State<LoginSituationWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        widget.situation,
        style: situationTextStyle,
      ),
    );
  }
}
