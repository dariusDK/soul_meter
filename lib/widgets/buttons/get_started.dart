import 'package:flutter/material.dart';
import 'package:soul_meter/constants/constants.dart';

class GetStartedButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 13,
      width: MediaQuery.of(context).size.width / 6,
      child: TextButton(
          style: getStartedButtonDecoration,
          onPressed: () {},
          child: Text(
            "Get Started",
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.width *
                    MediaQuery.of(context).size.height /
                    30000,
                color: Colors.grey[300]),
          )),
    );
  }
}
