import 'package:flutter/material.dart';
import 'package:soul_meter/constants/constants.dart';
import 'package:soul_meter/functions/basic_functions.dart';
import 'package:soul_meter/widgets/text_box/default_text_box.dart';

class LoginTab extends StatelessWidget {
  final emailTextWidget = DefaultTextBoxWidget("e-mail", Icons.mail, false);
  final passwordTextWidget = DefaultTextBoxWidget("password", Icons.lock, true);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          emailTextWidget,
          passwordTextWidget,
          ElevatedButton(
            onPressed: () {
              login(emailTextWidget.getText, passwordTextWidget.getText);
            },
            child: Text(loginButtonText),
            style: defaultButtonDecoration,
          )
        ],
      ),
    );
  }
}
